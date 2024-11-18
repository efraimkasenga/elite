import 'package:elite/calendar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 2.0, end: 1.0).animate(animationController);
    super.initState();
  }
  DateTime selectedDate = DateTime.now();
  void selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context ,constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.01),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              SizedBox(
                width: 600,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      'Elite Peak Luxury Lodge',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    const Text(
                        'Free wifi breakfast and lunch. all services are provided here, near southern empire kitchen and barFree wifi breakfast and lunch. all services are provided here, near southern empire kitchen and barFree wifi breakfast and lunch. all services are provided here, near southern empire kitchen and bar')
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 30),
                //height: size.width * 0.80,
                width: 400,
                padding: const EdgeInsets.all(10.0),
                
                child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return AnimatedSize(
                          duration: animationController
                              .duration!,
                          child: animationController
                                  .isCompleted
                              ? MaterialButton(
                                  shape:
                                      const CircleBorder(),
                                  onPressed:
                                      animationController
                                          .reverse,
                                  child: Container(
                                    width: constraints
                                            .maxWidth *
                                        0.3,
                                    height: constraints
                                            .maxHeight *
                                        0.3,
                                    margin:
                                        const EdgeInsets
                                            .all(10.0),
                                    alignment:
                                        Alignment.center,
                                    decoration:
                                        const BoxDecoration(
                                            gradient:
                                                RadialGradient(
                                              center: Alignment(
                                                  -0.54,
                                                  -1.0),
                                              radius:
                                                  1.137,
                                              colors: [
                                                Color(
                                                    0xffebef76),
                                                Color(
                                                    0xffd2d580),
                                                Color(
                                                    0xffd6d098)
                                              ],
                                              stops: [
                                                0.0,
                                                0.485,
                                                1.0
                                              ],
                                            ),
                                            shape: BoxShape
                                                .circle),
                                    child: Column(
                                      children: [
                                        Text(
                                          selectedDate.day
                                              .toString(),
                                          style:
                                              TextStyle(
                                            fontFamily:
                                                'Montserrat',
                                            fontWeight:
                                                FontWeight
                                                    .w600,
                                            fontSize:
                                                constraints
                                                        .maxHeight *
                                                    0.15,
                                            color: const Color(
                                                0xff000000),
                                            height:
                                                1.3333333333333333,
                                          ),
                                        ),
                                        Text(selectedDate
                                            .month
                                            .toString())
                                      ],
                                    ),
                                  ),
                                )
                              : Calendar(
                                  selectedDate:
                                      selectedDate));
                    }),
              ),
            ],
          ),
        );
      }
    )
                        ;
  }
}
