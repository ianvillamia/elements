import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Screens/Periodic%20Table/detailpage.dart';
import 'package:zoom_widget/zoom_widget.dart';

const kRowCount = 10;

const kContentSize = 75.0;
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
  Widget build(BuildContext context) {
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
      triviaDesc;
  final int number;
  final List<Color> colors;

  ElementData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        category = json['category'],
        symbol = json['symbol'],
        extract = json['extract'],
        source = json['source'],
        atomicWeight = json['atomic_weight'],
        number = json['number'],
        triviaImage = json['trivia_image'],
        triviaDesc = json['trivia_desc'],
        colors = (json['colors'] as List).map((value) => Color(value)).toList();
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

class TablePage extends StatelessWidget {
  TablePage(this.gridList);

  final Future<List<ElementData>> gridList;
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Periodic Table of Elements'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800]),
      body: Zoom(
        width: size.width * 4.05,
        height: size.height * 1.3,
        canvasColor: Colors.blueGrey[600],
        backgroundColor: Colors.blueGrey[600],
        doubleTapZoom: true,
        centerOnScale: true,
        zoomSensibility: 2.5,
        child: FutureBuilder(
          future: gridList,
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
            : Container(color: Colors.blueGrey[600], margin: kGutterInset))
        .toList();
    return SingleChildScrollView(
      child: SizedBox(
        height: kRowCount * (kContentSize + (kGutterWidth * 2)),
        child: GridView.count(
          crossAxisCount: kRowCount,
          children: tiles,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
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
                fontSize: 10.0,
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

    final tile = Container(
      margin: kGutterInset,
      width: kContentSize,
      height: kContentSize,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(colors: element.colors),
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
    );

    return Hero(
      tag: 'hero-${element.symbol}',
      flightShuttleBuilder: (_, anim, __, ___, ____) => ScaleTransition(
          scale: anim.drive(Tween(begin: 1, end: 1.75)), child: tile),
      child: Transform.scale(scale: isLarge ? 1.75 : 1, child: tile),
    );
  }
}
