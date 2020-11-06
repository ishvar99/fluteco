import 'package:fluteco/widgets/splash/RoundedButton.dart';
import 'package:flutter/material.dart';
import '../../screens/CompleteProfile.dart';
import '../../resources/size_config.dart';
import '../../resources/constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(5),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConfirmPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(40)),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(35)),
              width: double.infinity,
              height: 50,
              child: RoundedButton(
                text: "Register",
                pressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.routeName);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _confirmPasswordController,
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if ((_passwordController.text != value)) {
          return kMatchPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Confirm Password",
        hintText: "Confirm Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock_outline,
          color: Colors.teal[600],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Password",
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outlined, color: Colors.teal[600]),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Email",
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined, color: Colors.teal[600]),
      ),
    );
  }
}
