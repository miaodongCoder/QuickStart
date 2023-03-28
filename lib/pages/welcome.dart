// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quickstart/common/asstes.dart';
import 'package:quickstart/pages/login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildView(context),
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        _buildTitle(),
        const SizedBox(height: 70),
        _buildImage(),
        const SizedBox(height: 70),
        _buildButton(context),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.0),
      child: Text(
        "Browse & Order All Products at Any Time",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff2B2A2A),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      AssetsImages.welcomePng,
      height: 300,
      width: double.infinity,
      fit: BoxFit.none,
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xff2B2A2A),
              ),
            ),
          ),
          Container(
            width: 139,
            height: 42,
            // 允许容器被裁减:
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                minimumSize: MaterialStateProperty.all(Size.zero),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
