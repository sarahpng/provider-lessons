import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lessons/first_lecture/provider/count_provider.dart';
import 'package:provider_lessons/first_lecture/screens/count_Example.dart';
import 'package:provider_lessons/second_lecture/provider/container_one_provider.dart';
import 'package:provider_lessons/second_lecture/screen/slider_example.dart';

void main() {
  runApp(const MyApp());
}

// ----- Lecture one -----------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => ContainerOneProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SliderExample(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) {},
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         home: const SliderExample(),
//       ),
//     );
//   }
// }
