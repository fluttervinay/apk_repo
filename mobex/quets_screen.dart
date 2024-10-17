import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/mobex/quets_store.dart';

class QuetsScreen extends StatefulWidget {
  const QuetsScreen({super.key});

  @override
  State<QuetsScreen> createState() => _QuetsScreenState();
}

class _QuetsScreenState extends State<QuetsScreen> {
  final QuetsStore quetsStore = QuetsStore();

  @override
  void initState() {
    quetsStore.getquets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quets Screen'),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              if (quetsStore.isloading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (quetsStore.Error.isNotEmpty) {
                return const Center(child: Text('Oops, something went wrong.'));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: quetsStore.quets.quotes?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(quetsStore.quets.quotes![index].id.toString()),
                      ),
                      title: Text("Auther: ${quetsStore.quets.quotes![index].author??""}"),
                      subtitle: Text(quetsStore.quets.quotes![index].quote??""),

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
