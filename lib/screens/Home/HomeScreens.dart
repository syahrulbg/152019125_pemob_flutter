import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toko/components/Home/Homeform.dart';
import 'package:toko/size_config.dart';
import 'package:toko/components/Login/LoginComponents.dart';

class HomeScreens extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: BelajarNavBar(),
    );
  }
}
