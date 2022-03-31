class Drink {
  String name;

  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
