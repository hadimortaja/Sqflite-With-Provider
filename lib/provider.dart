import 'package:flutter/widgets.dart';

import 'db/db.dart';
import 'model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> array =  List<TaskModel>();
  bool value = false;
  Future getData() async {
    List<TaskModel> newArray = [];
    await MyDatabase.myDatabase
        .getAllTask()
        .then((value) => value.forEach((element) {
              newArray.add(TaskModel.fromMap(element));
            }))
        .whenComplete(() => array.clear())
        .whenComplete(() => array.addAll(newArray))
        .whenComplete(() => notifyListeners());
  }

  updateTask(TaskModel task) async {
    await MyDatabase.myDatabase
        .updateTask(task)
        .whenComplete(() => notifyListeners());
  }

  deleteTask(int id) async {
    await MyDatabase.myDatabase.deleteTask(id);
    getData();
  }

  Future insertTask(TaskModel task) async {
    await MyDatabase.myDatabase.insertTask(task);
    getData();
  }
}
