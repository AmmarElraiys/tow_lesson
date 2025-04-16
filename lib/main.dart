import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tow_lesson/home_screen.dart';
import 'package:tow_lesson/models/cart.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Cart(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Provider Example', home: HomeScreen());
  }
}
