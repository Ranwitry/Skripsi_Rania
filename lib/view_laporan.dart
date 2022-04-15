import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class Laporan extends StatefulWidget {
  const Laporan({ Key? key }) : super(key: key);

  @override
  State<Laporan> createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
 bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    // Load the pdf file from the internet
    _pdf = await PDFDocument.fromURL(
        'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
            title: Text("Laporan Aset", style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xffA1616A),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                FocusScope.of(context).requestFocus(new FocusNode());
              },
            ),
          ),
      body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: _pdf)),
    );
  }
}