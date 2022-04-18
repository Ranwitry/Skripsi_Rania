import 'package:flutter/material.dart';
import 'package:skripsi_rania/user/edit_user.dart';
import 'package:skripsi_rania/model_data/user_model.dart';
import 'package:skripsi_rania/user/tambah_user.dart';

class ListUser extends StatefulWidget {
  //const ListUser({Key? key}) : super(key: key);
  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  List<dynamic> modelUser = UserModel().modelUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengaturan User",
        ),
        backgroundColor: Color(0xffA1616A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        ),
      ),
      body: ListView.builder(
        itemCount: modelUser.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Card(
              //key: ValueKey(_foundAdmin[index]["nama"]),
              color: Colors.grey.shade200,
              elevation: 5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              child: InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle_rounded,
                    size: 50,
                    color: Colors.black,
                  ),
                  title: Text(
                    modelUser[index]['nama'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "NunitoSans"),
                  ),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return EditUser(modelUser[index]);
                  }));
                },
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffA1616A),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TambahUser();
            }));
          },
          child: Icon(Icons.add_outlined)),
    ));
  }
}
