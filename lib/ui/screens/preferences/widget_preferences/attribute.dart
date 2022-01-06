import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Attribute extends StatelessWidget {
  const Attribute({
    Key? key,
    required this.title,
    required this.iconNames,
    this.alignment = Alignment.center,
    this.check = -1,
  }) : super(key: key);
  final String title;
  final List<String> iconNames;
  final Alignment alignment;
  final int check;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: mTitleTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: iconNames.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(
                  'assets/icons/${iconNames[index]}.svg',
                  color: check == index ? mTitleTextColor : mPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
