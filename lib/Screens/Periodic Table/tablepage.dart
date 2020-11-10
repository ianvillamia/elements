import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Periodic%20Table/periodicTable.dart';
import 'package:mynewapp/Utils/elementLegends.dart';

const kRowCount = 10;

const kContentSize = 78.0;
const kGutterWidth = 2.5;
const kGutterInset = EdgeInsets.all(kGutterWidth);

class TablePage extends StatefulWidget {
  TablePage(this.gridList);
  final Future<List<ElementData>> gridList;

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> with TickerProviderStateMixin {
  Size size;

  Animation<Matrix4> _animationReset;
  AnimationController _controllerReset;
  final TransformationController _transformationController =
      TransformationController();

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

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
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Periodic Table of Elements',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        elevation: 0.4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateResetInitialize,
        tooltip: 'Reset',
        child: Icon(Icons.replay),
        backgroundColor: Colors.yellow[800],
      ),
      body: Container(
        width: size.width * 5,
        child: FutureBuilder(
          future: widget.gridList,
          builder: (_, snapshot) => snapshot.hasData
              ? Padding(
                  padding: EdgeInsets.all(8), child: _buildTable(snapshot.data))
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildTable(List<ElementData> elements) {
    final tiles = elements
        .map((element) => element != null
            ? ElementTile(element)
            : Container(color: Colors.transparent, margin: kGutterInset))
        .toList();
    return StatefulBuilder(builder: (context, setState) {
      Orientation orientation = MediaQuery.of(context).orientation;
      return ListView(scrollDirection: Axis.horizontal, children: [
        SingleChildScrollView(
            child: Center(
                child: InteractiveViewer(
          panEnabled: false,
          transformationController: _transformationController,
          boundaryMargin: EdgeInsets.all(900),
          maxScale: 1.0,
          minScale: 0.5,
          child: Stack(children: [
            Positioned(
              left: 350,
              top: 30,
              child: Container(
                padding: EdgeInsets.all(5),
                height: orientation == Orientation.landscape
                    ? size.height * .47
                    : size.height * .27,
                width: orientation == Orientation.landscape
                    ? size.width * .8
                    : size.width * 1.2,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElementLegends(
                          legends: "Alkali Metals",
                          color: LegendsColors.alkaliMetals,
                        ),
                        ElementLegends(
                          legends: "Alkaline Earth Metals",
                          color: LegendsColors.alkalineEarthMetals,
                        ),
                        ElementLegends(
                          legends: "Transition Metals",
                          color: LegendsColors.transitionMetals,
                        ),
                        ElementLegends(
                          legends: "Post Transition Metals",
                          color: LegendsColors.postTransitionMetals,
                        ),
                        ElementLegends(
                          legends: "Metalloids",
                          color: LegendsColors.metalloids,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElementLegends(
                            legends: "Reactive Non-metals",
                            color: LegendsColors.reactiveNonmetals),
                        ElementLegends(
                          legends: "Noble Gases",
                          color: LegendsColors.nobleGases,
                        ),
                        ElementLegends(
                          legends: "Lanthanides",
                          color: LegendsColors.lanthanides,
                        ),
                        ElementLegends(
                          legends: "Actinides",
                          color: LegendsColors.actinides,
                        ),
                        ElementLegends(
                          legends: "Unknown",
                          color: LegendsColors.unknown,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: SizedBox(
                  height: kRowCount * (kContentSize + (kGutterWidth * 10)),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: kRowCount,
                    children: tiles,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
          ]),
        )))
      ]);
    });
  }
}
