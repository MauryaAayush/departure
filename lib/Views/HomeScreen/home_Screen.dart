import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/Datamodel.dart';
import '../../Provider/language_provider.dart';
import '../../Provider/theme_provider.dart';

class DohaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: themeProvider.isDarkMode
                    ? [Colors.black, Colors.grey]
                    : [Colors.white, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(

              children: [
               Spacer(), // Space for the icons at the top

                Expanded(
                  child: ListView.builder(
                    itemCount: dohas.length,
                    itemBuilder: (context, index) {
                      Doha doha = dohas[index];
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              languageProvider.selectedLanguage == 'Hindi'
                                  ? doha.hindi
                                  : languageProvider.selectedLanguage == 'English'
                                  ? doha.english
                                  : doha.gujarati,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              languageProvider.selectedLanguage == 'Hindi'
                                  ? doha.meaningHindi
                                  : languageProvider.selectedLanguage == 'English'
                                  ? doha.meaningEnglish
                                  : doha.meaningGujarati,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: themeProvider.isDarkMode ? Colors.grey[300] : Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
              color: Colors.white,
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: DropdownButton<String>(
              dropdownColor: themeProvider.isDarkMode ? Colors.grey[900] : Colors.white,
              value: languageProvider.selectedLanguage,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  languageProvider.setSelectedLanguage(newValue);
                }
              },
              items: <String>['Hindi', 'English', 'Gujarati']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
