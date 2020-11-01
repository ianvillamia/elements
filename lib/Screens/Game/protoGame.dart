import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';
import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Screens/Game/elementContainer.dart';
import 'package:provider/provider.dart';

class ProtoGame extends StatefulWidget {
  ProtoGame({Key key}) : super(key: key);

  @override
  _ProtoGameState createState() => _ProtoGameState();
}

class _ProtoGameState extends State<ProtoGame> with TickerProviderStateMixin {
  Color _color = Colors.white;
  double sidebarWidth = 100;
  bool isExpanded = false;
  Size size;
  List elements = [];
  IconData _icon = Icons.arrow_left;
  Color _elementContainer = Colors.transparent;
  bool isInit = false;

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
    // _gameProvider.element.element = 'H';

    // _gameProvider.element.elementColor = Colors.red;
    // _gameProvider.element.fontColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    _gameProvider = Provider.of<GameProvider>(context);

    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
    if (isInit == false) {
      Coordinates origin = Coordinates();
      origin.x = size.width * .3;
      origin.y = size.height * .367;
      elements.add(_spawnObject(coordinates: origin));
      setState(() {
        isInit = true;
      });
    }

    return Expanded(
        child: Container(
      child: Stack(
        children: [
          InteractiveViewer(
            transformationController: _transformationController,
            boundaryMargin: EdgeInsets.all(900),
            maxScale: 10.0,
            minScale: 0.1,
            child: Stack(
              children: elements.map<Widget>((e) {
                return e;
              }).toList(),
            ),
          ),
          ElementContainer(),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  _spawnObject({Coordinates coordinates, Spawn spawn}) {
    if (spawn == Spawn.left) {
      Coordinates left = Coordinates();
      left.x = coordinates.x + 102.5;
      left.y = coordinates.y;
      return Positioned(
          top: coordinates.y,
          left: coordinates.x - 102.5,
          child: _element(
              color: Colors.greenAccent, coordinate: left, spawn: Spawn.left));
    } else if (spawn == Spawn.right) {
      Coordinates right = Coordinates();
      right.x = coordinates.x + 112.08;
      right.y = coordinates.y;
      return Positioned(
          top: coordinates.y,
          left: coordinates.x + 112.08,
          child: _element(
              color: Colors.blue, coordinate: right, spawn: Spawn.right));
    } else if (spawn == Spawn.top) {
      Coordinates top = Coordinates();
      top.x = coordinates.x;
      top.y = coordinates.y - 89.28;
      return Positioned(
          top: coordinates.y - 89.28,
          left: coordinates.x,
          child:
              _element(color: Colors.grey, coordinate: top, spawn: Spawn.top));
    } else if (spawn == Spawn.bottom) {
      Coordinates bot = Coordinates();
      bot.x = coordinates.x;
      bot.y = coordinates.y + 89.28;
      return Positioned(
          top: coordinates.y + 89.28,
          left: coordinates.x,
          child: _element(
              color: Colors.amber, coordinate: bot, spawn: Spawn.bottom));
    } else {
      return Positioned(
          top: coordinates.y,
          left: coordinates.x,
          child: _element(
              color: Colors.deepOrange,
              coordinate: coordinates,
              spawn: Spawn.origin));
    }
  }

  _element(
      {Color color, @required Coordinates coordinate, @required Spawn spawn}) {
    return GestureDetector(
      onTap: () => _add(coordinate, spawn),
      child: ElasticIn(
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _add(Coordinates origin, Spawn spawn) {
    if (spawn == Spawn.origin) {
      setState(() {
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.left));
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.right));
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.top));
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.bottom));
      });
    }
  }
}
