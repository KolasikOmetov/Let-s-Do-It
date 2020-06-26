import 'package:hive/hive.dart';
import 'package:letsdoit/model/task.dart';

class TaskRepository {
  final tasksBox = Hive.box('tasks');

  List<Task> getTasksByDate(DateTime date) {
    List<Task> allTasks = [];
    for (var i = 0; i < tasksBox.length; i++) {
      final task = tasksBox.getAt(i) as Task;
      print(task.id);
      if ((task.dateStart.millisecondsSinceEpoch >=
              date.millisecondsSinceEpoch) &&
          (task.dateStart.millisecondsSinceEpoch <
              date.millisecondsSinceEpoch + 86400000)) allTasks.add(task);
    }
    return allTasks;
  }

  createTask(Task task) => tasksBox.add(task);

  updateTask(int oldId, int newId, Task task) {
    for (int i = 0; i < tasksBox.length; i++) {
      final task = tasksBox.getAt(i) as Task;
      if (task.id == oldId) {
        task.id = newId;
        tasksBox.putAt(i, task);
        break;
      }
    }
  }

  deleteTaskById(int id) {
    for (int i = 0; i < tasksBox.length; i++) {
      final task = tasksBox.getAt(i) as Task;
      if (task.id == id) {
        tasksBox.deleteAt(i);
        break;
      }
    }
  }
}
