import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.width * .4,

                      ),
                    ],
                  )),
            ),
          ),      Positioned(
              right: 0,
              top: 0,
              child: Image.asset(
                "assets/2.png",
                width: Get.width * .35,
              )),
          Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                "assets/1.png",
                width: Get.width * .35,
              )),

        ],
      ),
    );
  }
}
