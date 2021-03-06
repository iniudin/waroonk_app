import 'drink.dart';
import 'food.dart';

class Menus {
  List<Food> foods;
  List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: (json['foods'] as List<dynamic>)
            .map((e) => Food.fromJson(e as Map<String, dynamic>))
            .toList(),
        drinks: (json['drinks'] as List<dynamic>)
            .map((e) => Drink.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'foods': foods.map((e) => e.toJson()).toList(),
        'drinks': drinks.map((e) => e.toJson()).toList(),
      };
}
