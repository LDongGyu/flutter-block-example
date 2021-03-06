import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> fKey = GlobalKey<FormState>();
  String city;

  void submit(){
    final form = fKey.currentState;

    form.save();

    if(!form.validate()){
      return;
    }

    Navigator.pop(context, city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Form(
        key: fKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter city name in English',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  return value.isEmpty ? 'city is required' : null;
                },
                onSaved: (value) => city = value,
              ),
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: submit,
              child: Text('How\'s Weather', style: TextStyle(fontSize: 18),),
            )
          ],
        ),
      ),
    );
  }
}
