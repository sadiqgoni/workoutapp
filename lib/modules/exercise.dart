class Exercise{
  final String name;
  final String weight;
  final String reps;
  final String sets;
  late final bool isCompleted;
  Exercise({required this.name,required this.weight,required this.reps,required this.sets,this.isCompleted = false, });
}