enum RepeatCycle {
  onceADay,
  onceADayMonFri,
  onceAWeek,
  onceAMonth,
  onceAYear,
  other
}
enum Tenure { days, weeks, months, years }

class RepeatFrequency {
  RepeatFrequency({required this.num, required this.tenure});
  int num;
  Tenure tenure;
}

class Task {
  static late int counter;
  Task({
    required this.taskName,
    required this.finished,
    taskID = null,
    required this.taskListID,
    this.parentTaskID,
    this.deadlineDate,
    this.deadlineTime,
  }) {
    if (taskID == null) {
      this.taskID = counter;
      counter++;
    } else {
      this.taskID = taskID;
    }
  }

  static initializecounter(int counter) {
    Task.counter = counter;
  }

  late int taskID;
  int taskListID;
  int? parentTaskID; // used for repeated task instance only
  String taskName;
  DateTime? deadlineDate;
  DateTime? deadlineTime;
  bool finished;
  void finishTask() {
    finished = true;
  }
}

class RepeatingTask {
  RepeatingTask(
      {required this.repeatingTaskId,
      required this.repeatCycle,
      required this.repeatingTaskName,
      required this.deadlineDate,
      required this.taskListID,
      this.repeatFrequency,
      this.deadlineTime});

  int taskListID;
  int repeatingTaskId;
  String repeatingTaskName;
  RepeatCycle repeatCycle;
  RepeatFrequency? repeatFrequency;
  DateTime deadlineDate;
  DateTime? deadlineTime;
}

class TaskList {
  int taskListID;
  String taskListName;
  List<Task> nonRepeatingTask;
  List<RepeatingTask> repeatingTask;
  List<Task> activeRepeatingTaskInstaces = [];

  TaskList(
      {required this.nonRepeatingTask,
      required this.repeatingTask,
      required this.activeRepeatingTaskInstaces,
      required this.taskListID,
      required this.taskListName});
  List<Task> getActiverTask() {
    List<Task> activeNonRepeatingTask = [];
    {
      for (var i = 0; i < nonRepeatingTask.length; i++) {
        if (nonRepeatingTask[i].finished == false) {
          activeNonRepeatingTask.add(nonRepeatingTask[i]);
        }
      }
      return (activeNonRepeatingTask);
    }
  }

  List<Task> getFinishedTask() {
    return ([]);
  }

  void finished() {}

  void addTask({
    required String taskName,
    DateTime? deadlineDate,
    DateTime? deadlineTime,
    int? parentTaskId,
  }) {
    Task(
      taskName: taskName,
      finished: false,
      taskListID: taskListID,
      deadlineDate: deadlineDate,
      deadlineTime: deadlineTime,
      parentTaskID: parentTaskId,
    );
    if (parentTaskId != null) {
      activeRepeatingTaskInstaces;
    }
  }

  void finishTask(Task task) {}
}
