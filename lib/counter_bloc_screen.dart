import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, counter){
          return Center(
            child: Text(
              '$counter',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.add),
              onPressed: (){
                BlocProvider.of<CounterBloc>(context).add(IncrementCounter());
              }
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.remove),
              onPressed: (){
                BlocProvider.of<CounterBloc>(context).add(DecrementCounter());
              }
          ),
        ],
      ),

    );
  }
}
