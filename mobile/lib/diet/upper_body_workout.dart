class UpperBodyWorkout {
  final String image, name, instruction;

  UpperBodyWorkout({
    this.image,
    this.name,
    this.instruction,
  });
}

final upper_body = [
  [
    UpperBodyWorkout(
      image: "images/diet/chest.png",
      name: "Pull ups",
      instruction: "3 sets - 6 repetition",
    ),
    UpperBodyWorkout(
      image: "images/diet/chest.png",
      name: "Deadlift",
      instruction: "6 sets - 16 repetition",
    ),
    UpperBodyWorkout(
      image: "images/diet/chest.png",
      name: "lat pulldown",
      instruction: "5 sets - 9 repetition",
    ),
  ],
  [
    UpperBodyWorkout(
      image: "images/diet/back.png",
      name: "Pull ups",
      instruction: "3 sets - 6 repetition",
    ),
    UpperBodyWorkout(
      image: "images/diet/back.png",
      name: "Deadlift",
      instruction: "6 sets - 16 repetition",
    ),
    UpperBodyWorkout(
      image: "images/diet/back.png",
      name: "lat pulldown",
      instruction: "5 sets - 9 repetition",
    ),
  ],
];
