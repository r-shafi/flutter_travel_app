import 'package:flutter/material.dart';
import 'package:travel_app/pages/welcome_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
