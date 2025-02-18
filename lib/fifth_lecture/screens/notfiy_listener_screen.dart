import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotfiyListenerScreen extends StatelessWidget {
  NotfiyListenerScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  // cons
  // cannot dispose Value Notifier

  @override
  Widget build(BuildContext context) {
    // print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                );
              }),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text('${_counter.value}');
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          // print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
