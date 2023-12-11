import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:online_product_app/controllers/login_provider.dart';
import 'package:online_product_app/models/auth/login_model.dart';
import 'package:online_product_app/views/shared/appstyle.dart';
import 'package:online_product_app/views/shared/reusable_text.dart';
import 'package:online_product_app/views/ui/Auth/registration.dart';
import 'package:online_product_app/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';
import '../../shared/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool validation = false;

  void formValidation() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
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
                text: "Fill in the details to login into the account",
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
            SizedBox(height: 15.h),
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
              validator: (password) {
                if (password!.isEmpty && password.length < 7) {
                  return "Password length should be greater than 7";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Registration())));
                },
                child: ReusableText(
                    text: "Register",
                    style: appstyle(14, Colors.white, FontWeight.normal)),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                formValidation();
                if (validation) {
                  LoginModel model =
                      LoginModel(email: email.text, password: password.text);
                  authNotifier.userLogin(model).then((response) {
                    if (response == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    } else {
                      debugPrint("Failed to login");
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
                      text: "L O G I N",
                      style: appstyle(18, Colors.black, FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
