import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:projects/app/screens/app_routes.dart';
import 'package:projects/app/screens/calcul_history/calcul_history_screen.dart';
import 'package:projects/app/screens/scan_facture/scan_facture_screen.dart';
import 'package:projects/app/widgets/calculator_button.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void initState() {
    _outlineText = "2 + 2";
    _inlineText = "4";
    super.initState();
  }

  String _outlineText = "";
  String _inlineText = "";
  bool _gotResult = true;

  void _addCharacter(String char) {
    setState(() {
      if (_gotResult) {
        _clearFields();
      }
      _inlineText += char;
    });
  }

  void _addOperator(String char) {
    setState(() {
      if (_gotResult) {
        _outlineText = _inlineText + char;
        _gotResult = false;
      } else {
        _outlineText += _inlineText + char;
      }
      _inlineText = " ";
    });
  }

  void _clearFields() {
    if (_inlineText == " " || _gotResult) {
      setState(() {
        _inlineText = " ";
        _outlineText = "";
        _gotResult = false;
      });
    } else {
      setState(() {
        _inlineText = " ";
      });
    }
  }

  void _equals() {
    setState(() {
      _gotResult = true;
      _outlineText += _inlineText + " =";
      _inlineText = _outlineText.interpret().toString();
    });
  }

  void _openCameraScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScanFactureScreen(camera: cameras.first)));
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              onPressed: () => {_openCameraScreen()},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.save, color: Colors.black),
              onPressed: () =>
                  {Navigator.pushNamed(context, calculHistoryScreen)},
            ),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  _outlineText,
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                  textAlign: TextAlign.right,
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                SizedBox(
                  height: screenHeight / 15,
                  child: FittedBox(
                    child: Text(_inlineText,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right),
                  ),
                )
              ]),
            ),
            Padding(padding: EdgeInsets.only(top: screenHeight / 5)),
            Column(
              children: [
                Row(
                  children: [
                    CalculatorButton(
                      label: "C",
                      onTap: () => {_clearFields()},
                    ),
                    CalculatorButton(
                      label: "(",
                      onTap: () => {_addOperator("(")},
                    ),
                    CalculatorButton(
                      label: ")",
                      onTap: () => {_addOperator(")")},
                    ),
                    CalculatorButton(
                      label: "/",
                      onTap: () => {_addOperator(" /")},
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      label: "7",
                      onTap: () => {_addCharacter("7")},
                      filled: true,
                    ),
                    CalculatorButton(
                      label: "8",
                      onTap: () => {_addCharacter("8")},
                      filled: true,
                    ),
                    CalculatorButton(
                      label: "9",
                      onTap: () => {_addCharacter("9")},
                      filled: true,
                    ),
                    CalculatorButton(
                      label: "x",
                      onTap: () => {_addOperator(" *")},
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      label: "4",
                      filled: true,
                      onTap: () => {_addCharacter("4")},
                    ),
                    CalculatorButton(
                      label: "5",
                      filled: true,
                      onTap: () => {_addCharacter("5")},
                    ),
                    CalculatorButton(
                      label: "6",
                      filled: true,
                      onTap: () => {_addCharacter("6")},
                    ),
                    CalculatorButton(
                      label: "-",
                      onTap: () => {_addOperator(" -")},
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      label: "1",
                      filled: true,
                      onTap: () => {_addCharacter("1")},
                    ),
                    CalculatorButton(
                      label: "2",
                      filled: true,
                      onTap: () => {_addCharacter("2")},
                    ),
                    CalculatorButton(
                      label: "3",
                      filled: true,
                      onTap: () => {_addCharacter("3")},
                    ),
                    CalculatorButton(
                      label: "+",
                      onTap: () => {_addOperator(" +")},
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      label: "0",
                      filled: true,
                      doubleSize: true,
                      onTap: () => {_addCharacter("0")},
                    ),
                    CalculatorButton(
                      label: ".",
                      filled: true,
                      onTap: () => {_addCharacter(".")},
                    ),
                    CalculatorButton(
                      label: "=",
                      onTap: () => {_equals()},
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
