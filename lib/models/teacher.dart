import 'package:objectbox/objectbox.dart';
import 'student.dart';

@Entity()
class Teacher {
  int id;
  String name;
  final teachers = ToMany<Student>();

  Teacher(this.name, {this.id = 0});

  toString() => 'Teacher{id: $id, name: $name}';
}
