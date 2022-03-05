import 'package:downloader/downloder.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:lottie/lottie.dart';

//import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

// ignore: must_be_immutable
class PasteLinkPage extends StatefulWidget {
  const PasteLinkPage({Key? key}) : super(key: key);
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
        // _textController.text = widget.data!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 184, 177),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title:
            Lottie.asset('assets/lottieJSON/logo.json', height: 60, width: 60),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              child: Lottie.asset('assets/lottieJSON/downloading.json'),
              height: 200,
              width: 50,
            ),

            ///Text Form field for pasting the link
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                  labelText: "Paste Youtube Video Link..."),
            ),

            ///Download Button for extrating and downloading the link
            GestureDetector(
              onTap: () {
                if (_textController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No link pasted")));
                } else {
                  //Download the video
                  Download_Vedio().downloadVideo(
                      _textController.text.trim(), " Youtube Downloader");
                }
                _textController.clear();
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                color: Color.fromARGB(255, 127, 184, 177),
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Download Video",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
