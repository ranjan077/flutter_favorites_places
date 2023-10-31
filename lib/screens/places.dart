import 'package:favourite_placess/providers/user_places.dart';
import 'package:favourite_placess/screens/add_place.dart';
import 'package:favourite_placess/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Your Places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AddPlaceScreen();
                }));
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: PlacesList(
          places: userPlaces,
        ));
  }
}
