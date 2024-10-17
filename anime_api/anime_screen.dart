import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/anime_api/anime_store.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {

  final AnimeStore animeStore=AnimeStore();

  @override
  void initState() {
    animeStore.animeapi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
              builder: (_) {
                if(animeStore.isloading){
                  return Center(child: CircularProgressIndicator());
                }
                if(animeStore.Error.isNotEmpty){
                  return Center(child: Text('Opps Somthig want to wrong'),);
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: animeStore.animeModel.content?.length??0,
                        itemBuilder: (context, index) {
                          final anime=animeStore.animeModel.content?[index];
                          return ListTile(
                            title: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue[100]!, Colors.white],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: CircleBorder(),
                                                content: Container(
                                                  width: 200, // Adjust the width and height to change the size of the circle
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(anime?.img ?? ""),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: CircleAvatar(
                                          radius: 60,
                                          backgroundImage: NetworkImage(anime?.img ?? ""),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        anime?.name??"",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        "${anime?.age??""} years old",
                                        style: TextStyle(fontSize: 18, color: Colors.black54),
                                      ),
                                      Text(
                                        "Gender: ${anime?.gender??""}",
                                        style: TextStyle(fontSize: 16, color: Colors.black54),
                                      ),
                                      Text(
                                        "Race: ${anime?.race??""}",
                                        style: TextStyle(fontSize: 16, color: Colors.black54),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Description:",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              anime?.description??"",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.blue[50],
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Quote:",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '"${anime?.quote??""}"',
                                              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          );
                        },
                    )
                );
              },
          ),
        ],
      ),
    );
  }
}
