
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatefulWidget {

  const ItemCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.index,
    super.key,
  });
  final String title;
  final String image;
  final String subtitle;
  final String description;
  final String price;
  final int index;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<double> priceOpacity;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    imageReveal = Tween<double>(begin: 0, end: 170).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    imageOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    headingTextOpacity = Tween<double>(begin: 0, end: 170).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeOut),
      ),
    );

    subTextOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.6, curve: Curves.easeOut),
      ),
    );

    descriptionOpacity = Tween<double>(begin: 0, end: 170).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
      ),
    );

    priceOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1, curve: Curves.easeOut),
      ),
    );

    Future.delayed(const Duration( milliseconds: 1000), () {
      controller.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 320,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: FadeTransition(
                    opacity: imageOpacity,
                    child: SizedBox(
                      height: imageReveal.value,
                      width: imageReveal.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.medium,
                          scale: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: headingTextOpacity,
                      child: Text(
                        widget.title,
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: subTextOpacity,
                      child: Text(
                        widget.subtitle,
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeTransition(
                      opacity: descriptionOpacity,
                      child: Text(
                        widget.description,
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeTransition(
                      opacity: priceOpacity,
                      child: Text(
                        widget.price,
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
