import 'package:favourite_placess/models/place.dart';
import 'package:favourite_placess/screens/place_details.dart';
import 'package:favourite_placess/screens/places.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added.',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return PlaceDetailScreen(place: places[index]);
              }));
            },
            title: Text(
              places[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          );
        });
  }
}
