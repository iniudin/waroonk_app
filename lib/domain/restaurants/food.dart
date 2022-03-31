class Food {
  String name;

  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
