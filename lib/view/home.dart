import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/controller/provider.dart';
import 'package:test_provider/controller/slider_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double value = 1.0; // Move value here

  @override
  Widget build(BuildContext context) {
    final _sliderProvider = Provider.of<SliderProvider>(context);
    final _counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade300,
        onPressed: () {
          _counterProvider.counter();
          // Add your onPressed code here
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, value, child) {
            return Text(
              _counterProvider.a.toString(),
              style: const TextStyle(fontSize: 50),
            );
          }),
          Consumer<SliderProvider>(builder: (context, val, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Slider(
                activeColor: Colors.amber,
                min: 0,
                max: 1,
                value: _sliderProvider.value,
                onChanged: (val) {
                  _sliderProvider.sliderChange(val);
                },
              ),
            );
          }),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(_sliderProvider.value),
                  ),
                  child: const Center(child: Text('First')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(_sliderProvider.value),
                  ),
                  child: const Center(
                      child: Text('Second')), // Change text to 'Second'
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
