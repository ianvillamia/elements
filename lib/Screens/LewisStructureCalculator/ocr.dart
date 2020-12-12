import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:mynewapp/Screens/LewisStructureCalculator/showStructure.dart';

class OCR extends StatefulWidget {
  @override
  _OCRState createState() => _OCRState();
}

class _OCRState extends State<OCR> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

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
                          //pass _textValue to new widget
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ShowStructure(
                              condensed: _textValue,
                            );
                          }));
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
