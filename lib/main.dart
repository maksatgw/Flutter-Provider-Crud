import 'package:flutter/material.dart';
import 'package:flutter_provider_crud/screens/home/home_view.dart';
import 'package:flutter_provider_crud/screens/home/home_view_model.dart';
import 'package:flutter_provider_crud/screens/productadd/product_view_model.dart';
import 'package:provider/provider.dart';
import './core/global/globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => ProductViewModel()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const HomeView(),
      ),
    );
  }
}
