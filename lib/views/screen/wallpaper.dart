import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';


class WallpaperP extends StatefulWidget {
  @override
  _WallpaperPState createState() => _WallpaperPState();
}

class _WallpaperPState extends State<WallpaperP> {
  String _platformVersion = 'Unknown';
  String __heightWidth = "Unknown";
  @override
  void initState() {
    super.initState();
    initAppState();
  }

  Future<void> initAppState() async {
    String platformVersion;
    String _heightWidth;
    try {
      platformVersion =
          await WallpaperManager.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      int height = await WallpaperManager.getDesiredMinimumHeight();
      int width = await WallpaperManager.getDesiredMinimumWidth();
      _heightWidth =
          "Width = " + width.toString() + " Height = " + height.toString();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      _heightWidth = "Failed to get Height and Width";
    }

    if (!mounted) return;

    setState(() {
      __heightWidth = _heightWidth;
      _platformVersion = platformVersion;
    });
  }

  Future<void> setWallpaper() async {
    try {
      String url = "https://source.unsplash.com/random";
      int location = WallpaperManager
          .BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Running on: $_platformVersion\n'),
                SizedBox(
                  height: 10,
                ),
                Text('$__heightWidth\n'),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () => {setWallpaper()},
                    child: Text("Set Random Wallpaper")),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () => {(WallpaperManager.clearWallpaper())},
                    child: Text("Clear Wallpaper"))
              ],
            )),
      ),
    );
  }
}