import 'package:flutter/material.dart';
import 'package:pokedex/cubit/schemas.dart';
import 'package:pokedex/store/links.dart';

class Varieties extends StatefulWidget {
  Varieties({Key? key, required this.varietyList}) : super(key: key);

  final List<Variety> varietyList;

  @override
  _VarietiesState createState() => _VarietiesState();
}

class _VarietiesState extends State<Varieties> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: [
        ExpansionPanel(
          headerBuilder: (context, isOpen) {
            return Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Varieties",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          },
          isExpanded: _isOpen,
          body: Container(
            height: (widget.varietyList.length * 120),
            constraints: BoxConstraints(
              maxHeight: 500,
            ),
            margin: EdgeInsets.only(
              bottom: 20,
            ),
            child: ListView.builder(
              itemCount: widget.varietyList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    tileColor: Colors.black45,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Text(
                            widget.varietyList[index].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,

                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Image.network(
                              '$pokemonImageLink/other/home/${widget.varietyList[index].code}.png',
                              width: 100,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.network(
                                  '$pokemonImageLink/other/official-artwork/${widget.varietyList[index].code}.png',
                                  width: 100,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Container();
                                  },
                                );
                              },
                            ),
                            Image.network(
                              '$pokemonImageLink/other/home/shiny/${widget.varietyList[index].code}.png',
                              width: 100,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
      expansionCallback: (i, isOpen) => setState(() => _isOpen = !isOpen),
    );
  }
}
