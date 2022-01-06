import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/ui/screens/menu/menu_screen.dart';
import 'package:coffee_shop/ui/widgets/widgets.dart';
// import 'package:coffee_shop/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9),
                  topRight: Radius.circular(9),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 36,
                    height: 5,
                    decoration: BoxDecoration(
                        color: mTitleTextColor,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coffee Shop',
                          style: TextStyle(
                            color: mPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            IconText(
                              iconUrl: 'assets/icons/distance.svg',
                              title: '5 km',
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            IconText(
                              iconUrl: 'assets/icons/time.svg',
                              title: '20 min',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      color: mPrimaryColor,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MenuScreen();
                        }));
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        child: Text(
                          'View Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Address:',
                              style: TextStyle(
                                color: mTitleTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'nomal',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '44 - 2/9 - Hai Chau District',
                              style: TextStyle(
                                color: mTitleTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pushster',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
