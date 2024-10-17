import 'package:flutter/material.dart';
import 'package:tmp/product/product_modal.dart'; // Assuming this contains your `ProductListModal` model
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isLoading = false;
  List<ProductListModal> listModal = [];

  Future<void> getproduct() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var prettyJson = const JsonEncoder.withIndent('  ').convert(jsonResponse);
        debugPrint('json api response:\n$prettyJson', wrapWidth: 1024);

        setState(() {
          listModal = List<ProductListModal>.from(
            jsonResponse.map((x) => ProductListModal.fromJson(x)),
          );
        });
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: listModal.length,
        itemBuilder: (context, index) {
          final product = listModal[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                listModal[index].category?.image??""
              ),
            ),
            title: Text(product.title ?? ""),
            subtitle: Text(product.description ?? ""),
            onTap: () {
              // Navigate to the detail page when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final ProductListModal product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? "Product Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(product.category?.image??"")),
            Text(
              product.title ?? "",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: \$${product.price.toString()}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              product.description ?? "No description available",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // You can add more detailed information about the product here.
          ],
        ),
      ),
    );
  }
}
