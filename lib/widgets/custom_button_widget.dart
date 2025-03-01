import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'timer_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.color,
    required this.color2,
    required this.color3,
    required this.statusText,
    required this.function,
    required this.statusConnectionText,
    required this.initTimerNow,
  });
  final Color color;
  final Color color2;
  final Color color3;
  final String statusText;
  final void Function()? function;
  final String statusConnectionText;
  final bool initTimerNow;

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Semantics(
          button: true,
          child: InkWell(
            onTap: function,
            borderRadius: BorderRadius.circular(100),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color2,
                    ),
                    child: Container(
                      width: sizeScreen.height * 0.14,
                      height: sizeScreen.height * 0.14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color3,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 6,
                        children: [
                          Icon(
                            Icons.power_settings_new,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            statusText,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.only(
            top: sizeScreen.height * 0.15,
            bottom: sizeScreen.height * 0.02,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 16,
          ),
          child: Text(
            statusConnectionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        TimerWidget(
          initTimerNow: initTimerNow,
        ),
      ],
    );
  }
}
