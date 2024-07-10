import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/controller/favorite_provider.dart';
import 'package:test_provider/favorite%20page/myfavorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Re build');

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myfavorite()));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
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
