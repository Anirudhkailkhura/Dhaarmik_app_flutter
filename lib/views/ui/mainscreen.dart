import 'package:flutter/material.dart';
import 'package:online_product_app/views/ui/Auth/login.dart';
import 'package:online_product_app/views/ui/nonuser.dart';
import 'package:online_product_app/views/ui/profile.dart';
import 'package:provider/provider.dart';
import '../../controllers/mainscreen_provider.dart';
import '../shared/bottom_nav.dart';
import 'cartpage.dart';
import 'favorite.dart';
import 'homepage.dart';
import 'searchpage.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    SearchPage(),
    const Favorites(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    //the type to which consumer widget should listen to
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          //body is getting the page index from the provider
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottoNavBar(),
        );
      },
    );
  }
}
