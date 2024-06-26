import 'package:flutter/material.dart';
import 'package:flutter_bank_app/constants/app_textstyle.dart';
import 'package:flutter_bank_app/data/transaction_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({ Key? key, required this.transaction}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: transaction?.color,
                ),
                child: Image.asset(transaction.avatar),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.name,
                    style: AppTextStyle.LISTTILE_TITLE,
                  ),
                  Text(
                    transaction.month,
                    style: AppTextStyle.LISTTILE_SUB_TITLE,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                      transaction.currentBalance,
                      style: AppTextStyle.LISTTILE_TITLE,
                    ),
                    Row(
                      children: [
                        transaction.changePercentageIndicator == "up"
                        ? Icon(
                          FontAwesomeIcons.turnUp,
                          size: 10,
                          color: Colors.green,
                        )
                        : Icon(
                          FontAwesomeIcons.turnDown,
                          size: 10,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5,),
                        Text( 
                          transaction.changePercentage,
                          style: AppTextStyle.LISTTILE_SUB_TITLE,
                        )
                      ],
                    )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}