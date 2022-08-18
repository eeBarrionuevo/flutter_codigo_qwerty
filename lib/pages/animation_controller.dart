import 'package:flutter/material.dart';

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({Key? key}) : super(key: key);

  @override
  State<AnimationControllerPage> createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage> with SingleTickerProviderStateMixin {

  //AnimationController
  //Animation

  late AnimationController pruebaAnimationController;
  late Animation pruebaAnimation ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pruebaAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    pruebaAnimation = ColorTween(begin: Colors.pinkAccent, end: Colors.indigo,).animate(pruebaAnimationController);



    pruebaAnimationController.addListener(() {
      //print(pruebaAnimationController.value);
      // print(pruebaAnimation.value);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: pruebaAnimation,
          builder: (BuildContext context, _){
            print(pruebaAnimation.value);
            return IconButton(
              onPressed: () {
                pruebaAnimationController.forward();
              },
              icon: Icon(
                Icons.star,
                size: 34.0,
                color: pruebaAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
