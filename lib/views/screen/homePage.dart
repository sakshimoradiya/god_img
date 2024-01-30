import 'dart:io';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:god_img/model/userModal.dart';
import 'package:god_img/views/screen/utils/routeUtils.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'detailPage.dart';



class HomePage extends StatelessWidget {
  final List<Event> events;

  HomePage({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventListItem(event: events[index]);
      },
    );
  }
}

class EventListItem extends StatefulWidget {
  final Event event;

  EventListItem({required this.event});

  @override
  State<EventListItem> createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  Future<void> _saveImage(BuildContext context) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      // Download image
      final http.Response response =
      await http.get(Uri.parse(widget.event.file));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/image.png';

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

  void shareContent() {
    // Image URL to be shared
    String imageUri = "${widget.event.file}";

    // Text to be shared
    String textToShare = widget.event.title;

    // Link to be shared
    String linkToShare = widget.event.description;

    // Combine text and link
    String combinedText = '$textToShare\n$linkToShare\n$imageUri';

    // Share using the share package
    Share.share(
      combinedText,
      subject: 'Shared Image', // Subject for email or messages
      sharePositionOrigin: Rect.fromCenter(
        center: const Offset(0, 0),
        width: 0,
        height: 0,
      ),
      // Share image as a file or Uint8List (optional)
      // image: 'image.jpg',
      // mimeType: 'image/jpg',
    );
  }

  bool isImageDownloaded = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Card(
        color: const Color(0xF6F6F6FF),
        child: ListTile(
          title: Row(
            children: [
              Image.asset(""
              ),
              const SizedBox(
                width: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   timeUntil2(data[index].time),
                  //   style: const TextStyle(
                  //       fontSize: 14, color: Color(0x95959FA7)),
                  // ),
                ],
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.start,
                widget.event.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.network(widget.event.file),
                ),
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      shareContent();
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.share),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Share"),
                      ],
                    ),
                  ),const SizedBox(width: 28,),
                  ElevatedButton(
                    onPressed: () {
                      _saveImage(context);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.download),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Download"),
                      ],
                    ),),],
              )
            ],
          ),
        ),
      ),
    );
  }
}
