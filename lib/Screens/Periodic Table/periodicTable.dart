import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Screens/Periodic%20Table/detailpage.dart';
import 'package:mynewapp/Screens/Periodic Table/tablepage.dart';

const kRowCount = 10;

const kContentSize = 78.0;
const kGutterWidth = 2.5;
const kGutterInset = EdgeInsets.all(kGutterWidth);

class PeriodicTable extends StatefulWidget {
  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  final gridList = rootBundle
      .loadString('assets/elementsGrid.json')
      .then((source) => jsonDecode(source)['elements'] as List)
      .then((list) => list
          .map((json) => json != null ? ElementData.fromJson(json) : null)
          .toList());
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Container(
      child: ElementsApp(gridList),
    );
  }
}

class ElementData {
  final String name,
      category,
      symbol,
      extract,
      source,
      atomicWeight,
      triviaImage,
      triviaDesc,
      columnNumber;
  final int number;
  final int colors;

  ElementData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        category = json['category'],
        symbol = json['symbol'],
        extract = json['extract'],
        source = json['source'],
        atomicWeight = json['atomic_weight'],
        columnNumber = json['column_number'],
        number = json['number'],
        triviaImage = json['trivia_image'],
        triviaDesc = json['trivia_desc'],
        colors = json['colors'];
}

class ElementsApp extends StatelessWidget {
  ElementsApp(this.gridList);

  final Future<List<ElementData>> gridList;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.grey,
      textTheme:
          Typography.whiteMountainView.apply(fontFamily: 'Roboto Condensed'),
      primaryTextTheme:
          Typography.whiteMountainView.apply(fontFamily: 'Share Tech Mono'),
    );

    return Scaffold(body: TablePage(gridList));
  }
}

class ElementTile extends StatelessWidget implements PreferredSizeWidget {
  const ElementTile(this.element, {this.isLarge = false});

  final ElementData element;
  final bool isLarge;

  Size get preferredSize => Size.fromHeight(kContentSize * 1.5);

  @override
  Widget build(BuildContext context) {
    final tileText = <Widget>[
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text('${element.number}',
            style: TextStyle(
                fontFamily: 'Share Tech Mono',
                fontSize: 12.0,
                color: Colors.black)),
      ),
      Text(element.symbol,
          style: TextStyle(
              fontFamily: 'Share Tech Mono',
              fontSize: 20,
              color: Colors.black)),
      Text(
        element.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: isLarge ? 0.65 : 1,
        style: TextStyle(fontFamily: 'Roboto Condensed', color: Colors.black),
      ),
    ];

    final tile =
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _columnNumber(),
      Container(
        margin: kGutterInset,
        width: kContentSize,
        height: kContentSize,
        foregroundDecoration: BoxDecoration(
          color: Color(element.colors),
          backgroundBlendMode: BlendMode.multiply,
        ),
        child: RawMaterialButton(
          onPressed: !isLarge
              ? () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage(element)))
              : null,
          fillColor: Colors.blueGrey[50],
          disabledElevation: 10.0,
          padding: kGutterInset * 2.0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tileText),
        ),
      )
    ]);

    return Hero(
      tag: 'hero-${element.symbol}',
      flightShuttleBuilder: (_, anim, __, ___, ____) => ScaleTransition(
          scale: anim.drive(Tween(begin: 1, end: 1.75)), child: tile),
      child: Transform.scale(scale: isLarge ? 1.75 : 1, child: tile),
    );
  }

  Widget _columnNumber() {
    if (element.columnNumber == null) {
      return SizedBox();
    } else
      return Text(element.columnNumber,
          style:
              TextStyle(fontFamily: 'Roboto Condensed', color: Colors.black));
  }
}
