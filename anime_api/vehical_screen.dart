import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/anime_api/vehical_store.dart';

class VehicalScreen extends StatefulWidget {
  const VehicalScreen({super.key});

  @override
  State<VehicalScreen> createState() => _VehicalScreenState();
}

class _VehicalScreenState extends State<VehicalScreen> {
  final VehicalStore vehicalStore = VehicalStore();

  @override
  void initState() {
    super.initState();
    vehicalStore.vehicalapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Data'),
      ),
      body: Observer(
        builder: (_) {
          if (vehicalStore.isloading) {
            return Center(child: CircularProgressIndicator());
          }

          if (vehicalStore.Errro.isNotEmpty) {
            return Center(child: Text('Error: ${vehicalStore.Errro}'));
          }

          final stops = vehicalStore.vehicalModal.stops?.stop ?? [];
          final vehicleInfo = vehicalStore.vehicalModal.vehicleinfo;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('vehicleinfo',textScaleFactor: 1.3,),
                SizedBox(height: 6,),
                if (vehicleInfo != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vehical Name"),
                      Text("s.Name"),
                      Text("Number"),
                      Text("Type"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(vehicleInfo?.name??""),
                      Text(vehicleInfo?.shortname??""),
                      Text(vehicleInfo?.number??""),
                      Text(vehicleInfo?.type??""),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: stops.length,
                    itemBuilder: (context, index) {
                      final stop = stops[index];
                      return ListTile(
                        title: Column(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Station: ${stop?.station??""}"),
                                    Text("Numver id: ${stop?.stationinfo?.id??""}"),
                                    Text("Name: ${stop?.stationinfo?.name??""}"),
                                    Text("Standerd Name: ${stop?.stationinfo?.standardname??""}"),
                                    Text("Plateform: ${stop?.platform??""}"),
                                    Text("Depart Connectiom: ${stop?.departureConnection??""}"),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
