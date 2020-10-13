import '../../resources/constants.dart';
import 'package:flutter/material.dart';

class PaginationDots extends StatelessWidget {
  final bannerList;
  final currentIndex;
  PaginationDots({this.bannerList, this.currentIndex});

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: map<Widget>(bannerList, (index, url) {
        return AnimatedContainer(
          duration: kAnimationDuration,
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.white : Colors.grey,
          ),
        );
      }),
    );
  }
}
