import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/count_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final ss = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ss.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("Build");

    final ss = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Consumer<CountProvider>(builder: (context, value, child){
                  return Text(
                    value.count.toString(),
                    style: const TextStyle(fontSize: 50),
                  );
                })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           ss.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
