import 'package:flutter/material.dart';
import './counter.dart';
import '../constant.dart';

class Details extends StatelessWidget {
  final List<Map> cases;

  final String title;
  final bool spaceAround;

  Details({this.title, this.cases, this.spaceAround});

  List<Widget> get counters {
    List<Widget> items = [];
    for (var item in cases) {
      items.add(Counter(
        color: item['color'],
        title: item['title'],
        number: item['number'],
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(title, style: kTitleTextstyle),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: kShadowColor,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: spaceAround
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.spaceBetween,
            children: counters,
          ),
        ),
      ],
    );
  }
}
