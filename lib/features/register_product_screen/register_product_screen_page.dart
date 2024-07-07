import 'dart:io';
import 'package:candy_app_adm/features/register_product_screen/register_product_view_model.dart';
import 'package:candy_app_adm/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterProductPage extends StatefulWidget {
  const RegisterProductPage({Key? key}) : super(key: key);

  @override
  State<RegisterProductPage> createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProductViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: body(),
      ),
    );
  }

  Widget body() {
    return ListView(
      children: <Widget>[appBar, buildForm],
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
        backButtonAppBar,
        titleTextAppBar,
        const SizedBox(width: 60),
      ],
    );
  }

  Widget get backButtonAppBar {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: iconButton(
        const Icon(
          Icons.close,
          size: 30,
        ),
        () {
          Navigator.pop(context);
        },
        ContSize: 25,
      ),
    );
  }

  Widget get titleTextAppBar {
    return Flexible(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Cadastrar produto",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.blackLight,
          ),
        ),
      ),
    );
  }

  Widget iconButton(Icon icon, VoidCallback? onPressed,
      {double ContSize = 20}) {
    return CircleAvatar(
      radius: ContSize,
      backgroundColor: AppColors.secondaryColor,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: AppColors.secondaryColorDark,
      ),
    );
  }

  Widget get buildForm {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<RegisterProductViewModel>(
        builder: (context, viewModel, _) => Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProductNameField(viewModel),
              const SizedBox(height: 16),
              _buildQuantityField(viewModel),
              const SizedBox(height: 16),
              _buildPriceField(viewModel),
              const SizedBox(height: 16),
              _buildImagePreview(viewModel),
              const SizedBox(height: 16),
              buildElevatedButton(
                onPressed: viewModel.pickImages,
                text: "Adicionar Foto(s)",
              ),
              const SizedBox(height: 16),
              buildElevatedButton(
                onPressed: () => viewModel.registerProduct(context),
                text: "Cadastrar Produto",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildElevatedButton({
    required VoidCallback onPressed,
    required String text,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(15),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }

  Widget _buildProductNameField(RegisterProductViewModel viewModel) {
    return TextFormField(
      controller: viewModel.nameController,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        labelText: "Nome",
        labelStyle: TextStyle(color: AppColors.blackLight),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackLight),
        ),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Por favor, insira o nome do produto";
        }
        return null;
      },
    );
  }

  Widget _buildQuantityField(RegisterProductViewModel viewModel) {
    return TextFormField(
      controller: viewModel.quantityController,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        labelText: "Quantidade",
        labelStyle: TextStyle(color: AppColors.blackLight),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackLight),
        ),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Por favor, insira a quantidade do produto";
        }
        if (int.tryParse(value) == null) {
          return "Por favor, insira um número válido";
        }
        return null;
      },
    );
  }

  Widget _buildPriceField(RegisterProductViewModel viewModel) {
    return TextFormField(
      controller: viewModel.priceController,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        labelText: "Preço",
        labelStyle: TextStyle(color: AppColors.blackLight),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackLight),
        ),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Por favor, insira o preço do produto";
        }
        return null;
      },
    );
  }

  Widget _buildImagePreview(RegisterProductViewModel viewModel) {
    final images = viewModel.images;
    if (images.isEmpty) {
      return Center(child: const Text("Nenhuma imagem selecionada"));
    }
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Image.file(
                File(images[index].path),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                child: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () => viewModel.removeImage(index),
                    color: AppColors.red),
              ),
            ],
          );
        },
      ),
    );
  }
}
