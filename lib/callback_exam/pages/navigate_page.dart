import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/callback_exam/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class NavigatePage extends StatefulWidget {
  @override
  _NavigatePageState createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<Counter>().count == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return OtherPage();
          }),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate'),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().count}',
          style: TextStyle(fontSize: 48),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other'),
      ),
      body: Center(
        child: Text(
          'Other',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}