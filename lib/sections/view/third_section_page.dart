import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/modals/infos.dart';
import 'package:flutter_web_portfolio/widgets/info_card.dart';
import 'package:flutter_web_portfolio/widgets/text_reveal.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({super.key});

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> 
  with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 375)
    );
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 1000),
      (){
        controller.forward();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      color: const Color(0xFFBE133C).withOpacity(0.1),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextReveal(
            controller: controller,
            maxHeight: 55,
            child: Text(
              'How It works', 
              style: GoogleFonts.quicksand(
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: infos.map<Widget>(
              (info) => InfoCard(info:  info),
            ).toList(),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
