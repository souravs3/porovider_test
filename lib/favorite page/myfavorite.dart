import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/favorite_provider.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteprovider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('List of favorites'),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myfavorite()));
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favoriteprovider.selectedFavoriteItem.length,
                  itemBuilder: (context, index) {
                    return Consumer<FavoriteProvider>(
                        builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ListTile(
                          onTap: () {
                            value.selectFavoriteFunction(index);
                          },
                          title: Text('Icon   ' + '${index + 1}'),
                          trailing: Icon(
                            value.selectedFavoriteItem.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        ),
                      );
                    });
                  })),
        ],
      ),
    );
  }
}
