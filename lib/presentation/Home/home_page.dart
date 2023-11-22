// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
int finalvalue = 0;
Calculations calcs = Calculations(calc: CalculatorOperators.ADD);

class _HomePageState extends State<HomePage> {
  //* To Initialize the Controllers
  @override
  void initState() {
    super.initState();
    _inputcontroller = TextEditingController();
  }

//* To Update The TextField when the User Clicks a NumPad Button
  void updateInputTextfield(String symbol) {
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
    });
  }

//* To Dispose the Controller
  @override
  void dispose() {
    super.dispose();
    _inputcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            //! TextformField for the input Values
            Container(
              height: 150,
              color: Colors.white,
              padding: EdgeInsets.only(right: 5),
              child: Column(
                children: [
                  TextFormField(
                    controller: _inputcontroller,
                    autofocus: true,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 5, bottom: 20, top: 20)),
                    showCursor: true,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 30),
                    onChanged: (value) {
                      _inputcontroller.text = value;
                    },
                    readOnly: true,
                    keyboardType: TextInputType.none,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$finalvalue',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),

            //! Scientific Components
            Expanded(
              child: Container(
                // height: 300,
                color: Colors.red,
              ),
            ),
            //! Number Pads with Basic Components

            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 50, right: 15),
                // height: 300,
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: numPadpaddingtop),
                      child: Row(
                        children: [
                          for (int i = 7; i <= 9; i++)
                            numPadButtonsComponents(
                                symbol: '$i',
                                ontap: () => updateInputTextfield('$i')),
                          numPadButtonsComponents(
                              symbol: 'DEL', ontap: deleteInputTextfield),
                          numPadButtonsComponents(
                              symbol: 'AC ', ontap: clearEntireInputTextfield)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: numPadpaddingtop),
                      child: Row(
                        children: [
                          for (int i = 4; i <= 6; i++)
                            numPadButtonsComponents(
                                symbol: '$i',
                                ontap: () => updateInputTextfield('$i')),
                          numPadButtonsComponents(
                              symbol: '*',
                              ontap: () {
                                updateInputTextfield('*');
                              }),
                          numPadButtonsComponents(
                              symbol: '/',
                              ontap: () {
                                updateInputTextfield('/');
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
                                symbol: '$i',
                                ontap: () => updateInputTextfield('$i')),
                          numPadButtonsComponents(
                              symbol: '+',
                              ontap: () {
                                updateInputTextfield('+');
                              }),
                          numPadButtonsComponents(
                              symbol: '-',
                              ontap: () {
                                updateInputTextfield('-');
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: numPadpaddingtop),
                      child: Row(
                        children: [
                          numPadButtonsComponents(
                              symbol: '0',
                              ontap: () => updateInputTextfield('0')),
                          numPadButtonsComponents(
                              symbol: '. ',
                              ontap: () => updateInputTextfield('.')),
                          numPadButtonsComponents(
                              symbol: 'EXP',
                              ontap: () {
                                setState(() {
                                  finalvalue *= 7;
                                });
                              }),
                          numPadButtonsComponents(symbol: 'ANS', ontap: () {}),
                          Expanded(
                              child: numPadButtonsComponents(
                                  symbol: '=',
                                  ontap: () {
                                    setState(() {
                                      calcs.appcalculations(
                                          _inputcontroller.text);
                                    });
                                  }))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
