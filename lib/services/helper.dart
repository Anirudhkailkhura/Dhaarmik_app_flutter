import 'package:flutter/services.dart' as the_bundle;
import '../models/sneaker_model.dart';


// this class fetches data from the json file and return it to the app
class Helper {
  // Male
  Future<List<Products>> getMaleProducts() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = productsFromJson(data);

    return maleList;
  }

// Female
  Future<List<Products>> getFemaleProducts() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = productsFromJson(data);

    return femaleList;
  }

// Kids
  Future<List<Products>> getKidsProducts() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = productsFromJson(data);

    return kidsList;
  }

  // Single Male
  Future<Products> getMaleProductsById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = productsFromJson(data);

    final product = maleList.firstWhere((product) => product.id == id);

    return product;
  }

    // Single Male
  Future<Products> getFemaleProductsById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final maleList = productsFromJson(data);

    final product = maleList.firstWhere((product) => product.id == id);

    return product;
  }


    // Single Kids
  Future<Products> getKidsProductsById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final maleList = productsFromJson(data);

    final product = maleList.firstWhere((product) => product.id == id);

    return product;
  }
}
