import 'dart:async';

import 'package:elite/about_page.dart';
import 'package:elite/contact_us_page.dart';
import 'package:elite/home_page.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  PageController pageController = PageController(initialPage: 0);
  PageController _pageController = PageController(initialPage: 0);

  late Timer _timer; // Timer to auto change pages
  int _currentPage = 0;
  final int _totalPages = 5; // Set total number of pages

  @override
  void dispose() {
    animationController.dispose();
    pageController.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }
  // Method to change the page
  void _changePage() {
    _currentPage = (_currentPage + 1) % _totalPages; // Cycle through pages
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Method to start the timer
  void _startPageTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _changePage();
    });
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 2.0, end: 1.0).animate(animationController);
    _startPageTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Image.asset(
                      'assets/${index + 1}.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
            Container(
              color: Colors.transparent.withAlpha(150),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: constraints.maxHeight * 0.1,
                              width: constraints.maxWidth,
                              padding:
                                  EdgeInsets.all(constraints.maxHeight * 0.01),
                              decoration: const BoxDecoration(
                                  // color: Color(0xffffffff),
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        goToPage(0);
                                      },
                                      child: const Text('Home')),
                                  TextButton(
                                      onPressed: () {
                                        goToPage(1);
                                      },
                                      child: const Text('About')),
                                  TextButton(
                                      onPressed: () {
                                        goToPage(2);
                                      },
                                      child: const Text('Contact')),
                                ],
                              ),
                            ),
                            Expanded(
                              child: PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                controller: pageController,
                                itemCount: 3,
                                itemBuilder: (context, index) => [
                                  const HomePage(),
                                  const AboutPage(),
                                  const ContactUsPage()
                                ][index],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.1,
                    width: constraints.maxWidth,
                    padding: EdgeInsets.all(constraints.maxHeight * 0.01),
                    decoration: const BoxDecoration(
                        // color: Color(0xffffffff),
                        ),
                    child: const Center(
                      child: Text(
                        'dev by E, 2024',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  void goToPage(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
