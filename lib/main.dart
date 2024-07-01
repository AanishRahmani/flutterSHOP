import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutter/cart_provider.dart';
import 'package:shopflutter/home_page.dart';
// import 'package:shopflutter/home_page.dart';
// import './product_detail_page.dart';
// import './global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            // backgroundColor: Color.fromARGB(255, 114, 55, 214),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        title: 'shop',
        home: const HomePage(),
      ),
    );
  }
}
