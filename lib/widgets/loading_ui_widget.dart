import 'package:flutter/material.dart';

class LoadingUiWidget extends StatelessWidget {
  const LoadingUiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
          ),
          SizedBox(height: 8),
          Text(
            "Gathering free Vpn Location ..",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
