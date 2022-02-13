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
  Task({
    required this.taskName,
    required this.finished,
    required this.skipped,
    required this.taskID,
    required this.taskListID,
    this.parentTaskID,
    this.deadlineDate,
    this.deadlineTime,
  });
  String taskID;
  String taskListID;
  String? parentTaskID; // used for repeated task instance only
  String taskName;
  DateTime? deadlineDate;
  DateTime? deadlineTime;
  bool finished;
  bool skipped;
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

  String taskListID;
  String repeatingTaskId;
  String repeatingTaskName;
  RepeatCycle repeatCycle;
  RepeatFrequency? repeatFrequency;
  DateTime deadlineDate;
  DateTime? deadlineTime;
}

class TaskList {
  String taskListID;
  String taskListName;
  List<Task> nonRepeatingTask;
  List<RepeatingTask> repeatingTask;
  List<Task> repeatingTaskInstaces = [];

  TaskList(
      {required this.nonRepeatingTask,
      required this.repeatingTask,
      required this.repeatingTaskInstaces,
      required this.taskListID,
      required this.taskListName});
}
