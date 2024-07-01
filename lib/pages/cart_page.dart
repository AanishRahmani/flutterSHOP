import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutter/cart_provider.dart';
// import 'package:shopflutter/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyCart'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'delete product',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: const Text('ARE YOU SURE?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'NO',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'yes',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('size: ${cartItem['size']}'),
            );
          }),
    );
  }
}
