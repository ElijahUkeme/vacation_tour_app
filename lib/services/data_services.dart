import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vacation_tour_app/model/data_model.dart';

class DataServices{
  String baseUrl = 'http://192.168.43.5:8080/';
  Future<List<DataModel>>getInfo() async {
    var apiUrl = 'tourist/getAll';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));

    try{
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}