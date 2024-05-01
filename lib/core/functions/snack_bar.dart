  import 'package:flutter/material.dart';



void showSnakBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(content),
      ),
    );
  }