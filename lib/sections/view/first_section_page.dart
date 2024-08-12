
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widgets/text_reveal.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> 
    with TickerProviderStateMixin{
  
    late AnimationController controller;
    late Animation<double> textRevealAnimation;
    late Animation<double> textOpacityAnimation;
    late Animation<double> descriptionAnimation;
    late Animation<double> smallImageRevealAnimation;
    late Animation<double> smallImageOpacityAnimation;
    late Animation<double> navBarOpacityAnimation;

     @override
      void initState() {
        controller = AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 1700,
          ),
          reverseDuration: const Duration(
            milliseconds: 375
          )
        );

        textRevealAnimation = Tween<double>(begin: 100.0, end: 0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.3, curve: Curves.easeOut),
          ),
        );
        textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.3, curve: Curves.easeOut),
          ),
        );
        descriptionAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeOut),
          ),
        );
        smallImageRevealAnimation = Tween<double>(begin: 180, end: 0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.7, curve: Curves.easeOut),
          ),
        );
        smallImageOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
          ),
        );
        navBarOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 1, curve: Curves.easeOut),
          ),
        );
        super.initState();

        Future.delayed(const Duration(milliseconds: 1000), (){
          controller.forward();
        });
      }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100),
      height: 920,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: textOpacityAnimation,
                      child: Padding(padding: const EdgeInsets.only(top: 20),
                      child: Text(
                          'Logo',
                          style: GoogleFonts.montserrat(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextReveal(
                              maxHeight: 90,
                              controller: controller,
                              textOpacityAnimation: textOpacityAnimation,
                              textRevealAnimation: textRevealAnimation,
                              child: Text(
                                'Julian Jaramillo',
                                style: GoogleFonts.quicksand(
                                  fontSize: 65,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            TextReveal(
                              maxHeight: 90,
                              controller: controller,
                              textOpacityAnimation: textOpacityAnimation,
                              textRevealAnimation: textRevealAnimation,
                              child: Text(
                                'Flutter Developer',
                                style: GoogleFonts.quicksand(
                                  fontSize: 65,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FadeTransition(
                              opacity: descriptionAnimation,
                              child: Text(
                                  'Do aliquip culpa ipsum pariatur voluptate officia et ea sint eu elit voluptate culpa laborum. Sit ullamco enim sit exercitation magna cupidatat Lorem ex magna mollit quis. Lorem officia id laboris aliquip enim laboris deserunt incididunt qui.',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                            ),
                            
                            const SizedBox(
                              height: 50,
                            ),
                            FadeTransition(
                              opacity: descriptionAnimation,
                              child: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 15,
                                      color: Colors.black12,
                                    ),
                                  ],
                                 ),
                                child: SizeTransition(
                                  sizeFactor: descriptionAnimation,
                                  axis: Axis.horizontal,
                                  axisAlignment: -1,
                                  child: Row(
                                    children: [
                                      const Flexible(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            contentPadding: EdgeInsets.all(12),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                       ),
                                      ),
                                      Container(
                                        height: 49,
                                        width: 49,
                                        color: Colors.red,
                                        child: const Icon(Icons.search),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Flexible(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 120,
                                    width: 180,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: Image.network(
                                            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                                            fit: BoxFit.cover,
                                            width: 180,     
                                          ),
                                        ),
                                        Container(
                                          height: 120,
                                          width: smallImageRevealAnimation.value,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    child: FadeTransition(
                                      opacity: smallImageOpacityAnimation,
                                      child: Text(
                                        'In elit duis enim velit officia laborum id veniam sunt. Incididunt laborum exercitation aliquip exercitation voluptate esse Lorem. Fugiat cillum ullamco reprehenderit quis anim. Occaecat amet enim eu laborum minim. In ullamco ad ipsum quis dolore consequat eiusmod. Duis dolore ipsum elit excepteur do exercitation sunt. Nulla excepteur velit pariatur anim qui exercitation voluptate sunt.', style: GoogleFonts.quicksand(
                                          fontSize: 16,
                                          height: 1.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),                     
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 150,
              ),
              const Expanded(
                child: FirstPageImage(),
              ),
              SizedBox(
                width: 100,
                height: 500,
                child: FadeTransition(
                  opacity: navBarOpacityAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 80,
                        child: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.menu),
                          color: Colors.black,                    
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: ['Home','About','Offers','Accounts']
                            .map<Widget>((title) {
                          return RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              title,
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );       
  }
}


class FirstPageImage extends StatefulWidget {
  const FirstPageImage({super.key});

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage> 
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 775,
      ),
    );
    _animation = Tween<double>(begin: 920, end: 0).animate(
      CurvedAnimation(
        parent: _controller, curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://raw.githubusercontent.com/kevmoo/dart_side/master/Dash%20Dart%20PNG%20%20-%20white.png',
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          Future.delayed(const Duration(milliseconds: 500),() {
            if(_controller.isDismissed){
              _controller.forward();
            }
          });
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children:[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    height: 920,
                    width: double.infinity,
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: _animation.value,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
            child: child,
          );
        } 

        return const SizedBox();
      },    
    );
  }
}
