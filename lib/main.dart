import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxfavitems/View/HomeScreen.dart';
import 'package:getxfavitems/textfirld_with_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Textfield_with_dropdown()
        //home: HomeScreen(),
        );
  }
}
