import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class OCR extends StatefulWidget {
  @override
  _OCRState createState() => _OCRState();
}

class _OCRState extends State<OCR> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  bool hide = false, hideImage = false, hideImageWrong = false;
  String _textValue =
      "Click the camera to open and generate the organic compound";
  Size size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _read,
        child: Icon(Icons.camera_alt),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  _textValue,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.width * .05),
                ),
                Visibility(
                  visible: hide,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if (_textValue == 'CH3-O-CH3') {
                            setState(() {
                              hideImage = true;
                              //hideImageWrong = !hideImageWrong;
                            });
                            hideImageWrong = false;
                          } else if (_textValue != 'CH3-O-CH3') {
                            setState(() {
                              //hideImageWrong = !hideImageWrong;
                              hideImageWrong = true;
                              hideImage = false;
                            });
                          }
                        },
                        child: Text('CALCULATE'),
                        color: Colors.purpleAccent,
                      ),
                      SizedBox(width: size.width * 0.03),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _textValue =
                                "Click the camera to open and generate the organic compound";
                          });
                          hide = false;
                          hideImage = false;
                          hideImageWrong = false;
                        },
                        child: Text('RESET'),
                        color: Colors.purpleAccent,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Visibility(
                  visible: hideImage,
                  child: Container(
                      height: size.height * .3,
                      child: Image.asset('assets/methoxymethane.png',
                          fit: BoxFit.cover)),
                ),
                Visibility(
                  visible: hideImageWrong,
                  child: Container(
                      height: size.height * .3,
                      child: Image.asset('assets/wrongcompound.png',
                          fit: BoxFit.contain)),
                ),
                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _cameraOcr,
        waitTap: true,
      );

      setState(() {
        _textValue = texts[0].value;
        hide = true;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }
}
