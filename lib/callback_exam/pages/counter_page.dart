import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/callback_exam/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int myCount = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Counter>().increment();
      myCount = context.read<Counter>().count + 10;
    });
    // Future.delayed(Duration(seconds: 0), () {
    //   context.read<Counter>().increment();
    //   myCount = context.read<Counter>().count + 10;
    // });
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.watch<Counter>().increment();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Text(
          'count: ${context.watch<Counter>().count}\nmyCount: $myCount',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 48),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}