import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/controller/home_provider.dart';
import 'view/home/home.dart';
// import 'word_generator_screens.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // backgroundColor: Colors.purple,
          scaffoldBackgroundColor: Colors.purple[50],
          appBarTheme: AppBarTheme(color: Colors.purple[50])),
      home: const MyHomePage(),
    );
  }
}
