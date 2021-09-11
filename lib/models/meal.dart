enum Complexity { Simple, Challenging, Hard }
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List ingredients;
  final List steps;
  final Affordability affordability;
  final Complexity complexity;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

 const Meal({
      required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.affordability,
      required this.complexity,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree});
}
