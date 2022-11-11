import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FileDownloadScreen extends StatefulWidget {
  const FileDownloadScreen({Key? key}) : super(key: key);

  @override
  State<FileDownloadScreen> createState() => _FileDownloadScreenState();
}

class _FileDownloadScreenState extends State<FileDownloadScreen> {
  List<String> courseList = [
    "Dart",
    "Flutter",
    "Java",
    "Kotlin",
    "Swift",
    "Angular",
    "React",
    "Spring",
    "JavaScript",
    "C++",
    "Python",
    "Android",
    "Iconic",
    "Xamarin"
  ];
  @override
  Widget build(BuildContext context) {
    debugPrint(">>>>>>>>");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange.shade200,
        title: const Text("Download Provider"),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return CourseListItem(courseName: courseList[index]);
        },
      ),
    );
  }
}


class CourseListItem extends StatefulWidget {
  const CourseListItem({Key? key, required this.courseName}) : super(key: key);

  final String courseName;

  @override
  State<CourseListItem> createState() => _CourseListItemPage();
}

class _CourseListItemPage extends State<CourseListItem> {
  int downloadProgress = 0;

  bool isDownloadStarted = false;

  bool isDownloadFinish = false;

  @override
  Widget build(BuildContext context) {
    debugPrint("----------------");
    return ListTile(
        title: Text(widget.courseName),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor:
          Colors.orange.shade200,
          child: Text(
            widget.courseName.substring(0, 1),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        trailing: Column(children: [


          TextButton(onPressed: (){

          }, child: Text("ghcjgsj")),


          Visibility(
              visible: isDownloadStarted,
              child: CircularPercentIndicator(
                radius: 20.0,
                lineWidth: 3.0,
                percent: (downloadProgress / 100),
                center: Text(
                  "$downloadProgress%",
                  style: const TextStyle(fontSize: 12, color: Colors.blue),
                ),
                progressColor: Colors.blue,
              )),
          Visibility(
              visible: !isDownloadStarted,
              child: IconButton(
                icon: isDownloadFinish ? const Icon(Icons.home): const Icon(Icons.download),
                color: isDownloadFinish ? Colors.green : Colors.grey,
                onPressed: downloadCourse,
              ))
        ])
    );
  }

  void downloadCourse() async {
    isDownloadStarted = true;
    isDownloadFinish = false;
    downloadProgress = 0;
    setState(() {});

    //Download logic
    while (downloadProgress < 100) {
      // Get download progress
      downloadProgress += 1;
      setState(() {});
      if (downloadProgress == 100) {
        isDownloadFinish = true;
        isDownloadStarted = false;
        setState(() {});
        break;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}