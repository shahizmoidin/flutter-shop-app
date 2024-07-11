import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

import 'package:shop_app_flutter/pages/homepage.dart';

//provider
//future provider
//streamprovider
//changenotifierprovider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.yellow, primary: Colors.yellow),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
            textTheme: const TextTheme(
                titleLarge:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                titleMedium:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                bodySmall:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
            useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
