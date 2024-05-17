import 'package:first_app/common/menudrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness App"),
        backgroundColor: Colors.orange,
      ),
      drawer: const MenuDrawer(),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: BubbleAnimation(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleAnimation extends StatefulWidget {
  @override
  _BubbleAnimationState createState() => _BubbleAnimationState();
}

class _BubbleAnimationState extends State<BubbleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bubbleScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _bubbleScaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _bubbleScaleAnimation.value,
          child: Text(
            "Stay Fit and have\na Healthy Life",
            style: TextStyle(
              fontSize: 30,
              color: Colors.orange,
            ),
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }
}

