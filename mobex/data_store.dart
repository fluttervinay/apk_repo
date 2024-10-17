// // lib/store/data_store.dart
// import 'package:mobx/mobx.dart';
// import 'package:tmp/mobex/api_services.dart';
// part 'data_store.g.dart';
//
// class DataStore = _DataStoreBase with _$DataStore;
//
// abstract class _DataStoreBase with Store {
//   final Apiservices _apiService = Apiservices();
//
//  @observable
//  Map<String,dynamic>?data;
//
//   @observable
//   bool isLoading = false;
//
//   @observable
//   String? error;
//
//   @action
//   Future<void> fetchData(dynamic) async {
//     isLoading = true;
//     error = null;
//     try {
//       data = await _apiService.getdata();
//     } catch (e) {
//       error = e.toString();
//     } finally {
//       isLoading = false;
//     }
//   }
// }
