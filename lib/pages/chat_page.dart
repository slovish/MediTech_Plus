import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:http/http.dart' as http;

class Mychat_page extends StatefulWidget {
  const Mychat_page({super.key});

  @override
  State<Mychat_page> createState() => _Mychat_pageState();
}

class _Mychat_pageState extends State<Mychat_page> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  Future<String> generateResponse(String prompt) async {
    const apikey = "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";
    var url = Uri.https("api.openai.com", "/v1/chat/completions");

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apikey'
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {"role": "user", "content": prompt}
          ],
          'temperature': 0,
          // 'max_token': 2000,
          'top_p': 1,
          // 'freqeuncy_penalty': 0.0,
          // 'presence_penalty': 0.0
        }));

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    print(newResponse);

    return newResponse['choices'][0]['message']['content'];
  }

  @override
  void initState() {
    // TODO: implement initState
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text("Hare Krishna"),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: SafeArea(
        child: Column(children: [
          Flexible(child: Messeges(messeges: _messages)),
          BuildTextComposer(),
        ]),
      ),
    );
  }

  Widget BuildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            autocorrect: true,
            decoration: InputDecoration.collapsed(hintText: "Send a Message"),
          ),
        ),
        IconButton(
          onPressed: () => _sendMessage_gpt(_controller.value.text.trim()),
          icon: Icon(Icons.send),
          splashRadius: 20,
        )
      ],
    );
  }

  Messeges({required List<Map<String, dynamic>> messeges}) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: _messages[index]["isUserMessage"]
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        _messages[index]["isUserMessage"] ? "You" : "Bot",
                        style: TextStyle(
                            color: Colors.deepPurple[200],
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        _messages[index]["message"].text.text[0],
                        style: TextStyle(
                            color: Colors.deepPurple[900],
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (_, i) =>
              Padding(padding: EdgeInsets.only(top: 10)),
          itemCount: _messages.length),
    );
  }

  void _sendMessage(String text) async {
    if (text.isEmpty) {
      print("empty message");
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
    _controller.clear();
  }

  addMessage(Message message, [bool isUsermessage = false]) {
    _messages.add({'message': message, 'isUserMessage': isUsermessage});
  }

  _sendMessage_gpt(String text) {
    if (text.isEmpty) {
      print("empty message");
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      generateResponse(text).then((response) {
        if (response == null) return;
        setState(() {
          addMessage(Message(text: DialogText(text: [response])));
        });
      });
    }
    _controller.clear();
  }
}
