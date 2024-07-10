import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValueLitsenTest extends StatelessWidget {
  ValueLitsenTest({super.key});

  ValueNotifier _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _selected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Value Litsner'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _selected,
                builder: (context, value, child) {
                  return TextField(
                    obscureText: _selected.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: InkWell(
                            onTap: () {
                              _selected.value = !_selected.value;
                            },
                            child: Icon(_selected.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility)),
                        border: OutlineInputBorder()),
                  );
                }),
            Center(
                child: ValueListenableBuilder(
                    valueListenable: _counter,
                    builder: (context, value, child) {
                      return Text(
                        _counter.value.toString(),
                        style: TextStyle(fontSize: 50),
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade900,
        shape: CircleBorder(),
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
