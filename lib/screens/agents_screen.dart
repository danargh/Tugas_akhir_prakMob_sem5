import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_tips/network/agent_client.dart';
import 'package:valorant_tips/widgets/agents_screen/Agent/agent_list.dart';

import '../models/agent.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  // Agent Client
  final AgentClient _agentClient = AgentClient();
  // Agents List
  late Future<Iterable<Agent>> agents;

  // Selected Filter Index
  int selectedFilterIndex = 0;
  // Agent Filter List
  var agentFilters = [
    'All',
  ];

  // Filtred Agents
  late Iterable<Agent> filtredAgentList;

  @override
  void initState() {
    // Agent list
    agents = _agentClient.getAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 13.w),
              child: const Text(
                'Agent',
                style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Valorant'),
                textAlign: TextAlign.start,
              ),
            ),

            // Agents
            Expanded(
              flex: 13,
              child: FutureBuilder<Iterable<Agent>>(
                future: agents,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Iterable<Agent>> snapshot,
                ) {
                  return AgentList(
                    snapshot: snapshot,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
