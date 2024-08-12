import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_portfolio/widgets/text_reveal.dart';
import 'package:google_fonts/google_fonts.dart';

class FourthSection extends StatefulWidget {
  const FourthSection ({super.key});

  @override
  State<FourthSection> createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subtextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
      reverseDuration: const Duration(milliseconds: 375),
    );

    imageRevealAnimation = Tween(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0, 0.40, curve: Curves.easeOut,
        ),
      ),
    );

    textRevealAnimation = Tween(begin: 70.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.30, 0.60, curve: Curves.easeOut,
        ),
      ),
    );

    subtextOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.50, 0.80, curve: Curves.easeOut,
        ),
      ),
    );

    subImageRevealAnimation = Tween(begin: 0.0, end: 90.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.70, 1.0, curve: Curves.easeOut,
        ),
      ),
    );

    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), (){
      controller.forward();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.1,
          ),
          Flexible(
            child: Stack(
              children: [                
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(1),
                  child: Image.network(
                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                    fit: BoxFit.cover,  
                  ),
                ),
                AnimatedBuilder(
                  animation: imageRevealAnimation,
                  builder: (context, child) {
                    return Container(
                      height: imageRevealAnimation.value,
                      width: double.infinity,
                      color: Colors.white,
                      alignment: const Alignment(0, -1),
                    );
                  },
                ),
              ], 
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.1,
          ),
          AnimatedBuilder(
            animation: textRevealAnimation,
            builder: (context,child) {
              return Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextReveal(
                      maxHeight: 55.0,
                      controller: controller,
                      child: Text('Order your', 
                        style: GoogleFonts.quicksand(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                        ),                
                      ),
                    ),
                    TextReveal(
                      maxHeight: 55.0,
                      controller: controller,
                      child: Text('Favorite Food', 
                        style: GoogleFonts.quicksand(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                        ),                
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AnimatedBuilder(
                      animation: subtextOpacityAnimation,
                      builder: (context, child) {
                        return FadeTransition(
                          opacity: subtextOpacityAnimation ,
                          child: Text('Non cupidatat aute reprehenderit ea sint pariatur cupidatat in labore voluptate enim anim adipisicing',
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedBuilder(
                      animation: subtextOpacityAnimation,
                      builder: (context,child) {
                        return FadeTransition(
                          opacity: subtextOpacityAnimation,
                          child: Text('Non cupidatat aute reprehenderit ea sint pariatur cupidatat in labore voluptate enim anim adipisicing',
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 90,
                      alignment: const Alignment(0.0, -1.0),
                      child: AnimatedBuilder(
                        animation: subImageRevealAnimation,
                        builder: (context, child) {
                          return SizedBox(
                            height: subImageRevealAnimation.value,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Image.network(
                                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.1,
          )       
        ],
      ),
    );
  }
}
