
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_signup/intro_screen/intro_page_1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_screen/home_page.dart';
import 'intro_screen/intro_page_2.dart';
import 'intro_screen/intro_page_3.dart';

class OnBardingScreen extends StatefulWidget {
  const OnBardingScreen({super.key});

  @override
  State<OnBardingScreen> createState() => _OnBardingScreenState();
}

class _OnBardingScreenState extends State<OnBardingScreen> {
  //Controller to keep track of which page we're on
  PageController _controller = PageController();

  //Keep track of if we are the last page or not
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Page View
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index==2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
        ),
          // page - indicator
         Container(
           alignment: Alignment(0,0.75),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               //Skip
              GestureDetector(
                onTap:(){
                  _controller.jumpToPage(2);
                },
                child: Text('Skip'),
              ),
               //Page indication
               SmoothPageIndicator(controller: _controller, count: 3, effect: ExpandingDotsEffect(),),
               //Next Page or Done
               isLastPage ?
               GestureDetector(
                 onTap:(){
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context) {
                       return HomePage();
                     },
                    ),
                   );
                 },
                 child: Text('Done'),
               ) :
               GestureDetector(
                 onTap:(){
                   _controller.nextPage(
                     duration: Duration(milliseconds: 500),
                     curve: Curves.easeIn,
                   );
                 },
                 child: Text('Next'),
               )
               ,
             ],
           )
         )
        ]
      ),
    );
  }
}
