import 'package:flutter/cupertino.dart';
import '../../app/app_route.dart';
import '../register_product_screen/register_product_screen_page.dart';

class ProductListViewModel extends ChangeNotifier {

  void navigateToRegisterProduct(BuildContext context) {
    AppRouter.navigateTo(context, RegisterProductPage.route);
    notifyListeners();
  }
}