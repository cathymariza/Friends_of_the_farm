import 'package:flutter/material.dart';

enum TimeOfDay implements Comparable<TimeOfDay> {
  morning(10),
  midday(20),
  evening(30),
  night(40);

  const TimeOfDay(this.timeOrder);
  final int timeOrder;

  int serialize() => index;
  static TimeOfDay deserialize(int code) => TimeOfDay.values[code];

  @override
  int compareTo(TimeOfDay other) {
    return timeOrder.compareTo(other.timeOrder);
  }
}

enum MeasureUnits {
  units,
  ounces,
  pounds,
  fluidOunces,
  cups,
  quarts,
  gallons,
  minutes,
  hours;

  int serialize() => index;
  static MeasureUnits deserialize(int code) => MeasureUnits.values[code];
}

class Task {
  const Task({
    required this.timeOfDay, 
    required this.day, 
    required this.quantity, 
    required this.units, 
    required this.product});
  final TimeOfDay timeOfDay;
  final DateTime day;
  final num quantity;
  final MeasureUnits units;
  final String product;

  Map<String, dynamic> serialize() => {
    "timeOfDay": timeOfDay.serialize(), 
    "day": day.toIso8601String(), 
    "quantity": quantity, 
    "units": units.serialize(), 
    "product": product};
  static Task deserialize(Map<String, dynamic> serializedTask) => Task(
    timeOfDay: TimeOfDay.deserialize(serializedTask['timeOfDay']), 
    day: DateTime.parse(serializedTask['day']), 
    quantity: serializedTask['quantity'], 
    units: MeasureUnits.deserialize(serializedTask['units']), 
    product: serializedTask['product']);
}

/// A basic view of a task, designed to easily fit into a list.
class TaskDisplayWidget extends StatelessWidget {
  const TaskDisplayWidget({super.key, required this.task});

  final Task task;

  String parseDayAsString() {
    final months = [
      'January', 'February', 'March', 
      'April', 'May', 'June', 
      'July', 'August', 'September', 
      'October', 'November', 'December'];
    return '${months[task.day.month]} ${task.day.day}, ${task.timeOfDay.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${task.quantity} ${task.units} of ${task.product}'),
      subtitle: Text(parseDayAsString()),
    );
  }
}
