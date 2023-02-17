import 'package:realm/realm.dart';
part 'task_model.g.dart';

@RealmModel()
class _TaskModel {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool complete = false;
}

@RealmModel()
class _TaskBoard {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late List<_TaskModel> tasks;
  bool enable = true;
}
