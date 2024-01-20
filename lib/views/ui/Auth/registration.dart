import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_product_app/models/auth/signup_model.dart';
import 'package:online_product_app/views/ui/Auth/login.dart';
import 'package:provider/provider.dart';
import '../../../controllers/login_provider.dart';
import '../../shared/appstyle.dart';
import '../../shared/custom_textfield.dart';
import '../../shared/reusable_text.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  bool validation = false;

  void formValidation() {
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        username.text.isNotEmpty) {
      validation = true;
    } else {
      validation = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.1,
                image: AssetImage(
                    "assets/images/WhatsApp_Image_2023-05-29_at_12.51.43_PM-removebg-preview.png"))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ReusableText(
                text: "Welcome!",
                style: appstyle(30, Colors.black, FontWeight.w600)),
            ReusableText(
                text: "Fill up the details to signup for the account",
                style: appstyle(14, Colors.black, FontWeight.normal)),
            SizedBox(height: 50.h),
            CustomTextField(
              keyboard: TextInputType.emailAddress,
              hintText: 'Email',
              controller: email,
              validator: (email) {
                if (email!.isEmpty && email.contains("@")) {
                  return "please provide valid email address";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              keyboard: TextInputType.emailAddress,
              hintText: 'Username',
              controller: username,
              validator: (username) {
                if (username!.isEmpty) {
                  return "please provide valid username";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              obscureText: authNotifier.isObsecure,
              hintText: 'Password',
              controller: password,
              suffixIcon: GestureDetector(
                onTap: () {
                  authNotifier.isObsecure = !authNotifier.isObsecure;
                },
                child: authNotifier.isObsecure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              validator: (passward) {
                if (passward!.isEmpty && passward.length < 7) {
                  return "Passward length should be greater than 7";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginPage())));
                },
                child: ReusableText(
                    text: "Login",
                    style: appstyle(14, Colors.white, FontWeight.normal)),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                formValidation();
                if (validation) {
                  SignupModel model = SignupModel(
                      username: username.text,
                      email: email.text,
                      password: password.text);
                  authNotifier.registerUser(model).then((response) {
                    if (response == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    } else {
                      debugPrint(response.toString());
                      debugPrint("failed to sign in ");
                    }
                  });
                } else {
                  debugPrint("form not validate");
                }
              },
              child: Container(
                height: 55.h,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child: ReusableText(
                      text: "S I G N U P",
                      style: appstyle(18, Colors.black, FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
