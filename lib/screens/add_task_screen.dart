import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? text;

    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(
              20.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(
                height: 32.0,
              ),
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 32.0,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              TextField(
                onChanged: (String newText) {
                  text = newText;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                cursorColor: Colors.lightBlueAccent,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 5.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 5.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Provider.of<TaskProvider>(context, listen: false).addTask(
                      Task(
                          name: text ??
                              'I am stupid for not filling in my own task'));
                  Navigator.of(context).pop();
                },
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                color: Colors.lightBlueAccent,
              ),
              const SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
