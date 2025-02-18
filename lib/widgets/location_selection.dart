import 'package:flutter/material.dart';

class LocationSelection extends StatelessWidget {
  const LocationSelection({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    return InkWell(
      onTap:(){},
      child: Container(
        color: Colors.redAccent,
        padding: EdgeInsets.symmetric(horizontal: sizeScreen.width * 0.041),
        height: 62,
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.flag,
              color: Colors.white,
              size: 36,
            ),
            Text(
              "Select Country / Location",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_right,
                color: Colors.redAccent,
                size: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
