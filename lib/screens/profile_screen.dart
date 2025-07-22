import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'User Profile Dashboard',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
