import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class FavoritesNotifier extends ChangeNotifier {
  final _favBox = Hive.box('fav_box');
  List<dynamic> _ids = [];
  List<dynamic> _favorites = [];

//getter
  List<dynamic> get ids => _ids;

  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;

  set favorites(List<dynamic> newFav) {
    _favorites = newFav;
    notifyListeners();
  }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      //return a map which conatain key and id.
      return {
        "key": key,
        "id ": "id",
      };
    }).toList();
    //doing something in model
    _favorites = favData.toList();
    _ids = _favorites.map((item) => item["id"]).toList();
    
  }
  //create a new favBox and ad then adds the adddFav map in it.
  Future<void> createfav(Map<String, dynamic> addfav) async {
    await _favBox.add(addfav);
    //call the getFav function which return arry of favoriotes
  }

}
