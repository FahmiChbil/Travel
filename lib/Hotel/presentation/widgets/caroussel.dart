import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  final List<dynamic>? imgs;
  final String? hotelname;

  const CarouselWithIndicatorDemo({
    super.key,
    required this.imgs,
    required this.hotelname,
  });
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        items: widget.imgs!
            .map((e) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            e,
                          ),
                          fit: BoxFit.cover)),
                ))
            .toList(),
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 1,
            viewportFraction: 1,
            height: 320.h,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Positioned(
        top: 265.h,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.hotelname!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 180.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.imgs!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.white)
                              .withOpacity(_current == entry.key ? 1 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
