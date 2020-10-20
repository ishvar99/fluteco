import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/splash/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/categories.dart';
import '../providers/Products.dart';
import 'package:uuid/uuid.dart';

class EditProduct extends StatefulWidget {
  static const routeName = "/edit-product";

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();
  var uuid = Uuid();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  String dropDownValue = "Jewels";
  PlatformFile image;
  void chooseImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _imageController.text = file.name;
        image = file;
      });
    } else {
      // User canceled the picker
    }
  }

  _addProduct(Products products) {
    if (_formKey.currentState.validate()) {
      print(_nameController.text);
      print(_priceController.text);
      print(_quantityController.text);
      print(dropDownValue);
      print(image);
      products.addProduct(
        special: true,
        id: "${uuid.v1()}",
        name: _nameController.text,
        description: "lorem ipsum",
        price: int.parse(_priceController.text),
        limit: int.parse(_quantityController.text),
        image: File(image.path),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Product",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(15),
                    horizontal: getProportionateScreenWidth(30)),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name is required';
                    } else if (value.length < 5) {
                      return "Name should be atleast 5 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(15),
                    horizontal: getProportionateScreenWidth(30)),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Price is required';
                    }
                    var potentialNumber = int.tryParse(value);
                    if (potentialNumber == null) {
                      return 'Price should be a number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Price (₹)",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(15),
                    horizontal: getProportionateScreenWidth(30)),
                child: TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Quantity is required';
                    }
                    var potentialNumber = int.tryParse(value);
                    if (potentialNumber == null) {
                      return 'Quantity should be a number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Quantity",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(15),
                    horizontal: getProportionateScreenWidth(30)),
                child: DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Category is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Category",
                  ),
                  items: [
                    ...categories
                        .map((element) => DropdownMenuItem(
                              value: element.text.toString(),
                              child: Text(element.text),
                            ))
                        .toList()
                  ],
                  onChanged: (val) {
                    setState(() {
                      dropDownValue = val;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(15),
                    horizontal: getProportionateScreenWidth(30)),
                child: TextFormField(
                  readOnly: true,
                  controller: _imageController,
                  validator: (value) {
                    if (value == "") {
                      return 'Image is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: chooseImage,
                      child: Icon(
                        Icons.image,
                      ),
                    ),
                    hintText: "Image",
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(40),
              ),
              SizedBox(
                  height: getProportionateScreenWidth(45),
                  width: getProportionateScreenWidth(200),
                  child: RoundedButton(
                    text: "Add Product",
                    pressed: () => _addProduct(products),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
