import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/mobex/product_store.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductStore productStore=ProductStore();

  @override
  void initState() {
    productStore.getproduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen'),
      ),
      body: Column(
        children: [
          Observer(
              builder: (_) {
                if(productStore.isloading){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(productStore.error.isNotEmpty){
                  print(productStore.error.isNotEmpty);
                  return Center(child:
                  Text('Opps Somthing want to wrong...!'),);
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: productStore.product.length,
                      itemBuilder: (context, index) {
                        final data=productStore.product;
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data[index].image??""),
                          ),
                          title: Text(data[index].title??""),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].description??""),
                              SizedBox(height: 10,),
                              Text("Price:${data[index].price??""}"),
                              SizedBox(height: 10,),
                              Text("Category:${data[index].category??""}"),
                              SizedBox(height: 10,),
                              Text("Rating:${data[index].rating?.rate??""}"),
                            ],
                          )
                        );
                      },
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
