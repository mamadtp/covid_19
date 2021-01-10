import 'package:flutter/material.dart';
import '../widgets/prevent_cart.dart';
import '../constant.dart';

class Prevent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("پیشگیری", style: kTitleTextstyle),
          SizedBox(height: 20),
          PreventCard(
            title: "ماسک بزنید",
            text:
                "با ماسک زدن  میتوان مقدارزیادی از شیوع بیماری را جلوگیری کرد",
            image: "assets/images/wear_mask.png",
          ),
          PreventCard(
            title: "دستان خودرابشورید",
            text: "شستن دست ها تاثیر بسیاری بر از بین بردن ویروس دارد",
            image: "assets/images/wash_hands.png",
          ),
          PreventCard(
            title: "صرفه کردن از علایم بیماری",
            text: "سعی کنید هنگام صرفه کردن با دست جلوی دهان خود را بگیرید",
            image: "assets/images/caugh.png",
          ),
          PreventCard(
            title: "ابریزش بینی",
            text: "از دیگر علایم بیماری ابریزش بینی است در صورت مشاهده به پزشک مراحعه کنید",
            image: "assets/images/fever.png",
          ),
        ],
      ),
    );
  }
}
