import 'package:flutter/material.dart';
import 'package:listinha_app/src/shared/services/realm/models/task_model.dart';

enum TaskCardStatus {
  pending(Icons.access_time, 'Pending'),
  completed(Icons.check, 'Completed'),
  disabled(Icons.cancel, 'Disabled');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}

class TaskCardWidget extends StatelessWidget {
  final TaskBoard board;
  final double height;

  const TaskCardWidget({
    super.key,
    required this.board,
    this.height = 130,
  });

  double getProgrees(List<TaskModel> tasks) {
    if (tasks.isEmpty) return 0;
    final totalTasks = tasks.length;
    final totalCompleteTasks = tasks.where((task) => task.complete).length;

    return totalCompleteTasks / totalTasks;
  }

  String getProgressText(List<TaskModel> tasks) {
    final totalTasks = tasks.length;
    final totalCompleteTasks = tasks.where((task) => task.complete).length;
    return '$totalCompleteTasks/$totalTasks';
  }

  TaskCardStatus getStatus(TaskBoard board, double progress) {
    if (board.enable == false) {
      return TaskCardStatus.disabled;
    } else if (progress < 1.0) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.completed;
    }
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.disabled:
        return theme.colorScheme.secondaryContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.disabled:
        return theme.colorScheme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = board.title;
    final progress = getProgrees(board.tasks);
    final progressText = getProgressText(board.tasks);
    final status = getStatus(board, progress);
    final statusIcon = status.icon;
    final statusText = status.text;
    final color = getColor(status, theme);
    final backgroundColor = getBackgroundColor(status, theme);

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(statusIcon, color: theme.iconTheme.color?.withOpacity(0.5)),
              const Spacer(),
              Text(
                statusText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (board.tasks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  color: color,
                ),
                const SizedBox(height: 2),
                Text(
                  progressText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
