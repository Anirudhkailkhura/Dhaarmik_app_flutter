import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_product_app/views/shared/reusable_text.dart';
import 'package:online_product_app/views/shared/reuseable_text.dart';
import 'package:online_product_app/views/shared/tiles_widget.dart';

import '../shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2E2E2),
        elevation: 0,
        leading: const Icon(
          MaterialCommunityIcons.qrcode_scan,
          color: Colors.black,
          size: 18,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Flag-India.webp",
                    width: 15.w,
                    height: 25,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 15.h,
                    width: 1.w,
                    color: Colors.grey,
                  ),
                  ReusableText(
                      text: " India",
                      style: appstyle(16, Colors.black, FontWeight.normal)),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(
                      SimpleLineIcons.settings,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 65.h,
              decoration: const BoxDecoration(
                  color: Color(0xFFE2E2E2)), //Color(0xFFE2E2E2)
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/satoru icons.jpeg"),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    text: "username",
                                    style: appstyle(
                                        13, Colors.black, FontWeight.normal),
                                  ),
                                  ReusableText(
                                    text: "user@gmail.com",
                                    style: appstyle(
                                        13, Colors.black, FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Feather.edit,
                                size: 18,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 160.h,
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TilesWidget(
                          OnTap: () {},
                          title: 'My Order',
                          leading: MaterialCommunityIcons.truck_fast_outline),
                      TilesWidget(
                          OnTap: () {},
                          title: 'My favorites',
                          leading: MaterialCommunityIcons.heart_outline),
                      TilesWidget(
                          OnTap: () {},
                          title: 'Cart',
                          leading: Fontisto.shopping_bag),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 110.h,
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TilesWidget(
                          OnTap: () {},
                          title: 'Coupons',
                          leading: MaterialCommunityIcons.tag_outline),
                      TilesWidget(
                          OnTap: () {},
                          title: 'My Store',
                          leading: MaterialCommunityIcons.shopping_outline),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 160.h,
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TilesWidget(
                          OnTap: () {},
                          title: 'Shipping addresses',
                          leading: SimpleLineIcons.location_pin),
                      TilesWidget(
                          OnTap: () {},
                          title: 'Setting',
                          leading: AntDesign.setting),
                      TilesWidget(
                          OnTap: () {},
                          title: 'Logout',
                          leading: AntDesign.logout),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
