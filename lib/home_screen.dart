import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tow_lesson/models/cart.dart';
import 'package:tow_lesson/models/items_models.dart';
import 'package:tow_lesson/screens/checkout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemsModels> items = [
    ItemsModels(name: "iPhone 16", price: 2500, image: "assets/images/boy.png"),
    ItemsModels(name: "iPhone 15", price: 2000, image: "assets/images/boy.png"),
    ItemsModels(name: "iPhone 14", price: 1000, image: "assets/images/boy.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.lightBlue,
        actions: [
          Consumer<Cart>(
            builder: (context, model, child) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // pushReplacement yerine push
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      "${model.count}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Card(
            child: Consumer<Cart>(
              builder: (context, model, child) {
                return ListTile(
                  title: Text(items[i].name),
                  subtitle: Text("${items[i].price} \$"),
                  trailing: IconButton(
                    onPressed: () {
                      model.add(items[i]);
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                  leading: Image.asset(items[i].image, width: 100, height: 100),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
