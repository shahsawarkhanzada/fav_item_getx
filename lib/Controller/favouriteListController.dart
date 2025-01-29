import 'package:get/get.dart';

import 'package:get/state_manager.dart';

class FavouriteListController extends GetxController {
  RxList<String> CarsList = [
    'Toyota Grande',
    'Toyota Altis',
    'Honda Civic',
    'Suzuki Alto',
    'Suzuki Swift',
    'Suzuki WagonR',
    'Honda Civic Reborn',
    'Corolla 1998',
    'Suzuki Baleno',
    'Toyota X',
    'Suzuki Cultus'
  ].obs;

  RxList<dynamic> FavCarList = [].obs;

  addtofavourite(String value) {
    FavCarList.add(value);
  }

  removefavourite(String value) {
    FavCarList.remove(value);
  }
}
