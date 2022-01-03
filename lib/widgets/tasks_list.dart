import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (BuildContext context, TaskProvider currentData, _) =>
          ListView.builder(
        itemCount: Provider.of<TaskProvider>(context).getTasksLength(),
        itemBuilder: (BuildContext context, int index) => TaskTile(
          taskTitle: currentData.getTasks()[index].name,
          isChecked: currentData.getTasks()[index].isDone,
          checkboxCallback: (bool? checkboxState) {
            currentData.setTaskStatus(index, checkboxState!);
          },
          longPressCallback: () {
            currentData.deleteTask(index);
          },
        ),
      ),
    );
  }
}
