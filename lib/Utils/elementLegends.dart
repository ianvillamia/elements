import 'package:flutter/material.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class ElementLegends extends StatelessWidget {
  ElementLegends({this.legends, this.color});
  final String legends;
  final Color color;
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: orientation == Orientation.landscape
                ? size.height * .07
                : size.height * .04,
            width: orientation == Orientation.landscape
                ? size.width * .04
                : size.width * .07,
            foregroundDecoration: BoxDecoration(
                color: color, backgroundBlendMode: BlendMode.multiply)),
        SizedBox(
          width: 15,
        ),
        Text(
          legends,
          style: CustomTextStyles.customText(size: FontSizes.medium),
        ),
      ],
    );
  }
}

class LegendsColors {
  static const alkaliMetals = Color(0xFFFFCCC9);
  static const alkalineEarthMetals = Color(0xFFD2D3FF);
  static const lanthanides = Color(0xFFCAFFFF);
  static const actinides = Color(0xFFCDFFEC);
  static const transitionMetals = Color(0xFFC4DDFF);
  static const postTransitionMetals = Color(0xFFCFFFC9);
  static const metalloids = Color(0xFFDFEDC4);
  static const reactiveNonmetals = Color(0xFFFFFFCD);
  static const nobleGases = Color(0xFFFFE6CA);
  static const unknown = Color(0xFFEBEB78);
}
