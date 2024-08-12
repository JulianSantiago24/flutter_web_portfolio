
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/modals/items.dart';
import 'package:flutter_web_portfolio/widgets/item_card.dart';
import 'package:flutter_web_portfolio/widgets/text_reveal.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({super.key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 375),
    );
    super.initState();

    Future.delayed(const Duration( milliseconds: 1000 ), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextReveal(
          maxHeight: 70,
          controller: controller,
          child: Text(
            'Dish of the Day',
            style: GoogleFonts.quicksand(
              fontSize: 55,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          child: Center(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 70,
              spacing: 100,
              children: items.map<Widget>((item) {
                return ItemCard(
                  image: item.image,
                  title: item.title,
                  subtitle: item.subtitle,
                  description: item.description,
                  price: item.price,
                  index: items.indexOf(item),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
