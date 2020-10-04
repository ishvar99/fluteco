import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'OfferBanner.dart';
import 'PaginationDots.dart';

class BannerCarousel extends StatefulWidget {
  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;
  List<Widget> _bannerList = [
    OfferBanner(),
    OfferBanner(),
    OfferBanner(),
    OfferBanner(),
    OfferBanner(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            aspectRatio: 1.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _bannerList.map((card) {
            return Builder(builder: (BuildContext context) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  card,
                  Positioned(
                    top: getProportionateScreenWidth(150),
                    child: Center(
                      child: PaginationDots(
                        bannerList: _bannerList,
                        currentIndex: _currentIndex,
                      ),
                    ),
                  ),
                ],
              );
            });
          }).toList(),
        ),
      ],
    );
  }
}
