import 'package:flutter/material.dart';
import 'package:flutter_bank_app/constants/app_textstyle.dart';
import 'package:flutter_bank_app/constants/color_constants.dart';
import 'package:flutter_bank_app/data/card_data.dart';
import 'package:flutter_bank_app/widgets/my_card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cards",
          style: TextStyle(
            fontFamily: "Poppins",
            color: kPrimaryColor,
          ),
        ),
        leading: Padding( 
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(""),
          ),
        ),
        actions: [ 
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
              size: 27,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          Container(
            padding: EdgeInsets.all(20),
            child: ListView.separated( 
              shrinkWrap: true,
              itemCount: myCards.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return MyCard(
                  card: myCards[index],
                );
              },
            ),
          ),
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.add, size: 50),
          ),
          SizedBox(height: 10,),
          Text(
            "Add Card",
            style: AppTextStyle.LISTTILE_TITLE,
          )
        ],
      )
    );
}
}