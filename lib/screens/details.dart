import 'package:flutter/material.dart';

import '../model/pokehub.dart';

class Details extends StatelessWidget {
  final Pokemon pokemon;

  Details(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0,
      ),
      body: bodyWidget(context),
    );
  }

  //body
  bodyWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text("Height: ${pokemon.height}"),
                Text("Weight: ${pokemon.weight}"),
                Column(
                  children: <Widget>[
                    Text(
                      "Types",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pokemon.type
                          .map((t) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: FilterChip(
                                  pressElevation: 2,
                                  backgroundColor: Colors.amber,
                                  label: Text(t),
                                  onSelected: (b) {},
                                ),
                              ))
                          .toList(),
                    ),
                    Column(
                      children: <Widget>[
                        Text("Weakness",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pokemon.weaknesses
                              .map((t) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: FilterChip(
                                    pressElevation: 2.0,
                                    backgroundColor: Colors.red,
                                    label: Text(t,
                                        style: TextStyle(color: Colors.white)),
                                    onSelected: (b) {},
                                  )))
                              .toList(),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Next Evolution",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pokemon.nextEvolution == null
                              ? [Text("This is the final form")]
                              : pokemon.nextEvolution
                                  .map((n) => Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: FilterChip(
                                          pressElevation: 2,
                                          backgroundColor: Colors.green,
                                          label: Text(
                                            n.name,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onSelected: (b) {},
                                        ),
                                      ))
                                  .toList(),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(pokemon.img), fit: BoxFit.cover)),
            ),
          ),
        )
      ],
    );
  }
}
