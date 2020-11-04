import 'package:flutter/material.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class ElementLegends extends StatelessWidget {
  ElementLegends({this.legends, this.color});
  final String legends;
  final LinearGradient color;
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
            decoration: BoxDecoration(gradient: color)),
        SizedBox(
          width: 15,
        ),
        Text(
          legends,
          style: CustomTextStyles.customText(
              size: FontSizes.medium, color: Colors.white),
        ),
      ],
    );
  }
}

class LegendsColors {
  static const alkaliMetals =
      LinearGradient(colors: [Color(0xFFD32F2F), Color(0xFFFF77A9)]);
  static const alkalineEarthMetals =
      LinearGradient(colors: [Color(0xFFF46B45), Color(0xFFEEA849)]);
  static const lanthanides =
      LinearGradient(colors: [Color(0xFF8BC34A), Color(0xFFD4E157)]);
  static const actinides =
      LinearGradient(colors: [Color(0xFF0ED2F7), Color(0xFFB2FEFA)]);
  static const transitionMetals =
      LinearGradient(colors: [Color(0xFFFFCA28), Color(0xFFFFF263)]);
  static const postTransitionMetals =
      LinearGradient(colors: [Color(0xFF11998E), Color(0xFF38EF7D)]);
  static const metalloids =
      LinearGradient(colors: [Color(0xFF0072FF), Color(0xFF00C6FF)]);
  static const reactiveNonmetals =
      LinearGradient(colors: [Color(0xFF536DFE), Color(0xFF8E99F3)]);
  static const nobleGases =
      LinearGradient(colors: [Color(0xFF9796F0), Color(0xFFFBC7D4)]);
  static const unknown =
      LinearGradient(colors: [Color(0xFF757F9A), Color(0xFFD7DDE8)]);
}
