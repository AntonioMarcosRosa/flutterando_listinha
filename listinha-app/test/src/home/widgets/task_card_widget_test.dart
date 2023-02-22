import 'package:flutter_test/flutter_test.dart';
import 'package:listinha_app/src/home/widgets/task_card_widget.dart';
import 'package:listinha_app/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

final board = TaskBoard(Uuid.v4(), '');

void main() {
  test('getProgress...', () {
    final tasks = [
      TaskModel(Uuid.v4(), '', complete: true),
      TaskModel(Uuid.v4(), ''),
      TaskModel(Uuid.v4(), '', complete: true),
      TaskModel(Uuid.v4(), ''),
    ];

    final progress = TaskCardWidget(board: board).getProgrees(tasks);

    expect(progress, 0.5);
  });
}
