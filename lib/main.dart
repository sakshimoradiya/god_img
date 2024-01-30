import 'package:flutter/material.dart';
import 'package:god_img/views/screen/detailPage.dart';
import 'package:god_img/views/screen/homePage.dart';
import 'package:god_img/views/screen/utils/routeUtils.dart';
import 'package:god_img/views/screen/wallpaper.dart';
import 'package:god_img/views/screen/wallpaperSet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
   routes: {
     MyRoutes.home: (context) => HomePage(events: []),
     MyRoutes.detailPage: (context) => DetailPage(),
     MyRoutes.wallpaper: (context) => WallpaperP(),
     MyRoutes.wallpaperSet: (context) => WallpaperSet(),
   },);

  }
}
