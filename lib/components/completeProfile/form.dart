import 'package:fluteco/models/User.dart';
import 'package:fluteco/services/FirebaseAuthHelper.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';
import 'package:fluteco/widgets/splash/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/authentication/formError.dart';
import '../../screens/OTP.dart';
import '../../resources/constants.dart';
import '../../resources/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  FireBaseAuthHelper _helper = FireBaseAuthHelper();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<AppUser>(context, listen: false).uid;
    return Padding(
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
            SizedBox(height: getProportionateScreenHeight(45)),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(35)),
              width: double.infinity,
              height: 50,
              child: RoundedButton(
                text: "Continue",
                pressed: () async {
                  if (_formKey.currentState.validate()) {
                    await _helper.updateProfile(
                        uid,
                        _firstNameController.text,
                        _lastNameController.text,
                        int.parse(_phoneNumberController.text),
                        _addressController.text);
                    Navigator.pushNamed(context, OtpScreen.routeName);
                  }
                },
              ),
            ),
          ],
        ),
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
