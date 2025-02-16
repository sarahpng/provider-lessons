import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lessons/third_lecture/provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/myFavourites');
            },
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Favourites',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, provider, child) {
                    return ListTile(
                      onTap: () {
                        if (provider.selectedItem.contains(index)) {
                          provider.removeItem(index);
                        } else {
                          provider.addItem(index);
                        }
                      },
                      title: Text('Item $index'),
                      trailing: Icon(provider.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
