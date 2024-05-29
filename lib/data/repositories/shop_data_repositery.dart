import 'package:vehicanich_shop/data/repositories/shop_id_service.dart';

class FirebaseDatastoring {
  //shopid taking and storing in a global variable for easy access
  static late String shopid;
  shopidstoring() async {
    //this funtion shopIdservice wrote in another file and just call that to here
    final store = await ShopIdService().getShopId();
    shopid = store;
  }
}
