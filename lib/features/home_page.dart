import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/string_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            homePageText,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
