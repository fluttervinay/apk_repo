import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesExpansionTile extends StatefulWidget {
  @override
  _CategoriesExpansionTileState createState() => _CategoriesExpansionTileState();
}

class _CategoriesExpansionTileState extends State<CategoriesExpansionTile> {
  List<dynamic> categories = [];
  final ExpansionTileController expansionTileController=ExpansionTileController();

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Fetch categories on initialization
  }

  Future<void> fetchCategories() async {
    final url = Uri.parse('https://api.escuelajs.co/api/v1/categories');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          categories = json.decode(response.body); // Store the entire category data
        });
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories ExpansionTile'),
      ),
      body: categories.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
        children: [
          ExpansionTile(
            controller: ExpansionTileController(),
            title: Text('Categories'),
            children: categories.map((category) {
              return ListTile(
                onTap: () {
                  expansionTileController.collapse();
                 print(category);
                },
                leading: Image.network(
                  category['image'], // Category image
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(category['name']), // Category name
                subtitle: Text('Category ID: ${category['id']}'), // Additional info (e.g., ID)
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CategoriesExpansionTile()));
}
