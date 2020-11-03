import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Periodic%20Table/periodicTable.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.element);

  final ElementData element;
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final listItems = <Widget>[
      ListTile(
          leading: Icon(Icons.category, color: Colors.white),
          title: Text(element.category.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Roboto Condensed', color: Colors.white))),
      ListTile(
        leading: Icon(Icons.info, color: Colors.white),
        title: Text(element.extract,
            style:
                TextStyle(fontFamily: 'Roboto Condensed', color: Colors.white)),
        subtitle:
            Text(element.source, style: TextStyle(color: Colors.yellow[100])),
      ),
      ListTile(
        leading: Icon(Icons.fiber_smart_record, color: Colors.white),
        title: Text(element.atomicWeight,
            style:
                TextStyle(fontFamily: 'Roboto Condensed', color: Colors.white)),
        subtitle: Text('Atomic Weight',
            style:
                TextStyle(fontFamily: 'Roboto Condensed', color: Colors.white)),
      ),
      ListTile(
        leading: Icon(
          Icons.lightbulb_outline,
          color: Colors.white,
        ),
        title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Did you know? \n" + element.triviaDesc,
                style: TextStyle(
                    fontFamily: 'Roboto Condensed', color: Colors.white))),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            height: size.height * .25,
            width: size.width * .05,
            child: FadeInImage.assetNetwork(
                placeholder: ('assets/loading.gif'),
                image: element.triviaImage),
          ),
        ),
      )
    ].expand((widget) => [widget, Divider()]).toList();

    return Scaffold(
      backgroundColor: Color.lerp(Colors.grey[700], element.colors[0], 0.07),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Color.lerp(Colors.grey[850], element.colors[1], 0.2),
        bottom: ElementTile(element, isLarge: true),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 30),
          child: ListView(
              padding: EdgeInsets.only(top: 24.0), children: listItems)),
    );
  }
}
