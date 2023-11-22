import 'package:flutter/material.dart';

numPadButtonsComponents({required String symbol, required Function()? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
        height: 40,
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 0.5,
              spreadRadius: .5),
        ], color: Colors.grey[600], borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(
            horizontal: symbol == 'DEL' ||
                    symbol == 'AC ' ||
                    symbol == 'EXP' ||
                    symbol == 'ANS'
                ? 11
                : 24),
        // width: ,
        child: Text(
          symbol,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
  );
}
