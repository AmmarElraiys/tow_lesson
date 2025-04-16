import 'package:flutter/material.dart';
import 'package:tow_lesson/models/items_models.dart';

class Cart extends ChangeNotifier {
  List<ItemsModels> _items = [];

  double _price = 0.0;
  void add(ItemsModels item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }

  void remove(ItemsModels item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return _price;
  }

  List<ItemsModels> get ItemsPag {
    return _items;
  }
}
