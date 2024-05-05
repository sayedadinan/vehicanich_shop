import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
        title: Text('Requests'),
        centerTitle: true,
      ),
      body: Column(
        children: [Text('data')],
      ),
    );
  }
}
