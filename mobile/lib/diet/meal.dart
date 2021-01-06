class Meal {
  final String mealTime, name, image, calories, timeTaken;

  Meal({
    this.mealTime,
    this.name,
    this.image,
    this.calories,
    this.timeTaken,
  });
}

final meals = [
  Meal(
    mealTime: 'Breakfast',
    name: "Fruit",
    calories: "200",
    timeTaken: "10",
    image: "images/diet/breakfast.jpg",
  ),
  Meal(
    mealTime: 'Dinner',
    name: "Pasta",
    calories: "610",
    timeTaken: "15",
    image: "images/diet/dinner.jpg",
  ),
  Meal(
    mealTime: 'Snack',
    name: "Keto",
    calories: "439",
    timeTaken: "18",
    image: "images/diet/snack.jpg",
  ),
];
