import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'quets_store.g.dart';

class QuetsStore =_quetsstore with _$QuetsStore;

abstract class _quetsstore with Store{
  @observable
  Quets quets=Quets();

  @observable
  bool isloading=false;

  @observable
  String Error='';

  Future<void>getquets()async{
    isloading=true;
    Error='';

    try{
      final response=await http.get(Uri.parse('https://dummyjson.com/quotes'));
      // print("API RESPONSE==>${response.body}");

      if(response.statusCode==200){
        //when api response in object
        final jsonData = jsonDecode(response.body);
        quets = Quets.fromJson(jsonData);

        // API RESPONSE, pretty-print the JSON response
        final prettyJson = JsonEncoder.withIndent('  ').convert(jsonData);
        debugPrint('json api response:\n$prettyJson',wrapWidth: 1024);
      }
    }catch(e){
     print("Error==>${e.toString()}");
    }finally{
      isloading=false;
    }
  }
}

class Quets {
  List<Quotes>? quotes;
  int? total;
  int? skip;
  int? limit;

  Quets({this.quotes, this.total, this.skip, this.limit});

  Quets.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(new Quotes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Quotes {
  int? id;
  String? quote;
  String? author;

  Quotes({this.id, this.quote, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}
