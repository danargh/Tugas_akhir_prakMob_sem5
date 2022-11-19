// import 'package:dio/dio.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valorant_tips/network/api_client.dart';

import '../models/agent.dart';

class AgentClient extends ApiClient {
  // Get Agents
  Future<Iterable<Agent>> getAgents({String? agentRole}) async {
    Iterable<Agent> agents = [];
    Uri url = Uri.parse("${baseUrl}v1/agents");
    // Params
    Map<String, String> qParams = {
      'isPlayableCharacter': 'true',
    };
    // Get response
    final finalUrl = url.replace(queryParameters: qParams);
    var apiResult = await http.get(finalUrl);
    var jsonObject = jsonDecode(apiResult.body);
    List parsedList = (jsonObject as Map<String, dynamic>)['data'];
    agents = parsedList.map((element) {
      return Agent.fromJson(element);
    });

    if (agentRole != null) {
      agents = agents.where((element) =>
          element.role!.displayName!.toLowerCase() == agentRole.toLowerCase());
    }
    return agents;
  }
}
