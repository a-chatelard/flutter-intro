import 'package:flutter/material.dart';

class CalculatorRow extends StatelessWidget {
  const CalculatorRow({Key? key, this.children = const []}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}
