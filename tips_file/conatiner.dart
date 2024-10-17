import 'package:flutter/material.dart';

class Boxshadow1 extends StatefulWidget {
  const Boxshadow1({super.key});

  @override
  State<Boxshadow1> createState() => _Boxshadow1();
}

class _Boxshadow1 extends State<Boxshadow1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoration'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20),
        
                  boxShadow: const[
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      blurRadius: 20,
                      spreadRadius: 0.1,
                      offset: Offset(5, 10),
                      color: Colors.blueAccent
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              elevation: 16,
              shadowColor: Colors.indigoAccent,
              color: Colors.red,
              child: SizedBox(
                height: 300,
                width: 300,
              ),
            ),

            SizedBox(height: 30,),
            PhysicalModel(
                color: Colors.blueAccent,
                elevation: 16,
                shadowColor: Colors.red,
                child: SizedBox(
                  height: 300,
                  width: 300,
                ),
            )
          ],
        ),
      ),
    );
  }
}
