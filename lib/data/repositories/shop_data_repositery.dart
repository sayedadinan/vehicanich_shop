import 'package:vehicanich_shop/data/repositories/shop_id_service.dart';

class FirebaseDatastoring {
  static late String shopid;
  shopidstoring() async {
    final store = await ShopIdService().getShopId();
    shopid = store;
  }
}
