import 'package:objectbox/objectbox.dart';
import 'teacher.dart';

@Entity()
class Student {
  int id;
  String name;
  final teachers = ToMany<Teacher>();

  Student(this.name, {this.id = 0});

  toString() => 'Student{id: $id, name: $name}';
}
