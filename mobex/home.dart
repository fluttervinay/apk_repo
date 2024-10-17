import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'api_store.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ApiStore apiStore = ApiStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOBEX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                apiStore.fetchApiData(); // Call API on button press
              },
              child: Text('Fetch Data'),
            ),
            Observer(
              builder: (_) {
                // Display a loading spinner if the future is pending
                if (apiStore.apiDataFuture == null ||
                    apiStore.apiDataFuture!.status == FutureStatus.pending) {
                  return CircularProgressIndicator();
                }

                // Display error message if there's an error
                if (apiStore.errorMessage.isNotEmpty) {
                  return Text(apiStore.errorMessage);
                }

                // Display the data when the future completes
                if (apiStore.apiDataFuture!.status == FutureStatus.fulfilled) {
                  List<dynamic> data = apiStore.apiDataFuture!.result;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index]['title']),
                        );
                      },
                    ),
                  );
                }
                return Text('No data');
              },
            ),
          ],
        ),
      ),
    );
  }
}
