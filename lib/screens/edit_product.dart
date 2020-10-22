import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:fluteco/providers/Product.dart';
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
  final ScrollController _scrollController = ScrollController();
  var uuid = Uuid();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _discountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String dropDownValue;
  PlatformFile image;
  void chooseImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      _imageController.text = file.name;
      image = file;
    } else {
      // User canceled the picker
    }
  }

  _addProduct({Products products, bool update = false, id}) {
    if (_formKey.currentState.validate()) {
      int _discountedPrice;
      int _originalPrice = int.parse(_priceController.text);

      int _discount;
      if (_discountController.text.isEmpty) {
        _discount = 0;
        _discountedPrice = int.parse(_priceController.text);
      } else {
        _discount = int.parse(_discountController.text);
        _discountedPrice =
            (_originalPrice - (_discount / 100 * _originalPrice)).round();
      }
      if (update) {
        products.updateProduct(
            special: _discount != 0 ? true : false,
            id: id,
            name: _nameController.text,
            description: _descriptionController.text,
            originalPrice: _originalPrice,
            discountedPrice: _discountedPrice,
            category: dropDownValue,
            discount: _discount,
            limit: int.parse(_quantityController.text),
            image: File(image.path),
            platformImage: image);
      } else {
        products.addProduct(
            special: _discount != 0 ? true : false,
            id: "${uuid.v1()}",
            name: _nameController.text,
            description: _descriptionController.text,
            originalPrice: _originalPrice,
            discountedPrice: _discountedPrice,
            category: dropDownValue,
            discount: _discount,
            limit: int.parse(_quantityController.text),
            image: File(image.path),
            platformImage: image);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    if (product != null) {
      _nameController.text = product.name;
      _descriptionController.text = product.description;
      _priceController.text = product.originalPrice.toString();
      _quantityController.text = product.limit.toString();
      dropDownValue = product.category;
      _discountController.text =
          product.discount != 0 ? product.discount.toString() : "";
      _imageController.text = product.platformImage.name;
      image = product.platformImage;
    }
    final products = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Product",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(10),
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
                          decoration: const InputDecoration(
                            labelText: "Name",
                          ),
                          controller: _nameController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(10),
                            horizontal: getProportionateScreenWidth(30)),
                        child: TextFormField(
                          maxLines: 2,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Description is required';
                            } else if (value.length < 20) {
                              return "Description is too short";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Description",
                          ),
                          controller: _descriptionController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(10),
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
                            } else if (potentialNumber < 99 ||
                                potentialNumber > 99999) {
                              return 'Price should be in the range 99 to 99999';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Price (₹)",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(10),
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
                            labelText: "Quantity",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(10),
                            horizontal: getProportionateScreenWidth(30)),
                        child: DropdownButtonFormField(
                          value: dropDownValue,
                          validator: (value) {
                            if (value == null) {
                              return 'Category is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Category",
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
                            vertical: getProportionateScreenWidth(10),
                            horizontal: getProportionateScreenWidth(30)),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _discountController,
                          validator: (value) {
                            if (value.isNotEmpty) {
                              var potentialNumber = int.tryParse(value);
                              if (potentialNumber == null) {
                                return 'Discount should be a number';
                              } else if (potentialNumber <= 0 ||
                                  potentialNumber >= 100) {
                                return 'Invalid % Discount';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "% Discount (optional)"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(10),
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
                            labelText: "Image",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(60),
            ),
            SizedBox(
                height: getProportionateScreenWidth(50),
                width: getProportionateScreenWidth(220),
                child: RoundedButton(
                  text: product != null ? "Update Product" : "Add Product",
                  pressed: () => product != null
                      ? _addProduct(
                          products: products, update: true, id: product.id)
                      : _addProduct(products: products),
                )),
            SizedBox(
              height: getProportionateScreenWidth(60),
            )
          ],
        ),
      ),
    );
  }
}
