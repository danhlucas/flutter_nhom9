import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';

class NameAndNumber extends StatelessWidget {
  const NameAndNumber({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffeeNames[index],
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                '25 K',
                style: TextStyle(color: mPrimaryColor),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                decoration: BoxDecoration(
                    border: Border.all(color: mTitleTextColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      bottomLeft: Radius.circular(36),
                    )),
                child: Text(
                  '-',
                  style: TextStyle(
                    color: mTitleTextColor,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '1',
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                decoration: BoxDecoration(
                    border: Border.all(color: mTitleTextColor),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    )),
                child: Text(
                  '+',
                  style: TextStyle(
                    color: mTitleTextColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
