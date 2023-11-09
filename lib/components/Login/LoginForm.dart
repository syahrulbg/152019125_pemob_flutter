import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toko/components/Home/Homeform.dart';
import 'package:toko/components/default_button_custome_color.dart';
import 'package:toko/screens/Home/HomeScreens.dart';
import 'package:toko/size_config.dart';
import 'package:toko/utils/constants.dart';

import '../Custom_surfix_icon.dart';

class SignInform extends StatefulWidget {
  @override
  _SignInform createState() => _SignInform();
}

class _SignInform extends State<SignInform> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String username = 'syahrul';
  late String password = '1234';

  bool visible = false;

  _checkLogin(String? valueUser, String? valuePass) async {
    setState(() {
      visible = true;
    });

    String textUser = valueUser!;
    String textPass = valuePass!;

    if (username == textUser && password == textPass) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BelajarNavBar()));
    } else {
      _showAlertDialog(context, 'Username atau Password Salah');
    }
  }

  _showAlertDialog(BuildContext context, String valueError) {
    Widget okButton = FloatingActionButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('OK'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Error'),
      content: Text(valueError),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildUserName(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPassword(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButtonCustomeColor(
            color: Color.fromARGB(255, 58, 58, 58),
            text: "MASUK",
            press: () {
              _checkLogin(_usernameController.text, _passwordController.text);
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: "Nama",
          hintText: "Masukkan Nama",
          labelStyle: TextStyle(
              color: focusNode.hasFocus
                  ? mSubtitleColor
                  : Color.fromARGB(255, 105, 105, 105)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: "No KTP",
          hintText: "Masukkan No KTP",
          labelStyle: TextStyle(
              color: focusNode.hasFocus
                  ? mSubtitleColor
                  : Color.fromARGB(255, 105, 105, 105)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }
}
