import 'package:flutter/material.dart';
import 'package:mim_generator/presenter/view/meme/meme_page.dart';
import 'package:mim_generator/util/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mim Generator',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
      routes: {Routes.meme: (ctx) => MemePage()},
      initialRoute: Routes.meme,
    );
  }
}