import 'package:flutter/material.dart';

class announcementPage extends StatefulWidget {
  const announcementPage({super.key});

  @override
  State<announcementPage> createState() => _announcementPageState();
}

class _announcementPageState extends State<announcementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 246, 234),
        title: Text('공지사항', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset(
              'image/flower.jpg',
              width: 230,
            ),
          ],
        ),
      ),
    );
  }
}
