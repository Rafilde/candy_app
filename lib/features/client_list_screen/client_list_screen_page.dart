import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE1EF),
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
          "Pedidos",
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
