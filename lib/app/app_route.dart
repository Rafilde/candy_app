import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/client_list_screen/client_list_screen_page.dart';
import '../features/products_list_screen/product_list_screen_page.dart';
import '../features/register_product_screen/register_product_screen_page.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    RegisterProductPage.route: (context) => RegisterProductPage(),
    ClientPage.route: (context) => ClientPage(),
    ProductPage.route: (context) => ProductPage(),
    // Adicione mais rotas conforme necessário
  };

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
