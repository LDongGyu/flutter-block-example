import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/callback_exam/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HandleDialogPage extends StatefulWidget {
  @override
  _HandleDialogPageState createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Be careful, No decrement button'),
          );
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<Counter>().count == 3) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Hooray, count is 3'),
            );
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Handle Dialog'),
      ),
      body: Center(
        child: Text(
          'count: ${context.watch<Counter>().count}',
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