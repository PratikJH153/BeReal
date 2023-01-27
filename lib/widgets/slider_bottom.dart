import 'package:flutter/material.dart';

class SliderBottom extends StatelessWidget {
  final int pages;
  final int currentPage;
  const SliderBottom({
    required this.pages,
    required this.currentPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages,
        (index) => Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.white : Colors.white30,
          ),
          margin: const EdgeInsets.only(right: 6),
        ),
      ),
    );
  }
}
