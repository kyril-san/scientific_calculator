// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scientific_calculator/presentation/Home/const/calculate_operators.dart';
import 'package:scientific_calculator/presentation/Home/const/constant_variable.dart';
import 'package:scientific_calculator/presentation/Home/widgets/calculate.dart';
import 'package:scientific_calculator/presentation/Home/widgets/reusable_containers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late TextEditingController _inputcontroller;
Calculations calcs = Calculations(calc: CalculatorOperators.ADD);
double finalvalue = 0;
double savedanswer = 0;
bool isscreenhorizontal = false;

class _HomePageState extends State<HomePage> {
  //* To Initialize the Controllers
  @override
  void initState() {
    super.initState();
    _inputcontroller = TextEditingController();
  }

//* To Change the Orientation of the Screen
  void changetoHorizontalorVertical() {
    setState(() {
      isscreenhorizontal = !isscreenhorizontal;
      if (isscreenhorizontal == false) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      } else if (isscreenhorizontal == true) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft]);
      }
    });
  }

//* To Update The TextField when the User Clicks a NumPad Button
  void updateInputTextfield(String symbol) {
    // switch (symbol) {
    //   case plus:

    //     break;
    //   default:
    // }
    setState(() {
      _inputcontroller.text = '${_inputcontroller.text}$symbol';
    });
  }

//* To Delete or Clear the TextField Once The User Clicks the Delete Button
  void deleteInputTextfield() {
    setState(() {
      final length = _inputcontroller.text.length;
      _inputcontroller.text =
          _inputcontroller.text.substring(0, length - 1 < 0 ? 0 : length - 1);
    });
  }

  //* To Clear The Whole TextField at Once
  void clearEntireInputTextfield() {
    setState(() {
      _inputcontroller.clear();
      finalvalue = 0;
    });
  }

//* To Dispose the Controller
  @override
  void dispose() {
    super.dispose();
    _inputcontroller.dispose();
  }

  //* TO Display the Answer on the Screen
  void showAnswerOnScreen(
    String text,
  ) async {
    if (!_inputcontroller.text.contains('Ans')) {
      var result = await calcs.appcalculations(text);

      setState(() {
        finalvalue = result;
        savedanswer = finalvalue;
      });
    } else {
      setState(() {
        finalvalue = savedanswer;
      });
    }
  }

  //* To Show the Answer on the Screen
  void displayonlytheANS() {
    String text = 'ANS';
    setState(() {
      // _inputcontroller.clear();
      _inputcontroller.text = '${_inputcontroller.text}$text';
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.only(top: isscreenhorizontal ? 20 : 50.0),
        child: Column(
          children: [
            //! TextformField for the input Values
            Expanded(
              flex: 2,
              child: Container(
                // height: 150,
                // color: Colors.white,
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    TextFormField(
                      textAlign: TextAlign.end,
                      controller: _inputcontroller,
                      autofocus: true,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 5, bottom: 20, top: 20)),
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      style: TextStyle(
                          fontSize: isscreenhorizontal ? 20 : 50,
                          color: Colors.grey[300]),
                      onChanged: (value) {
                        _inputcontroller.text = value;
                      },
                      readOnly: true,
                      keyboardType: TextInputType.none,
                    ),
                    Spacer(),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text('$finalvalue',
                            style: TextStyle(
                                fontSize: isscreenhorizontal ? 20 : 40,
                                color: Colors.grey[500]))),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 130),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    iconSize: isscreenhorizontal ? 18 : 24,
                                    onPressed: () {},
                                    icon: Icon(Icons.access_alarm,
                                        color: Colors.white)),
                                IconButton(
                                    iconSize: isscreenhorizontal ? 18 : 24,
                                    onPressed: () {},
                                    icon: Icon(Icons.ac_unit,
                                        color: Colors.white)),
                                IconButton(
                                    iconSize: isscreenhorizontal ? 18 : 24,
                                    onPressed: () {
                                      changetoHorizontalorVertical();
                                    },
                                    icon: Icon(Icons.calculate_outlined,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            iconSize: isscreenhorizontal ? 18 : 24,
                            onPressed: () {
                              setState(() {
                                deleteInputTextfield();
                              });
                            },
                            icon: Icon(Icons.backspace_outlined,
                                color: Colors.white))
                      ],
                    ),
                    SizedBox(height: isscreenhorizontal ? 0 : 20),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey[700],
              thickness: 2,
            ),

            Expanded(
              flex: isscreenhorizontal ? 3 : 3,
              child: Row(
                children: [
                  //! Scientific Components
                  isscreenhorizontal
                      ? Expanded(
                          child: SizedBox(
                            height: 300,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    actionPadButtonsComponents(
                                        char: changesides, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: rad, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: squareroot, ontap: () {}),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    actionPadButtonsComponents(
                                        char: sin, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: cos, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: tan, ontap: () {}),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    actionPadButtonsComponents(
                                        char: ln, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: log, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: onedividex, ontap: () {}),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    actionPadButtonsComponents(
                                        char: abs, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: x2, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: xy, ontap: () {}),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    actionPadButtonsComponents(
                                        char: abs, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: pie, ontap: () {}),
                                    actionPadButtonsComponents(
                                        char: e, ontap: () {}),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  //! Number Pads with Basic Components

                  Expanded(
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: isscreenhorizontal
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: numPadpaddingtop),
                          child: Row(
                            children: [
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: clear,
                                  ontap: () {
                                    clearEntireInputTextfield();
                                  }),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: brackets,
                                  ontap: () {}),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: percentage,
                                  ontap: () {
                                    updateInputTextfield(percentage);
                                  }),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: divide,
                                  ontap: () {
                                    updateInputTextfield(divide);
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: numPadpaddingtop),
                          child: Row(
                            children: [
                              for (int i = 7; i <= 9; i++)
                                numPadButtonsComponents(
                                    horiz: isscreenhorizontal,
                                    symbol: '$i',
                                    ontap: () => updateInputTextfield('$i')),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: multiply,
                                  ontap: () {
                                    updateInputTextfield(multiply);
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: numPadpaddingtop),
                          child: Row(
                            children: [
                              for (int i = 4; i <= 6; i++)
                                numPadButtonsComponents(
                                    horiz: isscreenhorizontal,
                                    symbol: '$i',
                                    ontap: () => updateInputTextfield('$i')),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: minus,
                                  ontap: () {
                                    updateInputTextfield(minus);
                                  })
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: numPadpaddingtop),
                          child: Row(
                            children: [
                              for (int i = 1; i <= 3; i++)
                                numPadButtonsComponents(
                                    horiz: isscreenhorizontal,
                                    symbol: '$i',
                                    ontap: () => updateInputTextfield('$i')),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: plus,
                                  ontap: () {
                                    updateInputTextfield(plus);
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: numPadpaddingtop),
                          child: Row(
                            children: [
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: plusminus,
                                  ontap: () {}),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: '0',
                                  ontap: () => updateInputTextfield('0')),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: dot,
                                  ontap: () => updateInputTextfield(dot)),
                              numPadButtonsComponents(
                                  horiz: isscreenhorizontal,
                                  symbol: equal,
                                  ontap: () {
                                    showAnswerOnScreen(_inputcontroller.text);
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
