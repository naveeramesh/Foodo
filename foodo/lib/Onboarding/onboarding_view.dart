import 'package:flutter/material.dart';
import 'package:foodo/Onboarding/widgets/data.dart';
import 'package:foodo/Onboarding/widgets/pageview.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Page_View(
            items: data_list[index],
          );
        },
      ),
    );
  }
}
