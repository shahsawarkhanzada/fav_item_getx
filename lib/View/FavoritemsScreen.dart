// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxfavitems/Controller/favouriteListController.dart';

class FavouriteItemsScreen extends StatefulWidget {
  const FavouriteItemsScreen({super.key});

  @override
  State<FavouriteItemsScreen> createState() => _FavouriteItemsScreenState();
}

class _FavouriteItemsScreenState extends State<FavouriteItemsScreen> {
  FavouriteListController favouriteListController =
      Get.put(FavouriteListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => ListView.builder(
          itemCount: favouriteListController.FavCarList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  if (favouriteListController.FavCarList.contains(
                      favouriteListController.FavCarList[index].toString())) {
                    favouriteListController.removefavourite(
                        favouriteListController.FavCarList[index].toString());
                    Get.snackbar('Item Removed', 'The item has been removed');
                  }
                },
                title:
                    Text(favouriteListController.FavCarList[index].toString()),
                trailing: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            );
          }),
    ));
  }
}
