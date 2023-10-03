

import 'package:floor/floor.dart';
import 'package:psd_day7_floor/data/local/model/Person.dart';

@dao
abstract class PersonDao{


  @insert
  Future<void> addPerson(Person p);
  
  @Query("Select name,age from Person where id = :id")
  Future<Person?> getPerson(int id);
  
  
  @Query("Select * from Person")
  Future<List<Person?>> getAllPersons();

}