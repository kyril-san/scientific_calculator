import 'package:flutter/material.dart';
import 'package:scientific_calculator/presentation/Home/const/constant_variable.dart';

numPadButtonsComponents(
    {required String symbol, required Function()? ontap, required bool horiz}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
        height: horiz ? 35 : 90,
        margin: const EdgeInsets.only(left: 20, bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 0.5,
                spreadRadius: .5),
          ],
          color: Colors.grey[600],
          shape: horiz ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: horiz ? BorderRadius.circular(100) : null,
        ),
        padding: horiz
            ? EdgeInsets.symmetric(
                horizontal: symbol == plusminus
                    ? 26
                    : symbol == brackets
                        ? 28
                        : symbol == percentage
                            ? 30
                            : symbol == dot
                                ? 34
                                : 32)
            : EdgeInsets.symmetric(
                horizontal: symbol == plusminus
                    ? 24
                    : symbol == brackets || symbol == percentage
                        ? 28
                        : symbol == dot
                            ? 36
                            : 32),
        // padding: EdgeInsets.symmetric(

        // horizontal: symbol == delete || symbol == exp || symbol == ans
        //     ? 11
        //     : symbol == ac
        //         ? 13
        //         : symbol == dot
        //             ? 26
        //             : 24,
        // ),
        // width: ,
        child: Text(
          symbol,
          // softWrap: true,
          style: TextStyle(
              color: Colors.white,
              fontSize: horiz ? 18 : 24,
              fontWeight: FontWeight.bold),
        )),
  );
}

actionPadButtonsComponents({required String char, required Function()? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
        height: 35,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, bottom: 5),
        padding: EdgeInsets.symmetric(
            horizontal: char == rad || char == xy || char == onedividex
                ? 22
                : char == sin || char == cos || char == tan || char == log
                    ? 24
                    : char == changesides
                        ? 26
                        : char == x2
                            ? 28
                            : 30),
        decoration: BoxDecoration(
            color: Colors.grey[600], borderRadius: BorderRadius.circular(100)),
        child: Text(
          char,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
  );
}
