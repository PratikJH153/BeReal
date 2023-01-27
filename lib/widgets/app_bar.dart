import 'package:flutter/material.dart';

AppBar myappBar(actions) {
  return AppBar(
    backgroundColor: Colors.black,
    title: const Text(
      "BeReal.",
      style: TextStyle(
        fontSize: 24,
      ),
    ),
    centerTitle: true,
    actions: actions == [] ? null : actions,
  );
}
