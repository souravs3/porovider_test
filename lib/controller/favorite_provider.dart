import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> _selectedFavoriteItem = [];

  List<int> get selectedFavoriteItem => _selectedFavoriteItem;

  void selectFavoriteFunction(int value) {
    if (_selectedFavoriteItem.contains(value)) {
      _selectedFavoriteItem.remove(value);
    } else {
      _selectedFavoriteItem.add(value);
    }
    notifyListeners();
  }
}


// import 'package:flutter/material.dart';

// class FavoriteProvider extends ChangeNotifier {
//   List<int> _selectedFavoriteItem = [];

//   List<int> get selectedFavoriteItem => _selectedFavoriteItem;

 
// }

