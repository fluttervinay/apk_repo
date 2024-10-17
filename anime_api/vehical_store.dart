import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'vehical_store.g.dart';

class VehicalStore = _vehicalStore with _$VehicalStore;

abstract class _vehicalStore with Store{

  @observable
  String Errro='';

  @observable
  bool isloading=false;

  @observable
  VehicalModal vehicalModal=VehicalModal();

  Future<void>vehicalapi()async{
    Errro='';
    isloading=true;
    try{
      final response= await http.get(Uri.parse('https://api.irail.be/v1/vehicle/?id=BE.NMBS.IC1832&format=json&lang=en&alerts=false'));
      if(response.statusCode==200){
        final jsonData=jsonDecode(response.body);
        vehicalModal=VehicalModal.fromJson(jsonData);

        final pretyjson=JsonEncoder.withIndent(' ').convert(jsonData);
        debugPrint("API RESPONSE==>\n ${pretyjson}",wrapWidth: 1024);
      }
    }catch(e){
      print("Error==> ${e.toString()}");
    }finally{
      isloading=false;
    }
  }
}

class VehicalModal {
  String? version;
  String? timestamp;
  String? vehicle;
  Vehicleinfo? vehicleinfo;
  Stops? stops;

  VehicalModal(
      {this.version,
        this.timestamp,
        this.vehicle,
        this.vehicleinfo,
        this.stops});

  VehicalModal.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    timestamp = json['timestamp'];
    vehicle = json['vehicle'];
    vehicleinfo = json['vehicleinfo'] != null
        ? new Vehicleinfo.fromJson(json['vehicleinfo'])
        : null;
    stops = json['stops'] != null ? new Stops.fromJson(json['stops']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['timestamp'] = this.timestamp;
    data['vehicle'] = this.vehicle;
    if (this.vehicleinfo != null) {
      data['vehicleinfo'] = this.vehicleinfo!.toJson();
    }
    if (this.stops != null) {
      data['stops'] = this.stops!.toJson();
    }
    return data;
  }
}

class Vehicleinfo {
  String? name;
  String? shortname;
  String? number;
  String? type;
  String? locationX;
  String? locationY;
  String? id;

  Vehicleinfo(
      {this.name,
        this.shortname,
        this.number,
        this.type,
        this.locationX,
        this.locationY,
        this.id});

  Vehicleinfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortname = json['shortname'];
    number = json['number'];
    type = json['type'];
    locationX = json['locationX'];
    locationY = json['locationY'];
    id = json['@id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shortname'] = this.shortname;
    data['number'] = this.number;
    data['type'] = this.type;
    data['locationX'] = this.locationX;
    data['locationY'] = this.locationY;
    data['@id'] = this.id;
    return data;
  }
}

class Stops {
  String? number;
  List<Stop>? stop;

  Stops({this.number, this.stop});

  Stops.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['stop'] != null) {
      stop = <Stop>[];
      json['stop'].forEach((v) {
        stop!.add(new Stop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.stop != null) {
      data['stop'] = this.stop!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stop {
  String? id;
  String? station;
  Stationinfo? stationinfo;
  String? time;
  String? platform;
  Platforminfo? platforminfo;
  String? scheduledDepartureTime;
  String? scheduledArrivalTime;
  String? delay;
  String? canceled;
  String? departureDelay;
  String? departureCanceled;
  String? arrivalDelay;
  String? arrivalCanceled;
  String? left;
  String? arrived;
  String? isExtraStop;
  Occupancy? occupancy;
  String? departureConnection;

  Stop(
      {this.id,
        this.station,
        this.stationinfo,
        this.time,
        this.platform,
        this.platforminfo,
        this.scheduledDepartureTime,
        this.scheduledArrivalTime,
        this.delay,
        this.canceled,
        this.departureDelay,
        this.departureCanceled,
        this.arrivalDelay,
        this.arrivalCanceled,
        this.left,
        this.arrived,
        this.isExtraStop,
        this.occupancy,
        this.departureConnection});

  Stop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    station = json['station'];
    stationinfo = json['stationinfo'] != null
        ? new Stationinfo.fromJson(json['stationinfo'])
        : null;
    time = json['time'];
    platform = json['platform'];
    platforminfo = json['platforminfo'] != null
        ? new Platforminfo.fromJson(json['platforminfo'])
        : null;
    scheduledDepartureTime = json['scheduledDepartureTime'];
    scheduledArrivalTime = json['scheduledArrivalTime'];
    delay = json['delay'];
    canceled = json['canceled'];
    departureDelay = json['departureDelay'];
    departureCanceled = json['departureCanceled'];
    arrivalDelay = json['arrivalDelay'];
    arrivalCanceled = json['arrivalCanceled'];
    left = json['left'];
    arrived = json['arrived'];
    isExtraStop = json['isExtraStop'];
    occupancy = json['occupancy'] != null
        ? new Occupancy.fromJson(json['occupancy'])
        : null;
    departureConnection = json['departureConnection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['station'] = this.station;
    if (this.stationinfo != null) {
      data['stationinfo'] = this.stationinfo!.toJson();
    }
    data['time'] = this.time;
    data['platform'] = this.platform;
    if (this.platforminfo != null) {
      data['platforminfo'] = this.platforminfo!.toJson();
    }
    data['scheduledDepartureTime'] = this.scheduledDepartureTime;
    data['scheduledArrivalTime'] = this.scheduledArrivalTime;
    data['delay'] = this.delay;
    data['canceled'] = this.canceled;
    data['departureDelay'] = this.departureDelay;
    data['departureCanceled'] = this.departureCanceled;
    data['arrivalDelay'] = this.arrivalDelay;
    data['arrivalCanceled'] = this.arrivalCanceled;
    data['left'] = this.left;
    data['arrived'] = this.arrived;
    data['isExtraStop'] = this.isExtraStop;
    if (this.occupancy != null) {
      data['occupancy'] = this.occupancy!.toJson();
    }
    data['departureConnection'] = this.departureConnection;
    return data;
  }
}

class Stationinfo {
  String? id;
  String? name;
  String? locationX;
  String? locationY;
  String? standardname;

  Stationinfo(
      {this.id,
        this.name,
        this.locationX,
        this.locationY,
        this.standardname});

  Stationinfo.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    id = json['id'];
    name = json['name'];
    locationX = json['locationX'];
    locationY = json['locationY'];
    standardname = json['standardname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['id'] = this.id;
    data['name'] = this.name;
    data['locationX'] = this.locationX;
    data['locationY'] = this.locationY;
    data['standardname'] = this.standardname;
    return data;
  }
}

class Platforminfo {
  String? name;
  String? normal;

  Platforminfo({this.name, this.normal});

  Platforminfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    normal = json['normal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['normal'] = this.normal;
    return data;
  }
}

class Occupancy {
  String? id;
  String? name;

  Occupancy({this.id, this.name});

  Occupancy.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
