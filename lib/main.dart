import 'package:filter_of_list_view_items/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(FilterListViwProject());

class FilterListViwProject extends StatelessWidget {
  const FilterListViwProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MainPage(),
    );
  }
}

