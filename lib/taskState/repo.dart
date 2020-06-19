import 'package:hive/hive.dart';
import 'package:letsdoit/model/task.dart';

class TaskRepository {
  final tasksBox = Hive.box('tasks');

  List<Task> getTasksByDate(DateTime date){
    List<Task> allTasks = [];
    for(var i = 0; i < tasksBox.length; i++){
      final task = tasksBox.getAt(i) as Task;
      if((task.dateStart.millisecondsSinceEpoch >= date.millisecondsSinceEpoch)
          &&
          (task.dateStart.millisecondsSinceEpoch < date.millisecondsSinceEpoch + 86400000))
        allTasks.add(task);
    }
    return allTasks;
  }

  createTask(Task task) => tasksBox.add(task);

  updateTask(int id, Task task) => tasksBox.putAt(id, task);

  deleteTaskById(int id){
    for(int i = 0; i < tasksBox.length; i++){
      final task = tasksBox.getAt(i) as Task;
      if(task.id == id){
        tasksBox.deleteAt(i);
        break;
      }
    }
  }
}