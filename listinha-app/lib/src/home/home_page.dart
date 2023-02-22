import 'package:flutter/material.dart';
import 'package:listinha_app/src/home/widgets/custom_drawer_widget.dart';
import 'package:listinha_app/src/home/widgets/task_card_widget.dart';
import 'package:listinha_app/src/shared/services/realm/models/task_model.dart';
import 'package:listinha_app/src/shared/widgets/user_image_button_widget.dart';
import 'package:realm/realm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButtonWidget(),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 80,
                left: 20,
                right: 20,
                bottom: 80,
              ),
              itemCount: 25,
              itemBuilder: (_, index) {
                final board = TaskBoard(
                  Uuid.v4(),
                  'Nova Lista $index',
                  tasks: [
                    TaskModel(Uuid.v4(), '', complete: true),
                    TaskModel(Uuid.v4(), '', complete: true),
                    TaskModel(Uuid.v4(), '', complete: true),
                    TaskModel(Uuid.v4(), '', complete: true),
                  ],
                );
                return TaskCardWidget(
                  board: board,
                  height: 160,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(height: 8),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton(
                  segments: const [
                    ButtonSegment(value: 0, label: Text('All')),
                    ButtonSegment(value: 1, label: Text('Pending')),
                    ButtonSegment(value: 2, label: Text('Complete')),
                    ButtonSegment(value: 3, label: Text('Disabled')),
                  ],
                  selected: const {1},
                  onSelectionChanged: (values) {},
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed('./edit'),
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
