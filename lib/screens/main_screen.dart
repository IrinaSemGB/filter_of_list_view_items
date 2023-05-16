import 'package:filter_of_list_view_items/database/product_database.dart';
import 'package:flutter/material.dart';
import '../models/product_class.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Product> products = ProductDataBase().products;
  List<String> categories = [];
  List<String> selectedCategories = [];

  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    for (var product in products) {
      if (!categories.contains(product.category))
      categories.add(product.category);
    }
  }

  void searchProduct(String inputText) {
    final results = ProductDataBase().products.where((product) {
      final productName = product.name.toLowerCase();
      final input = inputText.toLowerCase();
      return productName.contains(input);
    }).toList();
    setState(() => products = results);
  }


  @override
  Widget build(BuildContext context) {

    final heightScreen = MediaQuery.of(context).size.height;

    final filteredProducts = products.where((product) {
      return selectedCategories.isEmpty || selectedCategories.contains(product.category);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.indigo,),
                hintText: 'I\'m looking for',
                hintStyle: TextStyle(
                  color: Color(0xFFA0A0A0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 1.5,
                  ),
                ),
              ),
              onChanged: searchProduct,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.all(10.0),
            height: heightScreen * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: FilterChip(
                    label: Text(category),
                    selected: selectedCategories.contains(category),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                      });
                    },
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ),
          if (filteredProducts.isEmpty && products.isEmpty)
            Container(
              height: 50.0,
              margin: EdgeInsets.symmetric(vertical: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_florist_outlined,
                    size: 30.0,
                    color: Color(0xFFA0A0A0),
                  ),
                  SizedBox(
                    width: 30.0,
                    child: VerticalDivider(
                      color: Color(0xFFA0A0A0),
                    ),
                  ),
                  Text(
                    'Sorry, no results were found for your search',
                    style: TextStyle(
                      color: Color(0xFFA0A0A0),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return Card(
                    elevation: 8.0,
                    color: Colors.indigoAccent,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        title: Text(
                          product.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          product.category,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
