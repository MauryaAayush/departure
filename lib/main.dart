import 'package:flutter/material.dart';

import 'Views/HomeScreen/home_Screen.dart';

void main()
{
  runApp(const Departure());
}


class Departure extends StatelessWidget {
  const Departure({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

