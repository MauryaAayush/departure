import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/language_provider.dart';
import '../../Provider/theme_provider.dart';


class Doha {
  final String hindi;
  final String english;

  Doha({required this.hindi, required this.english});
}

List<Doha> dohas = [
  Doha(hindi: "संतोषी सुख साधनं, सुख संतोषे सन्तति।", english: "Contentment is the best wealth, happiness comes from contentment."),
  Doha(hindi: "कबीर लहरि समंद की, मोती बिखरे आय।", english: "Kabir, like pearls scattered in the waves of the ocean."),
  // Add more dohas as needed
];

class DohaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Doha App'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
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
            DropdownButton<String>(
              value: languageProvider.selectedLanguage,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  languageProvider.setSelectedLanguage(newValue);
                }
              },
              items: <String>['Hindi', 'English']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dohas.length,
                itemBuilder: (context, index) {
                  Doha doha = dohas[index];
                  return ListTile(
                    title: Text(languageProvider.selectedLanguage == 'Hindi'
                        ? doha.hindi
                        : doha.english),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
