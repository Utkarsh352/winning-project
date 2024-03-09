import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:huehue1/main.dart';

import 'pushed_pageA.dart';
import 'pushed_pageS.dart';
import 'pushed_pageY.dart';

class MainScreen extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MainScreen(this.cameras);

  static const String id = 'main_screen';
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: const Text(
              'AlignAI',
              style: TextStyle(
                color: Color(0xFFFE7C7C),
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: const Text(
              'Master Your Body Alignment',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Other UI elements
        ],
      ),
    );
  }
}

void onSelectA({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageA(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectS({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageS(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectY({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageY(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}
