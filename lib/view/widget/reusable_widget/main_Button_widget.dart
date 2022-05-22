import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  final Function() onPressed;
  final Widget text;
  final double width;
  final Color mainColor;
  final Color borderColor;

  const MainButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.width,
      required this.mainColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Get.height * .06,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: mainColor,
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xffcc6213),
          //     Color(0xffba0b08),
          //     Color(0xff931c04),
          //     Color(0xff3f0303),
          //   ],
          // ),
          border: Border.all(color: borderColor,width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
