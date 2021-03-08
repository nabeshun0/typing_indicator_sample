import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:typing_indicator_sample/widgets/fake_messages.dart';
import 'package:typing_indicator_sample/widgets/typing_indicator.dart';

const _backgroundColor = Color(0xFF333333);

class ExampleIsTypingPage extends StatefulWidget {
  @override
  _ExampleIsTypingPageState createState() => _ExampleIsTypingPageState();
}

class _ExampleIsTypingPageState extends State<ExampleIsTypingPage> {
  bool _isSomeoneTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: const Text('Typing Indicator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessages(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TypingIndicator(
              showIndicator: _isSomeoneTyping,
            ),
          ),
          _buildIsTypingSimulator(),
        ],
      ),
    );
  }

  Widget _buildMessages() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: 25,
      reverse: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 100),
          child: FakeMessages(
            isBig: index.isOdd,
          ),
        );
      },
    );
  }

  Widget _buildIsTypingSimulator() {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(16),
      child: Center(
        child: CupertinoSwitch(
          onChanged: (newvalue) {
            setState(() {
              _isSomeoneTyping = newvalue;
            });
          },
          value: _isSomeoneTyping,
        ),
      ),
    );
  }
}
