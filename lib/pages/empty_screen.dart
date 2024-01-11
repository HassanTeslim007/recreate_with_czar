import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recreate_with_czar/core/utils/colors.dart';
import 'package:recreate_with_czar/core/utils/size_config.dart';
import 'package:recreate_with_czar/core/utils/util.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.fromHeight(context, 10)),
      width: SizeConfig.fromWidth(context, 70),
      height: SizeConfig.fromHeight(context, 33),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/empty.svg',
                  width: 300,
                ),
                ySpace(10),
                Text(
                  'Coming Soon!',
                  style: TextStyle(
                      color: primaryBrown,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'We\'ll be up soon. Keep an eye on us',
                  style: TextStyle(fontSize: 14, color: Color(0xFF908989)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 30,
            child: SvgPicture.asset('assets/flash.svg'),
          ),
          Positioned(
            bottom: 80,
            right: 10,
            child: SvgPicture.asset('assets/loading.svg'),
          )
        ],
      ),
    );
  }
}
