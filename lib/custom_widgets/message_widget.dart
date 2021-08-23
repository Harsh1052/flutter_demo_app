import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String? personName;
  final String? message;

  MessageWidget({this.message, this.personName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        child: Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
      ),
      title: Text(
        personName!,
        style: TextStyle(
            color: Colors.green, fontSize: 18, fontWeight: FontWeight.w700),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [Text(message!), Divider()],
        ),
      ),
    );
  }
}
