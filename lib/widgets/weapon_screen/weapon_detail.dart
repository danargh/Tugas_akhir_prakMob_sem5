import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_tips/constants/app_assets.dart';
import 'package:valorant_tips/constants/app_colors.dart';
import 'package:valorant_tips/widgets/weapon_screen/weapon_detail/weapon_info.dart';
import 'package:valorant_tips/widgets/weapon_screen/weapon_detail/weapon_section_one.dart';
import 'package:valorant_tips/widgets/weapon_screen/weapon_detail/weapon_section_two.dart';

import '../../models/weapon.dart';

class WeaponDetail extends StatelessWidget {
  WeaponDetail({Key? key, required this.weapon}) : super(key: key);
  Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 30.h),
      child: Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
            children: [
              WeaponInfo(weapon: weapon),
              WeaponSectionOne(weapon: weapon,deviceInfo: constraints.maxHeight.round(),),
              WeaponSectionTwo(weapon: weapon,deviceInfo: constraints.maxHeight.round(),),
            ],
          );
          },
        ),
      ),
    );
  }
}
