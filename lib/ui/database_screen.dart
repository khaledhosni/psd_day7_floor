import 'dart:math';

import 'package:flutter/material.dart';
import 'package:psd_day7_floor/data/local/AppDatabase.dart';
import 'package:psd_day7_floor/data/local/model/Person.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: FloorScreen(),
          ),
        ),
      ),
    );
  }
}


class FloorScreen extends StatefulWidget {
  const FloorScreen({Key? key}) : super(key: key);

  @override
  State<FloorScreen> createState() => _FloorScreenState();
}

class _FloorScreenState extends State<FloorScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: ()async{

          final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

          var personDao=database.personDao;
          var id=Random().nextInt(100000);
          var person=Person(id, "Person $id");
          personDao.addPerson(person);


        }, child: Text("Add Person")),
        ElevatedButton(onPressed: ()async{
          final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

          var list=await database.personDao.getAllPersons();

          list.forEach((element) {
            print('${element?.id}, ${element?.name}');
              });
        }, child: Text("Get All Persons")),
      ],

    );
  }
}
