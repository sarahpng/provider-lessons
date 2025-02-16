import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lessons/first_lecture/provider/count_provider.dart';
import 'package:provider_lessons/first_lecture/screens/count_Example.dart';
import 'package:provider_lessons/second_lecture/provider/container_one_provider.dart';
import 'package:provider_lessons/second_lecture/screen/slider_example.dart';
import 'package:provider_lessons/third_lecture/provider/favourite_provider.dart';
import 'package:provider_lessons/third_lecture/screens/favourite_screen.dart';
import 'package:provider_lessons/third_lecture/screens/my_favourites.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => ContainerOneProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/myFavourites': (context) => MyFavourites(),
        },
        home: const FavouriteScreen(),
      ),
    );
  }
}
