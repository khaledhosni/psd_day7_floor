import 'dart:async';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

import 'package:floor/floor.dart';
import 'package:psd_day7_floor/data/local/dao/PersonDao.dart';
import 'package:psd_day7_floor/data/local/model/Person.dart';


part 'AppDatabase.g.dart';

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase{
  PersonDao get personDao;

}