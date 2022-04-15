import 'package:flutter/material.dart';
import 'package:skripsi_rania/details_page.dart';
import 'package:skripsi_rania/model_data/elektronik_model.dart';

class ElektronikAset extends StatefulWidget {
  const ElektronikAset({Key? key}) : super(key: key);

  @override
  State<ElektronikAset> createState() => _ElektronikAsetState();
}

class _ElektronikAsetState extends State<ElektronikAset> {
  Widget appBarTitle = Text(
    "Asset Elektronik",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );

  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<dynamic> modelElektronik = ElektronikModel().modelElektronik;
  List<dynamic> _foundlist = [];

  late bool isSearching;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    isSearching = false;
    init();
  }

  void init() {
    _foundlist = modelElektronik;

    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          isSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          isSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }

  _buildSearchList() {
    List<dynamic> results = [];
    if (_searchText.isEmpty) {
      results = modelElektronik;
    } else {
      results = modelElektronik
          .where((element) => element['namak']
              .toLowerCase()
              .contains(_searchText.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundlist = results;
    });
  }

  _buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffA1616A),
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "Cari Aset..",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "Asset ELektronik",
      );
      isSearching = false;
      _searchQuery.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: _buildBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: GridView.builder(
              itemCount: _foundlist.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  key: ValueKey(_foundlist[index]),
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Color(0xffA1616A)),
                      color: Colors.white),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageDetail(_foundlist[index]);
                        }));
                      },
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Color(0xffA1616A),
                      child: ListView(children: [
                        Column(
                          children: <Widget>[
                            Container(
                              height: 120,
                              //width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        _foundlist[index]['gambark']),
                                    fit: BoxFit.cover),
                                //shape: BoxShape.rectangle
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 5),
                              child: Text(
                                _foundlist[index]['namak'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 210)),
        ));
  }
}
