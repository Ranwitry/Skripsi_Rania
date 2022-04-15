import 'package:flutter/material.dart';
import 'package:skripsi_rania/details_page.dart';
import 'model_data/reminder_model.dart';

class ReminderMenu extends StatefulWidget {
  const ReminderMenu({Key? key}) : super(key: key);

  @override
  State<ReminderMenu> createState() => _ReminderMenuState();
}

class _ReminderMenuState extends State<ReminderMenu> {
  List<dynamic> modelReminder = ReminderModel().modelReminder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reminder Asset"),
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
        body: ListView.builder(
          itemCount: modelReminder.length,
          itemBuilder: (context, index) => 
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 40, right: 25, left: 25, bottom: 10),
                child: Container(
                  height: 130,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200),
                  //padding: const EdgeInsets.all(8),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageDetail(modelReminder[index]);
                        }));
                      },
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Color(0xffA1616A),
                      child: Row(
                       
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 25),
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          modelReminder[index]['gambark']),
                                      fit: BoxFit.cover,
                                    ),
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  modelReminder[index]['namak'],
                                //textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                     
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito",
                                    ),
                                    maxLines: 2,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "Massa Aset",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    modelReminder[index]['masa'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18, right: 5),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel_rounded,
                                size: 40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
