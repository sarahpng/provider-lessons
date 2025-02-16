import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lessons/third_lecture/provider/favourite_provider.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({super.key});

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'MyFavourites',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<FavouriteProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                      itemCount: provider.selectedItem.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Item ${provider.selectedItem[index]}'),
                          trailing: Icon(Icons.favorite),
                          onTap: () {
                            // print('tap');
                            provider.remove(index);
                          },
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }
}
