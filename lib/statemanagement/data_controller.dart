import 'package:flutter/foundation.dart';
import 'package:flutter_objectbox_state/database/objectbox.dart';

// Should I store ObjectBox here? Or should I just change the class ObjectBox
// into ChangeNotifer?

class DataController extends ChangeNotifier {
  late ObjectBox objectBoxProvider;

  DataController() {
    objectBoxProvider = ObjectBox.create() as ObjectBox;
  }
}
