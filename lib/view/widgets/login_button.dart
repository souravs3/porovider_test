import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  String title;
  VoidCallback onTapp;
  LoginButton({super.key, required this.title, required this.onTapp});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.amber),
          textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white))),
      onPressed: onTapp,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
