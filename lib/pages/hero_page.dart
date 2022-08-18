import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: [
              // Hero
              const SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: "batman1",
                child: Image.asset(
                  'assets/images/batman.jpg',
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
