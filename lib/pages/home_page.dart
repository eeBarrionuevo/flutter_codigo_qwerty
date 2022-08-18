import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qwerty/pages/animation_controller.dart';
import 'package:qwerty/pages/hero_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flagAlign = true;
  int flagContainer = 100;
  int flagContainer2 = 100;

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
                  height: 100,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HeroPage()));
                },
                child: Text(
                  "Hero",
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),

              GestureDetector(
                onTap: () {
                  flagAlign = !flagAlign;
                  setState(() {});
                },
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.greenAccent,
                  child: AnimatedAlign(
                    alignment:
                        flagAlign ? Alignment.bottomRight : Alignment.topLeft,
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 2),
                    child: Image.asset(
                      'assets/images/batman.jpg',
                      height: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),

              GestureDetector(
                onTap: () {
                  flagContainer = 30 + Random().nextInt(300);
                  flagContainer2 = 30 + Random().nextInt(300);
                  setState(() {});
                },
                child: AnimatedContainer(
                  height: flagContainer.toDouble(),
                  width: flagContainer2.toDouble(),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius:
                        BorderRadius.circular(flagContainer.toDouble()),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),

              const AnimatedCrossFade(
                firstChild: FlutterLogo(
                  size: 200,
                  style: FlutterLogoStyle.horizontal,
                ),
                secondChild: FlutterLogo(
                  size: 200,
                  style: FlutterLogoStyle.stacked,
                ),
                crossFadeState: CrossFadeState.showSecond,
                duration: Duration(seconds: 2),
              ),

              const SizedBox(
                height: 30.0,
              ),

              const AnimatedDefaultTextStyle(
                child: Text("Hola"),
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 14.0,
                ),
                duration: Duration(
                  seconds: 2,
                ),
              ),

              const SizedBox(
                height: 30.0,
              ),

              AnimatedOpacity(
                opacity: 1,
                duration: Duration(seconds: 3),
                child: Image.asset('assets/images/batman.jpg'),
              ),

              const SizedBox(
                height: 30.0,
              ),

              AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 1200),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),

              AnimatedPhysicalModel(
                child: Container(
                  width: 200,
                  height: 200,
                  child: FlutterLogo(),
                ),
                shape: BoxShape.rectangle,
                elevation: 0,
                color: Colors.white,
                shadowColor: Colors.indigo,
                duration: const Duration(seconds: 2),
              ),

              const SizedBox(
                height: 30.0,
              ),

              Container(
                height: 300,
                width: 300,
                color: Colors.redAccent,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedPositioned(
                      bottom: 50,
                      right: 50,
                      child: Container(
                        color: Colors.yellow,
                        child: Text("Hola"),
                      ),
                      duration: Duration(milliseconds: 1500),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30.0,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AnimationControllerPage()));
                },
                child: Text("Animation Controller"),
              ),

              const SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
