import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: PlatformChannel()));

class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  String _comingMessage = 'unknown';
  static const MethodChannel platform = MethodChannel('flutter.receiveMessage');
  static const channel =
      BasicMessageChannel<String>('flutter.sendMessage', StringCodec());

  @override
  Widget build(BuildContext context) {
    var receiveButton = new RaisedButton(
        child: new Text("Receive message from native"), onPressed: _callNativeFunction);

    var sendButton = new RaisedButton(
        child: new Text("Send message to native"),
        onPressed: _sendMessageToNative);
    var text =
        new Text(_comingMessage, key: const Key('Comming message from native'));

    var column = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[receiveButton, sendButton, text]);

    var body = new Center(child: column);
    var bar = new AppBar(title: new Text("title"));

    return new Scaffold(appBar: bar, body: body);
  }

  Future<Null> _sendMessageToNative() async {
    channel.send("Message is coming from Flutter");
  }

  Future<Null> _callNativeFunction() async {
    String comingMessage;
    try {
      final String result = await platform.invokeMethod("callNativeFunction");
      comingMessage = result;
    } on PlatformException {
      comingMessage = "Error while receive message from Natvie";
    }
    setState(() {
      _comingMessage = comingMessage;
    });
  }
}
