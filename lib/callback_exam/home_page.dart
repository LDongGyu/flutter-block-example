import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/callback_exam/pages/counter_page.dart';
import 'package:flutter_bloc_example/callback_exam/pages/handle_dialog_page.dart';
import 'package:flutter_bloc_example/callback_exam/pages/navigate_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CounterPage();
                    }),
                  );
                },
                child: Text(
                  'Counter',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HandleDialogPage();
                    }),
                  );
                },
                child: Text(
                  'Dialog',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return NavigatePage();
                    }),
                  );
                },
                child: Text(
                  'Navigate',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}