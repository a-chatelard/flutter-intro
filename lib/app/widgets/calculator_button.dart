import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key? key,
      this.filled = false,
      required this.label,
      this.doubleSize = false,
      required this.onTap})
      : super(key: key);

  final String label;
  final bool filled;
  final bool doubleSize;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: doubleSize ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          splashColor: Colors.grey,
          onTap: () => onTap(),
          child: Ink(
              child: SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                        color: filled ? Colors.white : Colors.black,
                        fontSize: 30),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2),
                  color: filled ? Colors.black : Colors.white)),
        ),
      ),
    );
  }
}
