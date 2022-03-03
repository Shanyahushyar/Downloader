import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_downloader/downloader.dart';
// import 'package:youtube_downloader/getSharedData.dart';

import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

// ignore: must_be_immutable
class PasteLinkPage extends StatefulWidget {
  String? data;
  PasteLinkPage({Key? key, this.data}) : super(key: key);
  @override
  _PasteLinkPageState createState() => _PasteLinkPageState();
}

class _PasteLinkPageState extends State<PasteLinkPage> {
  final TextEditingController _textController = TextEditingController();

  // VideoPlayerController? _controller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _textController.text = widget.data!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ///Text Form field for pasting the link
            TextFormField(
              controller: _textController,
              decoration:
                  InputDecoration(labelText: "Paste Youtube Video Link..."),
            ),

            ///Download Button for extrating and downloading the link
            GestureDetector(
              onTap: () {
                if (_textController.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("No link pasted")));
                } else {
                  ///Download the video
                    Down
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                color: Colors.red,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Download Video",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
