import 'package:travel_ui/models/pays.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  List<Pays> _pays = [
    Pays('Brazil', 'assets/images/brazil-flag.jpg'),
    Pays('Japan', 'assets/images/japan-flag.jpg'),
    Pays('Algérie', 'assets/images/algerie-flag.jpg'),
    Pays('Oman', 'assets/images/oman-flag.jpg'),
    Pays('Americ', 'assets/images/americ-flag.jpg'),
    Pays('Maroc', 'assets/images/maroc-flag.jpg'),
    Pays('France', 'assets/images/france-flag.jpg'),
    Pays('Indonesia', 'assets/images/indonessia-flag.jpg'),
    Pays('Libye', 'assetsimages//libye-flag.jpg'),
    Pays('Qatar', 'assets/images/qatar-flag.jpg'),
    Pays('Mauritanie', 'assets/images/mauritanie-flag.jpg'),
    Pays('Italy', 'assets/images/italy-flag.jpg'),
    Pays('Espagne', 'assets/images/espagne-flag.jpg'),
    Pays('Potugal', 'assets/images/portugal-flag.jpg'),
    Pays('Canada', 'assets/images/canada-flag.jpg'),
  ];

  List<Pays> _foundedPays = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _foundedPays = _pays;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedPays = _pays
          .where((pays) =>
              pays.name.toLowerCase().contains(search) &&
              pays.name.toUpperCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Container(
          height: 60,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                hintText: "Search countries"),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _foundedPays.length > 0
            ? ListView.builder(
                itemCount: _foundedPays.length,
                itemBuilder: (context, index) {
                  return paysComponent(pays: _foundedPays[index]);
                  // secondaryActions: <Widget>[
                  //   new IconSlideAction(
                  //     caption: 'More',
                  //     color: Colors.white,
                  //     icon: Icons.more_horiz,
                  //     onTap: () => print('More'),
                  //   ),
                  //],
                })
            : Center(
                child: Text(
                "No countries found",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
      ),
    );
  }

  paysComponent({required Pays pays}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(pays.image),
                )),
            SizedBox(width: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(pays.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 10,
              ),
            ])
          ]),
        ],
      ),
    );
  }
}
