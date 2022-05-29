import 'package:flutter/material.dart';
import 'package:flutter_credit_card/widgets/credit_card_back_widget.dart';
import 'package:flutter_credit_card/widgets/credit_card_front_widget.dart';
import 'dart:math' as math;

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController cardAnimationController;
  late final Animation animation;

  @override
  void initState() {
    super.initState();
    cardAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween(begin: 0, end: math.pi).animate(
      CurvedAnimation(
        parent: cardAnimationController,
        curve: Curves.ease,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credit Card"),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, .001)
                    ..rotateY(animation.value * 1.0),
                  child: animation.value > (math.pi / 2)
                      ? const CreditCardBack()
                      : const CreditCard(),
                );
              },
              // child: const CreditCard(),
              // child:
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    cardAnimationController.forward();
                  },
                  child: const Text("Virar"),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.grey, // Background Color
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    cardAnimationController.reverse();
                  },
                  child: const Text("Desvirar"),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.grey, // Background Color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
