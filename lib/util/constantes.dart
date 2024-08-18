import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final client = Supabase.instance.client;

const smallGap = SizedBox(
  height: 15,
);

const largeGap = SizedBox(
  height: 30,
);

extension ShowSnackBar on BuildContext{
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Colors.lightBlue,
      )
    );
  }
}
