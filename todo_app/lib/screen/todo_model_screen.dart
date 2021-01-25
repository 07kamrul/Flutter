import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/task_model.dart';

class TodoModel extends ChangeNotifier{

  List<TaskModel> taskList = [];

  addTaskInList(){
    TaskModel taskModel = TaskModel("title ${taskList.length}", "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}























