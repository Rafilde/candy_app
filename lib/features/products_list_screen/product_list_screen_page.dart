import 'package:candy_app_adm/features/products_list_screen/product_list_view_model.dart';
import 'package:candy_app_adm/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  static const route = '/products_list_screen';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductListViewModel viewModel = ProductListViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {
          viewModel.navigateToRegisterProduct(context);
        },
        child: Icon(Icons.add, color: AppColors.secondaryColorDark,),
      ),
      body: body(),
    );
  }

  Widget body() {
    return ListView(
      children: <Widget>[appBar],
    );
  }

  Widget get appBar {
    return SafeArea(
      top: true,
      child: Container(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: appBarRow,
      ),
    );
  }

  Widget get appBarRow {
    return Row(
      children: <Widget>[
        titleTextAppBar,
      ],
    );
  }

  Widget get titleTextAppBar {
    return Flexible(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Produtos",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.blackLight,
          ),
        ),
      ),
    );
  }
}
