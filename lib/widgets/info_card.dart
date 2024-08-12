import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/modals/infos.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({
    required this.info,
     super.key,
    });

  final Info info;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isAnimate = false;

  @override
  void initState() {
    Future.delayed(const Duration(
      milliseconds: 2000
    ), (){
      setState(() {
        isAnimate = true;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: isAnimate 
        ? CrossFadeState.showSecond 
        : CrossFadeState.showFirst,
      duration: const Duration(
        milliseconds: 575,
      ),
      alignment: Alignment.center,
      firstCurve: Curves.easeOut,
      secondCurve: Curves.easeOut,
      firstChild: Container(
        height: 260,
        width: 220,
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
      ),
      secondChild: Container(
        margin: const EdgeInsets.all(25),
        height: 260,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFBE133C),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  widget.info.iconData,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.info.title,
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.info.description,
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
