import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';

class HomePageControllar {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDetailsController = TextEditingController();

  List<TaskDataModel> taskList = [
    TaskDataModel(
        taskName: "taskName1",
        taskDetails: "taskDetails1taskDetails1taskDetails1taskDetails1222",
        isComplete: false),
    TaskDataModel(
        taskName: "taskName2", taskDetails: "taskDetails2", isComplete: false),
    TaskDataModel(
        taskName: "taskName3", taskDetails: "taskDetails3", isComplete: false)
  ];

  void addTask(context) {
    taskList.add(TaskDataModel(
        taskName: taskTitleController.text,
        taskDetails: taskDetailsController.text,
        isComplete: false));
    taskTitleController.text = '';
    taskDetailsController.text = '';
    Navigator.pop(context);
  }

  void checkedbox(index) {
    taskList[index].isComplete = !taskList[index].isComplete;
  }

  int taskComplect() {
    int counttrue = 0;
    int countfalse = 0;
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].isComplete == true) {
        counttrue = counttrue + 1;
      } else {
        countfalse = countfalse + 1;
      }
    }

    return countfalse;
  }
}
