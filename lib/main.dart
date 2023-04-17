import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_provider/provider/counter_provider.dart';
import 'package:single_provider/screen/counter_example.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CounterProvider(),
      child: MaterialApp(theme: ThemeData(primaryColor: Colors.blue), home: const CounterExample()),);
  }
}
