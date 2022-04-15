import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerBar extends StatefulWidget {
  const DrawerBar({ Key? key }) : super(key: key);

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text('Rania Dwitry', style: TextStyle(color: Colors.white),), 
          accountEmail: Text('jiminie@gmail.com', style: TextStyle(color: Colors.white, )),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(child: Image.network('https://i.pinimg.com/736x/27/ac/36/27ac365ca3f21f6230dd2f6a2ed1e566.jpg', 
            width: 90,
            height: 90,
            fit: BoxFit.cover,),
            ),
        
          ),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/80/3b/04/803b045ff2f511ea3cde28210a2d9720.jpg'),
            fit: BoxFit.cover
            )
          )
          ),
        ListTile(
          title: Row(
            children: [
              Text("Info Admin")
            ],


          ),
        ),

        ListTile(
          tileColor: Color(0xffEAECEE),
          leading: Icon(Icons.phone),
          title: Text('0813983853875853'),
        ),
                  Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffDF9A9A),
              ),
            ),
          ),
   Padding(
     padding: const EdgeInsets.only(top: 8),
     child: ListTile(
            tileColor: Color(0xffEAECEE),
            leading: Icon(Icons.work),
            title: Text('Intern PNJ'),
          ),
   ),

          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffDF9A9A),
              ),
            ),
          ),
   
     ListTile(
         
          leading: Icon(Icons.exit_to_app),
          title: Text('Keluar'),
          onTap: () {
            _alertKeluar(context);
          },
        ),

         
        ],
      ),
      
    );
  }
}

void _alertKeluar(context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => 
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 24,
            content: const Text(
              "Apakah anda yakin ingin keluar dari aplikasi ini? ",
              style: TextStyle(fontFamily: "NunitoSans"),
            ),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Color(0xffDF9A9A)),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('Ya',
                      style: TextStyle(
                          fontFamily: "NunitoSans", color: Colors.white))),
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

