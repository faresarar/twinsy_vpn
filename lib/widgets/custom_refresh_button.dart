import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRefreshButton extends StatelessWidget {
  const CustomRefreshButton({super.key, required this.function});
  final void Function()? function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.redAccent),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
          ),
        ),
      ),
      child: Icon(
        CupertinoIcons.refresh_circled,
        color: Colors.white70,
      ),
    );
  }
}
