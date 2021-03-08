import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ExampleIsTypingPage(),
    debugShowCheckedModeBanner: false,
  ));
}

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
          _buildIsTypingSimulator()
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

@immutable
class FakeMessages extends StatelessWidget {
  FakeMessages({
    Key? key,
    required this.isBig,
  }) : super(key: key);

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      height: isBig ? 128 : 36,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.grey.shade300),
    );
  }
}
