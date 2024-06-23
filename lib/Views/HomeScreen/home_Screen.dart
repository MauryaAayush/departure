import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    ? [Colors.black, Colors.grey.shade800]
                    : [Colors.white, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [



                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: languageProvider.dohaData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? Colors.grey.shade700.withOpacity(0.2)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/newimgs.jpeg"),fit: BoxFit.cover)),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                languageProvider.selectedLanguage == 'Hindi'
                                    ? languageProvider.dohaData[index].hindi
                                    : languageProvider.selectedLanguage ==
                                            'English'
                                        ? languageProvider
                                            .dohaData[index].english
                                        : languageProvider
                                            .dohaData[index].gujarati,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                languageProvider.selectedLanguage == 'Hindi'
                                    ? languageProvider
                                        .dohaData[index].meaningHindi
                                    : languageProvider.selectedLanguage ==
                                            'English'
                                        ? languageProvider
                                            .dohaData[index].meaningEnglish
                                        : languageProvider
                                            .dohaData[index].meaningGujarati,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: themeProvider.isDarkMode
                                      ? Colors.grey[400]
                                      : Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(themeProvider.isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode),
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
              dropdownColor:
                  themeProvider.isDarkMode ? Colors.grey[900] : Colors.white,
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
                  child: Text(value,
                      style: TextStyle(
                          color: themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
