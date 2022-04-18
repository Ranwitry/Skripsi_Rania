import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_rania/asset/data_pic.dart';
import 'package:skripsi_rania/asset/edit_aset.dart';
import 'package:skripsi_rania/menu/menu_aset.dart';
import 'package:skripsi_rania/menu/menu_reminder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
 
class PageDetail extends StatefulWidget {
  final String type;
  final Map items;
 
  PageDetail(this.items, this.type);
 
  //List<dynamic> _foundlist = [];
  //const PageDetail({ Key? key }) : super(key: key);
 
  @override
  State<PageDetail> createState() => _PageDetailState();
}
 
class _PageDetailState extends State<PageDetail> {
  int activeIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    Widget sliderCarousel = CarouselSlider(
      items: [
        // 1st Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(widget.items['gambark']),
              fit: BoxFit.cover,
            ),
          ),
        ),
 
        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(widget.items['gambarb']),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
 
      //Slider Container properties
      options: CarouselOptions(
        //height: 180.0,
        enlargeCenterPage: true,
        //autoPlay: true,
        aspectRatio: 1.5,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        // autoPlayCurve: Curves.fastOutSlowIn,
        // enableInfiniteScroll: true,
        // autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1,
        onPageChanged: (index, reason) => setState(() => activeIndex = index),
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Asset",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xffA1616A),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.delete_forever_sharp,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                _hapusAset(context, widget.type);
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            sliderCarousel,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //const SizedBox(height: 32),
                buildIndicator(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.items['namak'],
                    maxLines: 2,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 3, left: 3),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffA1616A),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: Container(
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DataUser(widget.items);
                              }));
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.person),
                                      iconSize: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "User PIC",
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            widget.items['pic'],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: Container(
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.assessment_rounded),
                                  iconSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Jenis Aset",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        widget.items['jenis'],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: Container(
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.calendar_today),
                                  iconSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tanggal Terima",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        widget.items['tanggal'],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: Container(
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.new_releases),
                                  iconSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Masa Aset",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        widget.items['masa'],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: Container(
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.price_change),
                                  iconSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Harga Perolehan",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        widget.items['harga'],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Container(
                        margin: EdgeInsets.only(top: 30.0, bottom: 30),
                        width: 350,
                        height: 45,
                        child: (widget.type == 'reminder')
                            ? Container()
                            : TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xffDF9A9A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditAset(widget.items),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Edit Aset",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget buildIndicator() => AnimatedSmoothIndicator(
        axisDirection: Axis.horizontal,
        activeIndex: activeIndex,
        count: 2,
        effect: JumpingDotEffect(dotWidth: 15, dotHeight: 15),
      );
}
 
void _hapusAset(context, type) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 24,
            content: const Text(
              "Apakah anda yakin menghapus aset ini? ",
              style: TextStyle(fontFamily: "NunitoSans"),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffDF9A9A),
                ),
                onPressed: () {
                  if (type == 'reminder') {
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ReminderMenu()));
                  } else if (type == 'asset') {
                    int count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 3;
                    });
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AsetMenu()));
                  }
                },
                child: const Text(
                  'Ya',
                  style: TextStyle(
                    fontFamily: "NunitoSans",
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xffE5E5E5)),
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text("Tidak",
                    style: TextStyle(
                        fontFamily: "NunitoSans", color: Colors.black)),
              ),
            ],
          ));
}