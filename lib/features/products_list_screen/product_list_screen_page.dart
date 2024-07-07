import 'package:flutter/material.dart';
import '../register_product_screen/register_product_screen_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE1EF),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterProductPage()),
          );
        },
        child: Icon(Icons.add, color: Color(0xFF002F24),),
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
            color: Color(0xFF2D2D2D),
          ),
        ),
      ),
    );
  }
}
