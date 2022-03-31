import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/restaurants/restaurant.dart';
import 'package:restaurant_app/widget/restaurant_item.dart';

class RestaurantPage extends StatelessWidget {
  static const routeName = "/restaurant_page";
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final restaurants = parseJson(snapshot.data.toString());
          return GridView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantListItem(
                restaurant: restaurants[index],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
            ),
          );
        } else {
          return const CircularProgressIndicator(
            semanticsLabel: "Loading data...",
          );
        }
      },
    );
  }
}
