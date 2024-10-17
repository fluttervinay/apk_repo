import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'add_resepe_store.g.dart';

class AddResepeStore = _AddResepeStore with _$AddResepeStore;

abstract class _AddResepeStore with Store {
  @observable
  String error = '';

  @observable
  bool isLoading = false;

  @observable
  Map<String, dynamic>? responseData; // Store the API response data

  @action
  Future<void> addResepeApi(String body, int postId, int userId,BuildContext context) async {
    isLoading = true;
    error = '';
    responseData = null;

    try {
      final response = await http.post(
        Uri.parse("https://dummyjson.com/comments/add"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "body": body,
          "postId": postId,
          "userId": userId,
        }),
      );

      if (response.statusCode == 201) {
        print("CHEK API==${response.body}");
        responseData = json.decode(response.body);

        print('Resepe Add Success');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Resepe Add Success'),
          ),
        );

        // Pretty-print the JSON response for better debugging
        final prettyJson = JsonEncoder.withIndent('  ').convert(responseData);
        print('API RESPONSE :\n$prettyJson');
      } else {
        error = 'Failed to add resepe: ${response.statusCode}';
        print('Error Response Body: ${response.body}');
      }
    } catch (e) {
      error = 'Error occurred: ${e.toString()}';
      print('Exception: $e');
    } finally {
      isLoading = false;
    }
  }
}
