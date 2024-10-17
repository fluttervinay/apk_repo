import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore =_productstore with _$ProductStore;

abstract class _productstore with Store{
  @observable
  List<Product>product=[];

  @observable
  bool isloading=false;

  @observable
  String error=' ';

  Future<void>getproduct()async{
    isloading=true;
    error='';

    try{
      final response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
      print("API RESPONSE==>${response.body}");
      if(response.statusCode==200){
        final List<dynamic> jsonData = json.decode(response.body);
        product = jsonData.map((user) => Product.fromJson(user)).toList();
      }else{
        error='Fail to load Product data';
      }
    }catch(e){
      print("Error==>${e.toString()}");
    }finally{
      isloading=false;
    }
  }

}

class Product {
  int? id;
  String? title;
  dynamic? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  dynamic? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}

