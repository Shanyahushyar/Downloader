
// ignore_for_file: camel_case_types

import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';



class Download_Vedio {
  Future<void> downloadVideo(String youTubeLink, String title) async {
    final result = await FlutterYoutubeDownloader.downloadVideo(
        youTubeLink, "$title", 18);
    print(result);
  }
}