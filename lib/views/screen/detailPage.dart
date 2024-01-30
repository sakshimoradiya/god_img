import 'dart:io';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:god_img/views/screen/utils/routeUtils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class DetailPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: godImageURLs.length,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("SELECT SCREEN"),
                    actions: [
                      Column(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(MyRoutes.wallpaperSet,arguments: index);
                                },
                                child: const Text("Lock Screen"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                },
                                child: const Text("HOME Page"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                  const Size(50, 40),
                                )),
                                onPressed: () {
                                  saveImage(context);
                                },
                                child: const Icon(Icons.download),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                  const Size(50, 40),
                                )),
                                onPressed: () {
                                  saveImage(context);
                                },
                                child: const Icon(Icons.share),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                child: Image.network(
                  godImageURLs[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
 final List<String> godImageURLs = [
  'https://w0.peakpx.com/wallpaper/252/945/HD-wallpaper-ganesh-statue-on-leaf-ganesh-statue-leaf-lord-idol-god-thumbnail.jpg',
  'https://www.shutterstock.com/image-illustration/indian-god-dhan-laxmi-hindu-260nw-2320574547.jpg',
  'https://w0.peakpx.com/wallpaper/892/471/HD-wallpaper-ganesh-ji-ganesh-god-ganesh-lord-ganesha-god-god-ganesh-god-ganesha-god-hindu-god-lord-ganesh-lord-thumbnail.jpg',
  'https://m.media-amazon.com/images/I/A1zMRVMHHLL._AC_UF894,1000_QL80_.jpg',
  'https://www.shutterstock.com/image-illustration/indian-god-shiv-ji-hindu-260nw-2321640037.jpg',
  'https://wallpapers.com/images/featured/god-mobile-8zkcu9np2hlivyi6.jpg',
  'https://i.pinimg.com/236x/61/2c/dd/612cdd6470e3e8a455057b2f3e5e8f22.jpg',
  'https://c8.alamy.com/comp/CPYNGP/picture-of-hindu-gods-laksman-rama-sita-and-hanuman-india-asia-CPYNGP.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/022/779/997/small_2x/generative-ai-illustration-of-ganesha-hindu-god-with-flowers-oil-painting-taken-up-into-heaven-sitting-in-front-of-bokeh-mandala-background-photo.jpg'

  // Add more god image URLs as needed
];
Future<void> saveImage(BuildContext context) async {
  String? message;
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  try {
    // Download image
    final http.Response response = await http.get(Uri.parse(godImageURLs[0]));

    // Get temporary directory
    final dir = await getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/.png';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes);

    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      message = 'Image saved to disk';
    }
  } catch (e) {
    message = 'An error occurred while saving the image';
  }

  if (message != null) {
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
