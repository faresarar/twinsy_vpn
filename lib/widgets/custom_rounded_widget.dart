import 'package:flutter/material.dart';

class CustomRoundedWidget extends StatelessWidget {
  const CustomRoundedWidget({
    super.key,
    required this.titleText,
    required this.subTitleText,
    required this.color,
    this.iconData,
    this.image,
  });

  final String titleText;
  final String subTitleText;
  final Color color;
  final IconData? iconData;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    return SizedBox(
      width: sizeScreen.width * 0.46,
      child: Column(
        spacing: 7,
        children: [
          CircleAvatar(
            radius: 33,
            child: iconData != null
                ? Icon(
                    iconData,
                    size: 30,
                    color: color,
                  )
                : image ??
                    Container(), // Show image if iconData is null, otherwise an empty container
          ),
          Text(
            titleText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subTitleText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
