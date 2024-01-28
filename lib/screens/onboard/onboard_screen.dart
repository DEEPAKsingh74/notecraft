import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notecraft/common/custom_button.dart';
import 'package:notecraft/common/hide_statusbar.dart';
import 'package:notecraft/common/pager_indicator.dart';
import 'package:notecraft/screens/onboard/pager_screens/first_pager.dart';
import 'package:notecraft/screens/onboard/pager_screens/second_pager.dart';
import 'package:notecraft/screens/onboard/pager_screens/third_pager.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    StatusBarUtil.hideStatusBar();
  }

  @override
  void dispose() {
    StatusBarUtil.showStatusBar();
    super.dispose();
  }

  final List<Widget> _pages = [
    const FirstPager(),
    const SecondPager(),
    const ThirdPager(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          controller: pageController,
          itemCount: _pages.length,
          onPageChanged: (int page) {
            setState(() {
              activePage = page;
            });
          },
          pageSnapping: true,
          itemBuilder: (BuildContext context, int page) {
            return _pages[page % _pages.length];
          },
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: SizedBox(
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.arrowLeft),
                      onPressed: () {
                        setState(() {
                          activePage > 0 ? activePage-- : activePage;
                          pageController.animateToPage(
                            activePage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                    ),
                    (activePage < _pages.length - 1)
                        ? Row(
                            children: List.generate(
                              _pages.length,
                              (index) =>
                                  PagerIndicator(isActive: index == activePage),
                            ),
                          )
                        : SizedBox(
                            width: 200,
                            child: CustomButtom(
                              title: 'Get Started',
                              callback: () {
                                context.go('/login');
                              },
                            )),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.circleRight),
                      onPressed: () {
                        setState(() {
                          activePage < _pages.length - 1
                              ? activePage++
                              : activePage;
                          pageController.animateToPage(
                            activePage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                    )
                  ],
                ),
              )),
        )
      ],
    ));
  }
}
