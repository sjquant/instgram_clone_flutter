import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void simpleSnackbar(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(content: Text(message));
  Scaffold.of(context).showSnackBar(snackBar);
}
