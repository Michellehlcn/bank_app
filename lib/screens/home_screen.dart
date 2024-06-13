import 'package:flutter/material.dart';
import 'package:flutter_bank_app/constants/app_textstyle.dart';
import 'package:flutter_bank_app/constants/color_constants.dart';
import 'package:flutter_bank_app/data/card_data.dart';
import 'package:flutter_bank_app/data/transaction_data.dart';
import 'package:flutter_bank_app/widgets/my_card.dart';
import 'package:flutter_bank_app/widgets/transaction_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Bank",
            style: TextStyle(fontFamily: "Poppins", color: kPrimaryColor),
          ),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                // backgroundImage:  NetworkImage("/assets/icons/mcard.png"),
                ),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.notifications_active_outlined,
                    color: Colors.black, size: 27),
                onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    height: 200,
                    child: ListView.separated(
                      physics: ClampingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10);
                      },
                      itemCount: myCards.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MyCard(
                          card: myCards[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Recent transactions",
                    style: AppTextStyle.BODY_TEXT,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                    itemCount: myTransactions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return TransactionCard(
                        transaction: myTransactions[index],
                      );
                    },
                  )
                ]))));
  }
}
