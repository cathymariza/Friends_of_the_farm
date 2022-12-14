enum TimeOfDay {
  morning,
  midday,
  evening,
  night,
  any;

  int serialize() => index;
  static TimeOfDay deserialize(int code) => TimeOfDay.values[code];
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
    required this.description, 
    required this.timeOfDay
  });
  final String description;
  final TimeOfDay timeOfDay;

  Map<String, dynamic> serialize() => {
    "description": description, 
    "timeOfDay": timeOfDay.serialize()};
  static Task deserialize(Map<String, dynamic> serialization) => 
    Task(
      description: serialization['description'], 
      timeOfDay: TimeOfDay.deserialize(serialization['timeOfDay'])
    );
}

class TaskCompletion {
  const TaskCompletion({
    required this.time, 
    required this.hourCount, 
    required this.quantity, 
    required this.units, 
    required this.product
  });
  final DateTime time;
  final num hourCount;
  final num quantity;
  final MeasureUnits units;
  final String product;

  Map<String, dynamic> serialize() => {
    "time": time.toIso8601String(), 
    "hourCount": hourCount, 
    "quantity": quantity, 
    "units": units.serialize(), 
    "product": product};
  static TaskCompletion deserialize(Map<String, dynamic> serialization) => 
    TaskCompletion(
      time: DateTime.parse(serialization['day']), 
      hourCount: serialization['hourCount'], 
      quantity: serialization['quantity'], 
      units: MeasureUnits.deserialize(serialization['units']), 
      product: serialization['product']
    );
}
