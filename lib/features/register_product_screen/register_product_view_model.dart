import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterProductViewModel extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final List<XFile> _images = [];
  final ImagePicker _picker = ImagePicker();

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get nameController => _nameController;

  TextEditingController get quantityController => _quantityController;

  TextEditingController get priceController => _priceController;

  List<XFile> get images => _images;

  Future<void> pickImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      _images.addAll(pickedFiles);
      notifyListeners();
    }
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void clearControllers() {
    nameController.clear();
    quantityController.clear();
    priceController.clear();
    _images.clear();
    notifyListeners();
  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  void registerProduct(BuildContext context) {
    if (validateForm()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produto cadastrado com sucesso!'),
        ),
      );
      clearControllers();
    }
  }
}
