import 'package:flutter/material.dart';

class Transaction {
  final String date;
  final String title;
  final double amount;
  final IconData icon;

  const Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
  });
}
