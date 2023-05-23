import 'package:flutter/material.dart';
import 'package:karinashop/screens/home.dart';
import 'package:karinashop/shared/theme.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

 main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CartManager>(create: (_) => CartManager()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ktheme = KTheme.light();
    return MaterialApp(
      title: 'Karina Shop',
      theme: ktheme,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
