import 'package:dio/dio.dart';
import 'package:valorant_tips/models/weapon.dart';
import 'package:valorant_tips/network/api_client.dart';

import '../models/agent.dart';

class WeaponsClient extends ApiClient {
  // Get Weapons
  Future<Iterable<Weapon>> getWeapons() async {
    Iterable<Weapon> weapons = [];
    try {
      // Get response
      Response response = await super.dio.get("${super.baseUrl}v1/weapons");

      // Parsed list bunu mapleyip her silahi tek tek weapons listesine atiyoruz
      List parsedList = response.data['data'];
      weapons = parsedList.map((element) {
        return Weapon.fromJson(element);
      });

    } on DioError catch (e) {
      if (e.response != null) {
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return weapons;
  }
}