import 'package:flutter/material.dart';

SnackBar customSnackBar(BuildContext context, {required String snackMessage}) {
  return SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: Colors.red,
      content: Text(
        snackMessage,
        style: const TextStyle(color: Colors.white),
      ));
}
