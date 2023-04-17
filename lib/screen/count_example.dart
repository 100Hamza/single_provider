import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_provider/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      return countProvider.setTime();
    });
  }
  @override
  Widget build(BuildContext context) {
    print('This is the build Function');
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.23), child: Column(
        children: [
          Container(color: Colors.blue,height: 100,),
          Container(color: Colors.red, height: 100,)
        ],
      )),
      body: Container(

        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(builder: (context, value, child) {
              return Text(value.time, style: const TextStyle(fontSize: 50));
            },),
            Consumer<CountProvider>(builder: (context, value, child) {
              print('Consumer Widget ');
              return Text(value.count.toString() , style: const TextStyle(fontSize: 50 ,),);
            },)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        countProvider.setCount();
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}
