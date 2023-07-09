import 'dart:convert';

import 'package:get/get.dart';
import 'package:planify/app/core/utils/keys.dart';
import 'package:planify/app/data/models/task.dart';
import 'package:planify/app/data/services/storage/services.dart';

class TaskProvider{
  final StorageService _storage = Get.find<StorageService>();

  /*{'tasks': [
    'title' : "Work",
     'color' : '#ff123456',
    'icon': 0xe123}
  ]}*/

  List<Task> readTasks () {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString());
      for (var e in tasks) {
        tasks.add(Task.fromJson(e as Map<String, dynamic>));
      }
    return tasks;
  }
    void writeTasks(List<Task> tasks)
    {
      _storage.write(taskKey, jsonEncode(tasks));
    }
}