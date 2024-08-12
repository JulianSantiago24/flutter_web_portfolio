
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/sections/view/first_section_page.dart';
import 'package:flutter_web_portfolio/sections/view/fourth_section_page.dart';
import 'package:flutter_web_portfolio/sections/view/second_section_page.dart';
import 'package:flutter_web_portfolio/sections/view/third_section_page.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          //SizedBox(height: 100),
          FirstSection(),
          SizedBox(height: 100),
          SecondSection(),
          SizedBox(height: 100),
          ThirdSection(),
          SizedBox(height: 100),
          FourthSection(),
        ],
      ),
    );
  }
}
