import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class OCRTest extends StatefulWidget {
  @override
  _OCRTestState createState() => _OCRTestState();
}

class _OCRTestState extends State<OCRTest> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "Click the Camera";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            MaterialButton(
              onPressed: _read,
              color: Colors.blue,
              textColor: Colors.white,
              child: Icon(
                Icons.camera_alt,
                size: 24,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _read() async {
    List<OcrText> list = [];
    try {
      list =
          await FlutterMobileVision.read(waitTap: true, fps: 7, multiple: true);

      for (OcrText text in list) {
        print('values ${text.value}');
      }

      setState(() {
        _textValue = list[0].value;
      });
    } on Exception {
      list.add(new OcrText('Failed to recognize text.'));
    }
  }
}
