import 'dart:developer';

import 'package:cubit_counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  String title;

  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterInitial>(
            builder: (context, state) {
              return Text(state.counterValue.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildBtn(text:"sub", myFunction: ()=>BlocProvider.of<CounterCubit>(context).decrement()),
              BuildBtn(text:"Add", myFunction: ()=>BlocProvider.of<CounterCubit>(context).increment()),
              ],
          )
        ],
      ),
    );
  }
}


class BuildBtn extends StatelessWidget {
  String text;
  Function myFunction;

  BuildBtn({Key? key, required this.text, required this.myFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => myFunction(),
        child: Text(text),
      ),
    );
  }
}
