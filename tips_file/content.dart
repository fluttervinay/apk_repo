import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Text(
          'Content for Step 3',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}