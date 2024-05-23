import 'package:flutter/material.dart';
import 'package:hrms/config.dart';

class LayerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.7, // Adjust height based on screen size
      decoration: const BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
      ),
    );
  }
}
