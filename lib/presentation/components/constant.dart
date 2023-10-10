import 'package:flutter/material.dart';

SnackBar noInternet = SnackBar(
  width: 160,
  content: Text(
    'Koneksi internet bermasalah',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 10),
  ),
  behavior: SnackBarBehavior.floating,
);
