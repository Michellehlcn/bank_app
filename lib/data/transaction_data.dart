import 'package:flutter/material.dart';

class TransactionModel {
  String name;
  String avatar;
  String currentBalance;
  String month;
  String changePercentageIndicator;
  String changePercentage;
  Color color;

  TransactionModel({
    required this.avatar,
    required this.currentBalance,
    required this.month,
    required this.changePercentageIndicator,
    required this.changePercentage,
    required this.name,
    required this.color,
  });
}

List<TransactionModel> myTransactions = [
  TransactionModel(
      avatar: "",
      currentBalance: "\$5482",
      changePercentage: "0.41%",
      changePercentageIndicator: "up",
      month: "Jan",
      name: "John Smith",
      color: Colors.green[100]!,
  ),
    TransactionModel(
      avatar: "",
      currentBalance: "\$4252",
      changePercentage: "4.54%",
      changePercentageIndicator: "down",
      month: "Mar",
      name: "Jane Smith",
      color: Colors.orange[100]!,
  ),
  TransactionModel(
      avatar: "",
      currentBalance: "\$4052",
      changePercentage: "1.27%",
      changePercentageIndicator: "down",
      month: "Mar",
      name: "Sam Smith",
      color: Colors.deepPurple[100]!,
  ),
    TransactionModel(
      avatar: "",
      currentBalance: "\$5052",
      changePercentage: "3.09%",
      changePercentageIndicator: "up",
      month: "Mar",
      name: "Alex Smith",
      color: Colors.deepPurple[100]!,
  ),
    TransactionModel(
      avatar: "",
      currentBalance: "\$5485",
      changePercentage: "0.41%",
      changePercentageIndicator: "up",
      month: "Jan",
      name: "John Smith",
      color: Colors.green[100]!,
  ),
    TransactionModel(
      avatar: "",
      currentBalance: "\$4252",
      changePercentage: "4.54%",
      changePercentageIndicator: "down",
      month: "Mar",
      name: "Jane Smith",
      color: Colors.orange[100]!,
  ),
];
