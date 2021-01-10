import 'package:file_picker/file_picker.dart';
import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/screens/Home.dart';
import 'package:fluteco/screens/OTP.dart';
import 'package:fluteco/services/FirebaseAuthHelper.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';
import 'package:fluteco/widgets/splash/RoundedButton.dart';
import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import 'dart:math';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  FireBaseAuthHelper _authHelper = FireBaseAuthHelper();
  FirebaseFirestoreHelper _firestoreHelper = FirebaseFirestoreHelper();
  PlatformFile _image;
  bool _loading = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                Text(
                  "FLUTECO",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'The smarter way to shop',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(5),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            buildFirstNameFormField(),
                            SizedBox(height: getProportionateScreenHeight(35)),
                            buildLastNameFormField(),
                            SizedBox(height: getProportionateScreenHeight(35)),
                            buildPhoneNumberFormField(),
                            SizedBox(height: getProportionateScreenHeight(35)),
                            buildAddressFormField(),
                            SizedBox(height: getProportionateScreenHeight(35)),
                            buildPinCodeFormField(),
                            SizedBox(height: getProportionateScreenHeight(35)),
                            buildImageFormField(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(35)),
                  width: double.infinity,
                  height: getProportionateScreenWidth(50),
                  child: RoundedButton(
                    loading: _loading,
                    text: "Continue",
                    pressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _loading = true;
                        });
                        try {
                          String _imageUrl =
                              await _firestoreHelper.uploadProductImage(_image);
                          await _authHelper.updateProfile(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              profile: _imageUrl,
                              address: _addressController.text,
                              pinCode: _pinCodeController.text,
                              phoneNumber:
                                  int.parse(_phoneNumberController.text));
                          setState(() {
                            _loading = false;
                          });
                          Navigator.pushReplacementNamed(
                              context, Home.routeName);
                        } catch (e) {
                          print(e);
                          setState(() {
                            _loading = false;
                          });
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      _imageController.text = file.name;
      _image = file;
    } else {
      // User canceled the picker
    }
  }

  TextFormField buildImageFormField() {
    return TextFormField(
      readOnly: true,
      controller: _imageController,
      validator: (value) {
        if (value == "") {
          return 'Please provide your profile photo';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: chooseImage,
          child: Icon(
            Icons.image,
            size: getProportionateScreenWidth(22),
            color: Colors.teal[600],
          ),
        ),
        labelText: "Profile Photo",
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: _addressController,
      validator: (value) {
        if (value.isEmpty) {
          return kAddressNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Address",
        hintText: "Delivery Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.location_on,
          size: getProportionateScreenWidth(22),
          color: Colors.teal[600],
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value.isEmpty) {
          return kPhoneNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Phone Number",
        hintText: "Phone Number",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.phone,
          size: getProportionateScreenWidth(22),
          color: Colors.teal[600],
        ),
      ),
    );
  }

  TextFormField buildPinCodeFormField() {
    return TextFormField(
      controller: _pinCodeController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your pincode';
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Phone Number",
        hintText: "Pincode",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.pin_drop,
          size: getProportionateScreenWidth(22),
          color: Colors.teal[600],
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: _lastNameController,
      decoration: InputDecoration(
          // labelText: "Last Name",
          hintText: "Last Name",
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.person,
            size: getProportionateScreenWidth(22),
            color: Colors.teal[600],
          )),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: _firstNameController,
      validator: (value) {
        if (value.isEmpty) {
          return kNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "First Name",
        hintText: "First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.person,
          size: getProportionateScreenWidth(22),
          color: Colors.teal[600],
        ),
      ),
    );
  }
}
