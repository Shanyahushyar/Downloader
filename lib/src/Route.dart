import 'package:flutter/material.dart';
import 'package:downloader/src/home_screen.dart/home_drawer_screen.dart';
import 'package:downloader/src/menu/Paste-link-page.dart';
import 'package:downloader/src/menu/downloading.dart';
import 'package:downloader/src/menu/favorite.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);
  final String selectedLang = 'ar';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // theme: ThemeData.dark(),

        initialRoute: '/',
        // initialRoute: '/trainersScreen',
        routes: {
          '/': (context) => const HomeScreen(),
          '/pastelinkpage': (context) => const PasteLinkPage(),
          '/downloading': (context) => const Downloading(),
          '/favorite': (context) =>
              const favorite() //this has to be the Auth handler
          //  '/login': (context) => const LoginScreen(),
        });
  }
}
