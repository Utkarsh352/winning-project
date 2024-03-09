import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:huehue1/services/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';
import 'package:more_main_axis_alignment/more_main_axis_alignment.dart';

import 'services/render_data.dart';

class PushedPageS extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageS({required this.cameras, required this.title});
  @override
  _PushedPageSState createState() => _PushedPageSState();
}

class _PushedPageSState extends State<PushedPageS> {
  late List<dynamic> _data;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    print('Model Response: ' + res.toString());
  }

  _setRecognitions(data, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  loadModel() async {
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignAI Squat'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          CameraWidget(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MoreRow(
              moreMainAxisAlignment: MoreMainAxisAlignment.spaceBetweenStep,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              ],
            ),
          ),
          RenderData(
            data: _data == null ? [] : _data,
            previewH: max(_imageHeight, _imageWidth),
            previewW: min(_imageHeight, _imageWidth),
            screenH: screen.height,
            screenW: screen.width,
          ),
        ],
      ),
    );
  }
}
