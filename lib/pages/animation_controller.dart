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

  // late AnimationController pruebaAnimationController;
  // late Animation pruebaAnimation ;

  late AnimationController _turnController;
  late Animation<double> _turnAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pruebaAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    // pruebaAnimation = ColorTween(begin: Colors.pinkAccent, end: Colors.indigo,).animate(pruebaAnimationController);

    _turnController = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000))..repeat(reverse: true);
    _turnAnimation = CurvedAnimation(parent: _turnController, curve: Curves.bounceOut);


    // pruebaAnimationController.addListener(() {
    //   //print(pruebaAnimationController.value);
    //   // print(pruebaAnimation.value);
    // });

    // _turnController.forward();
    //
    // _turnController.addListener(() {
    //   print(_turnAnimation.value);
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: AnimatedBuilder(
        //   animation: pruebaAnimation,
        //   builder: (BuildContext context, _){
        //     print(pruebaAnimation.value);
        //     return IconButton(
        //       onPressed: () {
        //         pruebaAnimationController.forward();
        //       },
        //       icon: Icon(
        //         Icons.star,
        //         size: 34.0,
        //         color: pruebaAnimation.value,
        //       ),
        //     );
        //   },
        // ),
        child: RotationTransition(
          turns: _turnAnimation,
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
