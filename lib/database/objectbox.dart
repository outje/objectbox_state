import 'package:flutter_objectbox_state/models/student.dart';
import 'package:flutter_objectbox_state/models/teacher.dart';
import 'package:flutter_objectbox_state/objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  late final Store store;
  late final Box<Student> studentBox;
  late final Box<Teacher> teacherBox;

  /// Streams of teachers, students
  late final Stream<Query<Student>> queryStream;
  late final Stream<Query<Teacher>> queryStreamCategory;

  ObjectBox._create(this.store) {
    studentBox = Box<Student>(store);
    teacherBox = Box<Teacher>(store);

    final qBuilder = studentBox.query()
      ..order(Student_.name, flags: Order.descending);
    queryStream = qBuilder.watch(triggerImmediately: true);

    final qBuilderCategory = teacherBox.query()
      ..order(Teacher_.name, flags: Order.descending);
    queryStreamCategory = qBuilderCategory.watch(triggerImmediately: true);

    // Add some demo data if the box is empty.
    if (studentBox.isEmpty()) {
      _putDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  // Queries:
  void addStudent(Student student) => studentBox.put(student);
  void addTeacher(Teacher teacher) => teacherBox.put(teacher);
  Student? getStudent(studentID) => studentBox.get(studentID);
  List? getAllStudents() => studentBox.getAll();
  void removeStudent(int studentID) => studentBox.remove(studentID);

  void _putDemoData() {
    final demoStudents = [
      Student('AAA'),
      Student('BBB'),
      Student('CCC'),
    ];
    studentBox.putMany(demoStudents);

    final demoTeachers = [
      Teacher('DDD'),
      Teacher('EEE'),
      Teacher('FFF'),
    ];
    teacherBox.putMany(demoTeachers);
  }
}
