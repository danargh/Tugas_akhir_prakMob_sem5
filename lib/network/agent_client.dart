// import 'package:dio/dio.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/agent.dart';

class AgentClient {
  // Get Agents
  Future<Iterable<Agent>> getAgents({String? agentRole}) async {
    Iterable<Agent> agents = [];
    Uri url = Uri.parse("https://valorant-api.com/v1/agents");
    // Get response
    var apiResult = await http.get(url);
    var jsonObject = jsonDecode(apiResult.body);
    List parsedList = (jsonObject as Map<String, dynamic>)['data'];
    agents = parsedList.map((element) {
      return Agent.fromJson(element);
    });

    if (agentRole != null) {
      agents = agents.where((element) => element.role!.displayName!.toLowerCase() == agentRole.toLowerCase());
    }
    return agents;
  }
}
