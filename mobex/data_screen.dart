// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:tmp/mobex/data_store.dart';
//
// class DataScreen extends StatefulWidget {
//   const DataScreen({super.key});
//
//   @override
//   State<DataScreen> createState() => _DataScreenState();
// }
//
// class _DataScreenState extends State<DataScreen> {
//   final DataStore _dataStore=DataStore();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Screen'),
//       ),
//       body: Observer(
//           builder: (context) {
//             if(_dataStore.isLoading){
//                 return Center(child: CircularProgressIndicator(),);
//             }
//
//             if(_dataStore.error!=null){
//                 return Center(child: Text('oops somthing want to wrong'));
//             }
//
//             if(_dataStore.data!=null){
//                 return Center(child: Text('no data'));
//             }
//             return ListView.builder(
//               itemCount: _dataStore.data!.length,
//               itemBuilder: (context, index) {
//                 final item = _dataStore.data!.values.elementAt(index);
//                 return ListTile(
//                     title: Text(item.toString()),
//                 );
//               },
//             );
//           },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _dataStore.fetchData('https://jsonplaceholder.typicode.com/posts'),
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
