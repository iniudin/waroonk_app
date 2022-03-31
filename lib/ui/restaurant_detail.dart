import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/restaurants/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = "restaurant_detail";
  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(restaurant.pictureId),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          Text(
                            restaurant.city,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            restaurant.rating.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    "Deskripsi",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    "Menu Makanan",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      ...restaurant.menus.foods.map((item) {
                        return Card(child: ListTile(title: Text(item.name)));
                      }).toList(),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    "Menu Minuman",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      ...restaurant.menus.drinks.map((item) {
                        return Card(child: ListTile(title: Text(item.name)));
                      }).toList(),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
