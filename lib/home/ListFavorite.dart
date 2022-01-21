import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_ui/providers/FunctionsModel.dart';

import '../models/HotDestinaltion.dart';
import 'package:travel_ui/home/ListFavorite.dart';

class listFavorits extends StatefulWidget {
  // late final List<HotDestinations> hotDestinations;
  // listFavorits({required this.hotDestinations});

  @override
  _listFavoritsState createState() => _listFavoritsState();
}

class _listFavoritsState extends State<listFavorits> {
  @override
  Widget build(BuildContext context) {
    List<HotDestinations> hotDestinations =
        Provider.of<FunctionsModel>(context).list;
    if (hotDestinations.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('List Favorite '),
        ),
        body: ListView.builder(
          itemCount: hotDestinations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.asset(
                  hotDestinations[index].image,
                  fit: BoxFit.cover,
                ),
                title: Text(hotDestinations[index].placeName),
                subtitle: Text(hotDestinations[index].description),
              ),
            );
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('list Favorits'),
        ),
        body: Center(
          child: Text('No Country added!'),
        ),
      );
    }
  }
}
