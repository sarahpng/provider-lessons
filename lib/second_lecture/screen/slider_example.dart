import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lessons/second_lecture/provider/container_one_provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Sliderbar Example',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ContainerOneProvider>(builder: (context, provider, child) {
              return Slider(
                min: 0,
                max: 1,
                value: provider.value,
                onChanged: (data) {
                  provider.set(data);
                },
              );
            }),
            Consumer<ContainerOneProvider>(builder: (context, provider, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(
                          alpha: provider.value,
                        ),
                      ),
                      child: Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(
                          alpha: provider.value,
                        ),
                      ),
                      child: Center(
                        child: Text('Container 2'),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ));
  }
}
