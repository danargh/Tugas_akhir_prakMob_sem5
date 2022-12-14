import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_tips/constants/app_colors.dart';
import 'package:valorant_tips/models/agent.dart';
import 'package:valorant_tips/widgets/agents_screen/Agent/agents_detail.dart';

class AgentsCard extends StatelessWidget {
  AgentsCard({Key? key, required this.agent, required this.index})
      : super(key: key);

  Agent agent;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgentsDetail(agent: agent),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Transparent Container
          Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),

              // Colored Container
              child: Container(
                decoration: BoxDecoration(color: Colors.grey),
                alignment: Alignment.bottomLeft,
                width: 160.w,

                // Agent info column
                child: Padding(
                  padding: EdgeInsets.all(5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        agent.role!.displayName!,
                        style: TextStyle(
                            fontFamily: 'Valorant',
                            color: white,
                            fontSize: 10.sp),
                      ),
                      Text(
                        agent.displayName!,
                        style: TextStyle(
                            fontFamily: 'Valorant',
                            color: white,
                            fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Agent Image
          Positioned(
            child: Hero(
              tag: agent,
              child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl:
                      agent.fullPortrait ?? 'https://via.placeholder.com/150'),
            ),
          ),
        ],
      ),
    );
  }
}
