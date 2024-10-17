import 'package:flutter/material.dart';
import 'package:tmp/mobex/api_services.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  List _products = [];

  Future<void> _searchProducts() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final title = _titleController.text;
      final products = await Apiservices().getProductsByTitle(context, title);
      setState(() {
        _products = products;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Enter title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _searchProducts,
                  child: Text('Search'),
                ),
                SizedBox(height: 20),
                _products.isEmpty
                    ? Center(
                  child: Text('No products found'),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _products[index]['title'],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image(image: NetworkImage(_products[index]['category']['image'])),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text("${_products[index]['description']}",textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                          Divider(),
                          Text(
                            "Price: ${_products[index]['price'].toString()}",
                            style: TextStyle(fontSize: 16, color: Colors.grey), // added price text style
                          ),
                          Divider(),
                          Text(
                            "Category: ${_products[index]['category']['name']}", // renamed to Category
                            style: TextStyle(fontSize: 16, color: Colors.grey), // added category text style
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}