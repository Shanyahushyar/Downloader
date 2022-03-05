import 'package:flutter/material.dart';
import 'Youtube.dart';

class BrowserCardS extends StatefulWidget {
  const BrowserCardS({Key? key}) : super(key: key);

  @override
  State<BrowserCardS> createState() => _BrowserCardSState();
}

class _BrowserCardSState extends State<BrowserCardS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('YouTube', 'assets/youtube.png', context),
                  _buildCard('Instagram', 'assets/instagram.png', context),
                  _buildCard('TikTok', 'assets/tiktok.png', context),
                  _buildCard('Snapchat', 'assets/snap.png', context),
                ],
              )),
          const SizedBox(height: 10.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String imgPath, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BrowserPage()));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                      )),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 150.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: const Color(0xFFEBEBEB),
                        height: 1.0,
                      )),
                  Text(name,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                ]))));
  }
}
