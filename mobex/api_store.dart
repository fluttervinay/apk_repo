import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'api_store.g.dart';

class ApiStore = _ApiStore with _$ApiStore;

abstract class _ApiStore with Store {
  @observable
  ObservableFuture<List<dynamic>>? apiDataFuture;

  @observable
  String errorMessage = '';

  @action
  Future<void> fetchApiData() async {
    try {
      errorMessage = '';
      // Start the API call and wrap it with an ObservableFuture
      apiDataFuture = ObservableFuture(_getDataFromApi());
      await apiDataFuture;
    } catch (error) {
      errorMessage = error.toString();
    }
  }

  Future<List<dynamic>> _getDataFromApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print("API RESPONSE==>${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
