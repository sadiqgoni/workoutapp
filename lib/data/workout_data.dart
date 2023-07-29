import 'package:flutter/cupertino.dart';
import 'package:workoutapp/modules/exercise.dart';

import '../modules/workout.dart';

class WorkoutData extends ChangeNotifier {
  final List<Workout> _workoutList = [
    Workout(name: 'Upper Body', exercise: [
      Exercise(
        name: 'Biceps Curl',
        weight: "10",
        reps: "10",
        sets: "3",
      )
    ])
  ];
  List<Workout> getWorkoutList() {
    return _workoutList;
  }

  int numberOfExercisesInWorkout(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    return relevantWorkout.exercise.length;
  }

  void addWorkoutList(String name) {
    getWorkoutList().add(Workout(name: name, exercise: []));
    notifyListeners();
  }

  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    relevantWorkout.exercise.add(
        Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets));
    notifyListeners();
  }

  void checkOffExercise(String workoutName, String exerciseName) {
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    notifyListeners();

  }

  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        getWorkoutList().firstWhere((workout) => workout.name == workoutName);
    return relevantWorkout;
  }

  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    Exercise relevantExercise = relevantWorkout.exercise
        .firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }
}
