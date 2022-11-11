import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_s_provider.dart';

class HomeSelectorScreen extends StatefulWidget {
  const HomeSelectorScreen({Key? key}) : super(key: key);

  @override
  State<HomeSelectorScreen> createState() => _HomeSelectorScreenState();
}

class _HomeSelectorScreenState extends State<HomeSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    print("Hello1");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Colors.lightBlue,
                child: Selector<CountSProvider, int>(
                  selector: (buildContext, countPro) => countPro.counts,
                  builder: (context, value, child) {
                    return Column(
                      children: <Widget>[
                        Text(
                          value.toString(),
                          style: const TextStyle(fontSize: 50),
                        ),
                        child!,
                      ],
                    );
                  },
                  child: const MyExpensiveWidget(),
                ),
              ),

              // Consumer<CountSProvider>(builder: (context, value, child){
              //   return Text(
              //     value.count.toString(),
              //     style: const TextStyle(fontSize: 50),
              //   );
              // })
            ),
          ],
        ),
      ),


      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         selectorProvider.incrementCount();
      //       },
      //       child: const Icon(Icons.add),
      //     ),
      //     const SizedBox(
      //       height: 20,
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         selectorProvider.decrementCount();
      //       },
      //       child: const Icon(Icons.remove),
      //     ),
      //
      //   ],
      // )
    );
  }
}

class MyExpensiveWidget extends StatelessWidget {
  const MyExpensiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("===============================");
    final selectorProvider =
        Provider.of<CountSProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            selectorProvider.incrementCount();
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: () {
            selectorProvider.decrementCount();
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
