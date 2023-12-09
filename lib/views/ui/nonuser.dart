import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_product_app/views/shared/appstyle.dart';
import 'package:online_product_app/views/shared/reusable_text.dart';
import 'package:online_product_app/views/shared/reuseable_text.dart';

import 'Auth/login.dart';

class NonUser extends StatelessWidget {
  const NonUser({super.key});

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
              height: 750.h,
              decoration: const BoxDecoration(color: Color(0xFFE2E2E2)),
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
                              child: ReusableText(
                                text: "Hello, please loggin into the account",
                                style: appstyle(
                                    13, Colors.grey.shade600, FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LoginPage())));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: 50.w,
                            height: 30.h,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: reusableText(
                                  text: "Login",
                                  style: appstyle(
                                      12, Colors.white, FontWeight.normal)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
