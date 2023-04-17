import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_provider/provider/counter_provider.dart';


class CounterExample extends StatefulWidget {
  const CounterExample({Key? key}) : super(key: key);

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      return counterProvider.setTime();;
    });
  }
  @override
  Widget build(BuildContext context) {
    print('This is Build Widget');
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Provider')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(20)
            ),
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child:  Consumer<CounterProvider>(builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value.getTime, style: TextStyle(fontSize: 50),),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,
                  ),
                  Text(value.getCount.toString() ,style: TextStyle(fontSize: (MediaQuery.of(context).size.height * MediaQuery.of(context).size.width)*0.0002),),
                ],
              );
            },),
    ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      counterProvider.setCount();
      print('Count Value: ${counterProvider.getCount}');
    }, child: Icon(Icons.add),
    )
    ,
    )
    ,
    );
  }
}
