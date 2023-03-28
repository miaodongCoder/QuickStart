// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quickstart/common/app_colors.dart';
import 'package:quickstart/common/asstes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final duration = 10;
  int number = 0;
  // 倒计时函数:
  Future<void> _countdown() async {
    number = duration;
    for (var i = 0; i <= duration; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (mounted == true) {
          setState(() {
            number = duration - i;
          });
        }
      });

      if (number == 0) {
        print("倒计时结束!");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _countdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: _buildView(context),
    );
  }

  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo(),
          const SizedBox(
            height: 24,
          ),
          _buildTitle("Online Market"),
          const SizedBox(
            height: 27,
          ),
          _buildCountDownText(number > 0 ? "$number" : "Welcome!"),
        ],
      ),
    );
  }

  // 图片Logo:
  Stack _buildLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        Image.asset(
          AssetsImages.logoPng,
          width: 84,
          height: 80.45,
        )
      ],
    );
  }

  // 标题:
  Text _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        // fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 22 / 19,
      ),
    );
  }

  // 计数器:
  Text _buildCountDownText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 22 / 19),
    );
  }
}
