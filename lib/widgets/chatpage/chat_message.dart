import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.sender});
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            child: Text(sender[0]),
            backgroundColor: Colors.green[900],
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sender,
                style: TextStyle(
                    fontFamily: AutofillHints.addressCityAndState,
                    fontSize: 18,
                    color: Colors.green[800])),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                text,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ))
      ],
    );
  }
}
