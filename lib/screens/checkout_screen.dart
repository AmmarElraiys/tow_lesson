import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tow_lesson/models/cart.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Consumer<Cart>(
        builder: (context, model, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: model.ItemsPag.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("${model.ItemsPag[index].name}"),
                        subtitle: Text("${model.ItemsPag[index].price} \$"),
                        trailing: IconButton(
                          onPressed: () {
                            model.remove(model.ItemsPag[index]);
                          },
                          icon: Icon(Icons.remove_shopping_cart),
                        ),
                        leading: Image.asset(
                          model.ItemsPag[index].image,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Toplam Tutar: ${model.totalprice} \$",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
