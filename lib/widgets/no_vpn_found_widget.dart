import 'package:flutter/material.dart';

class NoVpnFoundWidget extends StatelessWidget {
  const NoVpnFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "No VPNs found, try again",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }
}
