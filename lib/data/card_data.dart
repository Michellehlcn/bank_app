import 'package:flutter/material.dart';
import 'package:flutter_bank_app/constants/color_constants.dart';

class CardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expDate,
    required this.cvv,
    required this.cardColor,
  });
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "Michelle Nguyen",
    cardNumber: "**** **** **** 1234",
    cvv: "**8",
    expDate: "12/24",
    cardColor: kPrimaryColor,
  ),
  CardModel(
    cardHolderName: "Michelle Nguyen",
    cardNumber: "**** **** **** 4321",
    cvv: "**7",
    expDate: "11/24",
    cardColor: kSecondaryColor,
  )
];