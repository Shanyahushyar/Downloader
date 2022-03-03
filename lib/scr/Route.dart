import 'package:downloader/scr/menu/Paste-link-page.dart';
import 'package:downloader/scr/home_screen.dart/home_drawer_screen.dart';
import 'package:downloader/scr/menu/downloading.dart';
import 'package:downloader/scr/menu/favorite.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);
  final String selectedLang = 'ar';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //  debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: Colors.deepPurple[400],
        //   textTheme: TextTheme(
        //       bodyText1: TextStyle(
        //     fontSize: 18,
        //   )),
        //   appBarTheme: const AppBarTheme(
        //     backgroundColor: Colors.red,
        //   ),
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),

        // theme: ThemeData.dark(),
        initialRoute: '/',
        // initialRoute: '/trainersScreen',
        routes: {
          '/': (context) => HomeScreen(),
          '/downloadhere': (context) => PasteLinkPage(),
          '/downloading': (context) => const Downloading(),
          '/favorite': (context) =>
              const favorite() //this has to be the Auth handler
          //  '/login': (context) => const LoginScreen(),
        });
  }
}
