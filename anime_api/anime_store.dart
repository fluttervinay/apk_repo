import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'anime_store.g.dart';

class AnimeStore = _AnimeStore with _$AnimeStore;

abstract class _AnimeStore with Store {

  @observable
  String Error='';

  @observable
  bool isloading=false;

  @observable
  AnimeModel animeModel=AnimeModel();

  Future<void>animeapi()async{
    isloading=true;
    Error='';

    try{
      final response=await http.get(Uri.parse('https://www.demonslayer-api.com/api/v1/characters'));
      if(response.statusCode==200){
        final jsonData=jsonDecode(response.body);
        animeModel= AnimeModel.fromJson(jsonData);

        final pretyresponse= JsonEncoder.withIndent(' ').convert(jsonData);
        debugPrint("API RESPONSE:\n${pretyresponse}",wrapWidth: 1024);
      }
    }catch(e){
      print('Error==> ${e.toString()}');
    }finally{
      isloading=false;
    }
  }
}

class AnimeModel {
  Pagination? pagination;
  List<Content>? content;

  AnimeModel({this.pagination, this.content});

  AnimeModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? totalElements;
  int? elementsOnPage;
  int? currentPage;
  int? totalPages;
  String? previousPage;
  String? nextPage;

  Pagination(
      {this.totalElements,
        this.elementsOnPage,
        this.currentPage,
        this.totalPages,
        this.previousPage,
        this.nextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalElements = json['totalElements'];
    elementsOnPage = json['elementsOnPage'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    previousPage = json['previousPage'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalElements'] = this.totalElements;
    data['elementsOnPage'] = this.elementsOnPage;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['previousPage'] = this.previousPage;
    data['nextPage'] = this.nextPage;
    return data;
  }
}

class Content {
  int? id;
  String? name;
  int? age;
  String? gender;
  String? race;
  String? description;
  String? img;
  int? affiliationId;
  int? arcId;
  String? quote;

  Content(
      {this.id,
        this.name,
        this.age,
        this.gender,
        this.race,
        this.description,
        this.img,
        this.affiliationId,
        this.arcId,
        this.quote});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    race = json['race'];
    description = json['description'];
    img = json['img'];
    affiliationId = json['affiliation_id'];
    arcId = json['arc_id'];
    quote = json['quote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['race'] = this.race;
    data['description'] = this.description;
    data['img'] = this.img;
    data['affiliation_id'] = this.affiliationId;
    data['arc_id'] = this.arcId;
    data['quote'] = this.quote;
    return data;
  }
}
