import 'package:downloader/downloder.dart';
import 'package:downloader/src/home_screen.dart/home_drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class BrowserPage extends StatefulWidget {
  String? data;
  BrowserPage({Key? key, this.data}) : super(key: key);
  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  final link = "https://www.youtube.com";
  WebViewController? _controller;

  bool _showDownloadButton = false;

  void checkUrl() async {
    if (await _controller!.currentUrl() == "https://m.youtube.com/") {
      setState(() {
        _showDownloadButton = false;
      });
    } else {
      setState(() {
        _showDownloadButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUrl();
    return WillPopScope(
      onWillPop: () async {
        if (await _controller!.canGoBack()) {
          _controller!.goBack();
        }
        return false;
      },
      child: Scaffold(
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
          title: const Text('YouTube',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 255, 255))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
              onPressed: () {},
            ),
          ],
        ),
        body: WebView(
          initialUrl: widget.data == "" ? link : widget.data,
          javascriptMode: JavascriptMode.unrestricted,
          onWebResourceError: (error) {
            showDialog(
                context: context,
                barrierColor: Colors.grey,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Something went wrong!"),
                    content: const Text("Missing Internet connection"),
                    scrollable: true,
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomeScreen()),
                                (route) => false);
                          },
                          child: const Text("Okay"))
                    ],
                  );
                });
          },
          onWebViewCreated: (controller) {
            setState(() {
              _controller = controller;
            });
          },
        ),
        floatingActionButton: _showDownloadButton == false
            ? Container()
            : FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () async {
                  final url = await _controller!.currentUrl();
                  final title = await _controller!.getTitle();

                  ///Download the video
                  Download_Vedio().downloadVideo(url!, "$title");
                },
                child: const Icon(Icons.download),
              ),
      ),
    );
  }
}
