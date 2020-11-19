import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Game/elements/Methoxymethane.dart';
import 'package:mynewapp/Game/miniItems/error.dart';
import 'package:mynewapp/Widgets/rotateDevice.dart';
import 'package:mynewapp/Game/miniItems/success.dart';

import 'package:mynewapp/Models/Coordinates.dart';

import 'package:mynewapp/Providers/gameProvider.dart';

import 'package:mynewapp/Game/miniItems/elementContainer.dart';

import 'package:mynewapp/Utils/textStyles.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  final Widget element;
  final String elementName;
  Game({@required this.element, @required this.elementName});

  @override
  _ProtoGameState createState() => _ProtoGameState();
}

class _ProtoGameState extends State<Game> with TickerProviderStateMixin {
  Color _color = Colors.white;
  double sidebarWidth = 100;
  bool isExpanded = false;
  Size size;

  IconData _icon = Icons.arrow_left;
  Color _elementContainer = Colors.transparent;
  bool isInit = false;
  bool isCongrats = false;

  GameProvider _gameProvider;

  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4> _animationReset;
  AnimationController _controllerReset;

  void _onAnimateReset() {
    _transformationController.value = _animationReset.value;
    if (!_controllerReset.isAnimating) {
      _animationReset?.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

// Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    // If the user tries to cause a transformation while the reset animation is
    // running, cancel the reset animation.
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _gameProvider = Provider.of<GameProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _gameProvider = Provider.of<GameProvider>(context, listen: true);
    size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: isPortrait
          ? RotateDevice()
          : Container(
              color: Colors.white,
              width: size.width,
              height: size.height,
              child: Column(
                children: <Widget>[
                  // Text('CH3-O-CH3'),
                  _gameScreen()
                  //enter widgets here
                ],
              ),
            ),
    );
  }

  _gameScreen() {
    return Expanded(
        child: Container(
      child: Stack(
        children: [
          InteractiveViewer(
              transformationController: _transformationController,
              boundaryMargin: EdgeInsets.all(900),
              maxScale: 1.5,
              minScale: 1,
              child: widget.element),
          ElementContainer(
              element: widget.element, elementName: widget.elementName),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: size.width * .25,
                height: size.height * .15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(25)),
                child: MaterialButton(
                  elevation: 10,
                  color: Colors.amber,
                  onPressed: () {
                    _gameProvider.elementReader.checkIfCorrect();

                    print(_gameProvider.elementReader.elementCorrect);
                    if (_gameProvider.elementReader.elementCorrect) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Success()));
                    } else {
                      //shake screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ErrorScreen()));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: CustomTextStyles.customText(
                        isBold: true, size: FontSizes.medium),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: size.width * .2,
              height: size.height * .2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Selected'),
                  ElasticIn(
                    key: ObjectKey(_gameProvider.element.element),
                    child: GestureDetector(
                      onTap: () {},
                      child: Draggable(
                        feedback: ClipOval(
                          child: Container(
                              width: 50,
                              height: 50,
                              color: _gameProvider.element.elementColor,
                              child: Center(
                                child: Text(_gameProvider.element.element,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _gameProvider.element.fontColor,
                                    )),
                              )),
                        ),
                        childWhenDragging: Container(),
                        data: 'boom',
                        onDragStarted: () {
                          print('this');
                        },
                        child: ClipOval(
                          child: Container(
                              width: 50,
                              height: 50,
                              color: _gameProvider.element.elementColor,
                              child: Center(
                                child: Text(_gameProvider.element.element,
                                    style: TextStyle(
                                      color: _gameProvider.element.fontColor,
                                    )),
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              widget.elementName.toString(),
              style: GoogleFonts.indieFlower(
                  fontSize: 40, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ));
  }
}
