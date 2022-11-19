import 'package:valorant_tips/network/api_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/map.dart';

class MapsClient extends ApiClient {
  // Get Maps
  Future<Iterable<Maps>> getlAllMaps() async {
    Iterable<Maps> maps = [];
    Uri url = Uri.parse("${baseUrl}v1/maps");
    // Get response
    var apiResult = await http.get(url);
    var jsonObject = jsonDecode(apiResult.body);
    // Parsed list bunu mapleyip her haritayi tek tek maps listesine atiyoruz
    List parsedList = (jsonObject as Map<String, dynamic>)['data'];
    maps = parsedList.map((element) {
      return Maps.fromJson(element);
    });

    return maps;
  }
}
