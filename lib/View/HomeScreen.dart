import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getxfavitems/Controller/favouriteListController.dart';
import 'package:getxfavitems/View/FavoritemsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FavouriteListController favouriteListController =
      Get.put(FavouriteListController());
  @override
  Widget build(BuildContext context) { 
    print('object rebuild');
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteListController.CarsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        onTap: () {
                          if (favouriteListController.FavCarList.contains(
                              favouriteListController.CarsList[index]
                                  .toString())) {
                            Get.snackbar('Already added!',
                                'Item is already in the favourites');
                          } else {
                            favouriteListController.addtofavourite(
                                favouriteListController.CarsList[index]
                                    .toString());

                            Get.snackbar('Favorite Added',
                                'The item is added to favourites');
                          }
                        },
                        title: Text(
                            favouriteListController.CarsList[index].toString()),
                        trailing: Obx(
                          () => Icon(
                            Icons.favorite,
                            color: favouriteListController.FavCarList.contains(
                                    favouriteListController.CarsList[index]
                                        .toString())
                                ? Colors.red
                                : Colors.white,
                          ),
                        )),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const FavouriteItemsScreen());
              },
              child: const Text('Favourite items'))
        ],
      ),
    );
  }
}
