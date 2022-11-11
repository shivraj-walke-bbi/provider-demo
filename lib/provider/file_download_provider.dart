import 'package:flutter/foundation.dart';

class FileDownloadProvider with ChangeNotifier {
  bool isDownloadStarted = true;
  bool get _isDownloadStarted => isDownloadStarted;

  bool isDownloadFinish = true;
  bool get _isDownloadFinish => isDownloadFinish;

  int downloadProgress = 0;
  int get _downloadProgress => downloadProgress;

  void downloadCourse() async {
    isDownloadStarted = true;
    isDownloadFinish = false;
    downloadProgress = 0;
    notifyListeners();

    //Download logic
    while (downloadProgress < 100) {
      // Get download progress
      downloadProgress += 1;
      notifyListeners();
      if (downloadProgress == 100) {
        isDownloadFinish = true;
        isDownloadStarted = false;
        notifyListeners();
        break;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}
