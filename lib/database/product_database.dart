import 'dart:collection';
import '../models/product_class.dart';

class ProductDataBase {

  final List<Product> _products = [
    Product(name: 'Sandwich', category: 'Food'),
    Product(name: 'Hot Dog', category: 'Food'),
    Product(name: 'Fish', category: 'Food'),
    Product(name: 'Pasta', category: 'Food'),
    Product(name: 'Football', category: 'Sports'),
    Product(name: 'Tennis', category: 'Sports'),
    Product(name: 'Running', category: 'Sports'),
    Product(name: 'Cycle', category: 'Sports'),
    Product(name: 'Apple', category: 'Fruits'),
    Product(name: 'Banana', category: 'Fruits'),
    Product(name: 'Orange', category: 'Fruits'),
    Product(name: 'Tesla', category: 'Vehicle'),
    Product(name: 'Mercedes', category: 'Vehicle'),
    Product(name: 'BMW', category: 'Vehicle'),
  ];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);
}

