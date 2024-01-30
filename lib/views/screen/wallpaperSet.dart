import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:god_img/views/screen/detailPage.dart';
import 'package:god_img/views/screen/utils/routeUtils.dart';

class WallpaperSet extends StatefulWidget {
  const WallpaperSet({super.key});

  @override
  State<WallpaperSet> createState() => _WallpaperSetState();
}

class _WallpaperSetState extends State<WallpaperSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(
          godImageURLs[0],
          fit: BoxFit.fill,
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        onClosing: () => ScaffoldMessenger(
          child: Text('few'),
        ),
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                AsyncWallpaper.setWallpaper(
                    url: godImageURLs[0],
                    goToHome: true,
                    wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                    toastDetails: ToastDetails(
                      message: 'Wallpaper set successfully',
                      backgroundColor: Colors.green,
                    ),
                    errorToastDetails: ToastDetails.error());
              },
              child: Icon(Icons.lock),
            ),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  AsyncWallpaper.setWallpaper(
                      url: godImageURLs[0],
                      goToHome: true,
                      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                      toastDetails: ToastDetails.success(),
                      errorToastDetails: ToastDetails.error());
                },
                child: Icon(Icons.home)),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  saveImage(context);
                },
                child: Icon(Icons.download)),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(onPressed: () {}, child: Icon(Icons.share)),
          ],
        ),
      ),
    );
  }
}
