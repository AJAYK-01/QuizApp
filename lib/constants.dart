import 'package:flutter/material.dart';

final cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          color: Colors.purple[100].withOpacity(0.8),
          blurRadius: 24,
          offset: Offset(0, 4))
    ]);
