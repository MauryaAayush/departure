import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/Datamodel.dart';

class LanguageProvider with ChangeNotifier {
  String _selectedLanguage = 'Hindi';

  String get selectedLanguage => _selectedLanguage;

  void setSelectedLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }


  List dataList = [];
  List<DohaModel> dohaData = []; // Add a private variable to store the loaded data


  Future<void> loadDohaData() async {

    String jsonString = await rootBundle.loadString('assets/json/use.json');
    List dataList = jsonDecode(jsonString);

    dohaData = dataList.map((json) => DohaModel.fromJson(json)).toList();
    print(dohaData);
    notifyListeners();
  }

  LanguageProvider() {
    print("**************************");
    loadDohaData();
    print("**************************");
  }
}
