import 'package:flutter/material.dart';
import 'package:online_product_app/models/sneaker_model.dart';
import 'package:online_product_app/services/config.dart';
import 'package:http/http.dart' as http;

// this class fetches data from the json file and return it to the app
class Helper {
  // stone bracelets
  static var client = http.Client();

  Future<List<Products>> getMaleProducts() async {
    try {
      var url = Uri.https(Config.apiUrl, Config.bracelets);

      var response = await client.get(url);

      if (response != null) {
        if (response.statusCode == 200) {
          final maleList = productsFromJson(response.body);

          var male =
              maleList.where((element) => element.category == "Stone bracelet");

          debugPrint(male.toString());
          return maleList.toList();
        } else {
          print("HTTP request failed with status code: ${response.statusCode}");
          // Handle other HTTP status codes if needed
          throw Exception("Failed to get product list");
        }
      } else {
        print("Response is null");
        throw Exception("Failed to get product list");
      }
    } catch (error) {
      print("Error during HTTP request: $error");
      // Handle other exceptions if needed
      throw Exception("Failed to get product list");
    }
  }

// crystal bracelets
  Future<List<Products>> getFemaleProducts() async {
    var url = Uri.https(Config.apiUrl, Config.bracelets);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final femaleList = productsFromJson(response.body);
      var female =
          femaleList.where((element) => element.category == "Crystal bracelet");
      return female.toList();
    } else {
      throw Exception("failed to get sneaker list");
    }
  }

//best sellers
  Future<List<Products>> getKidsProducts() async {
    var url = Uri.https(Config.apiUrl, Config.bracelets);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final kidsList = productsFromJson(response.body);
      var kids =
          kidsList.where((element) => element.category == "Best Sellers");
      return kids.toList();
    } else {
      throw Exception("failed to get sneaker list");
    }
  }

  // search
  Future<List<Products>> search(String searchQuery) async {
    var url = Uri.https(Config.apiUrl, "${Config.search}$searchQuery");

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final result = productsFromJson(response.body);
      return result;
    } else {
      throw Exception("failed to get sneaker list");
    }
  }
}

// // for product  individual page
//   // Single Male
//   Future<Products> getMaleProductsById(String id) async {
//     final data =
//         await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

//     final maleList = productsFromJson(data);

//     final product = maleList.firstWhere((product) => product.id == id);

//     return product;
//   }

//   // Single female
//   Future<Products> getFemaleProductsById(String id) async {
//     final data =
//         await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

//     final maleList = productsFromJson(data);

//     final product = maleList.firstWhere((product) => product.id == id);

//     return product;
//   }

//   // Single Kids
//   Future<Products> getKidsProductsById(String id) async {
//     final data =
//         await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

//     final maleList = productsFromJson(data);

//     final product = maleList.firstWhere((product) => product.id == id);

//     return product;
//   }
// }
