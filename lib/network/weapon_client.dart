import 'package:valorant_tips/models/weapon.dart';
import 'package:valorant_tips/network/api_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/agent.dart';

class WeaponsClient extends ApiClient {
  // Get Weapons
  Future<Iterable<Weapon>> getWeapons() async {
    Iterable<Weapon> weapons = [];
    Uri url = Uri.parse("${baseUrl}v1/weapons");
    // Get response
    var apiResult = await http.get(url);
    var jsonObject = jsonDecode(apiResult.body);
    // Parsed list bunu mapleyip her silahi tek tek weapons listesine atiyoruz
    List parsedList = (jsonObject as Map<String, dynamic>)['data'];
    weapons = parsedList.map((element) {
      return Weapon.fromJson(element);
    });

    return weapons;
  }
}
