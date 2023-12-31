// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:scientific_calculator/presentation/Home/const/calculate_operators.dart';

class Calculations {
  CalculatorOperators calc;

  Calculations({required this.calc});

  Future<double> appcalculations(String text) async {
    double result = 0;

    switch (calc) {
      case CalculatorOperators.ADD:
        Parser p = Parser();

        text = text.replaceAll('x', '*');
        text = text.replaceAll('%', '%10');

        Expression exp = p.parse(text);

        ContextModel cm = ContextModel();
        result = exp.evaluate(EvaluationType.REAL, cm);

        break;

      case CalculatorOperators.ANS:
        // result = text;

        break;
      default:
    }
    return result;
  }
}




        // var sum = 0;
        // double result = 0.0;

        // final splittext = text.split(RegExp(r'\s*([-+*/])\s*'));
        // result = double.parse(splittext[0]);
        // print(splittext);
        // for (int i = 1; i <= splittext.length; i++) {
        // String _operator = splittext[0];
        // double _operand = double.parse(splittext[i + 1]);
        // var newval = int.tryParse(splittext[i]);
        // print(newval);
        // switch (_operator) {
        //   case '+':
        //     result += _operand;
        //     break;
        //   case '-':
        //     result -= _operand;
        //     break;
        //   default:
        // }
        // if (_operator == '+') {
        //   result += _operand;
        // } else if (_operator == '-') {
        //   result -= _operand;
        // }
        // print(result);
        // }
        // print(result);
        // return result;
        // for (int i = 0; i < text.length; i++) {
        //   if (text[i].contains('+')) {
        //     var num = int.tryParse(text[i - 1])! + int.tryParse(text[i + 1])!;
        //     sum += num;
        //   }
        //   if (text[i].contains('-')) {
        //     var num = -int.tryParse(text[i + 1])!;
        //     sum += num;
        //   }
        // }