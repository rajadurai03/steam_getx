import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Route/route.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: Routes.routes,
      initialRoute:"/homepage" ,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
    );
  }
}