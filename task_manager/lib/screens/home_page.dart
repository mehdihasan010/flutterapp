import 'package:flutter/material.dart';
import 'package:task_manager/src/homepage_controllar.dart';
import 'package:task_manager/style/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageControllar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Task Manager",
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.fontColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${controller.taskComplect()} Task Pending",
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: controller.taskList.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: expansionTile(index),
            );
          }),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.fontColor,
        //mini: true,
        onPressed: () {
          addItem(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  //    expansionTile

  ExpansionTile expansionTile(int index) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(20),
      expandedAlignment: Alignment.topLeft,
      collapsedShape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Checkbox(
            activeColor: AppColors.fontColor,
            value: controller.taskList[index].isComplete,
            onChanged: (value) {
              setState(() {
                //_throwShotAway = newValue!;
                controller.checkedbox(index);
              });
            }),
      ),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      title: Text(
        controller.taskList[index].taskName,
        style: TextStyle(
            fontSize: 18,
            color: AppColors.fontColor,
            fontWeight: FontWeight.bold,
            decoration: controller.taskList[index].isComplete
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            controller.taskList[index].taskDetails,
            textDirection: TextDirection.ltr,
          ),
        )
      ],
    );
  }

  //   addItem

  Future<dynamic> addItem(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Add New Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller.taskTitleController,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                TextField(
                  controller: controller.taskDetailsController,
                  decoration: const InputDecoration(hintText: "Detail"),
                ),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: AppColors.fontColor,
                textColor: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Add'),
                ),
                onPressed: () {
                  setState(() {
                    controller.taskTitleController.text == ""
                        ? Navigator.pop(context)
                        : controller.addTask(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
