import 'package:flutter/material.dart';

void main() => runApp(MyFriendlyChatApp());
const String _name = "Your Name";

class MyFriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Friendly Chat',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: new Text('Friendly Chat')),
      body: _buildTextComposer(),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'send a message'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                ),
              ],
            )));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(_name[0])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
                style: Theme.of(context).textTheme.subhead,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}
