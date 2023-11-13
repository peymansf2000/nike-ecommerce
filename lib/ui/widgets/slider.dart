import 'package:flutter/material.dart';
import 'package:nike_store/data/banner.dart';
import 'package:nike_store/ui/widgets/image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({
    super.key,
    required this.banners,
  });
  final List<BannerEntity> banners;
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: banners.length,
            itemBuilder: (context, index) => _Slide(banner: banners[index]),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: banners.length,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                      spacing: 4.0,
                      radius: 4.0,
                      dotWidth: 18.0,
                      dotHeight: 3.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey.shade400,
                      activeDotColor:
                          Theme.of(context).colorScheme.onBackground)),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.banner,
  });
  final BannerEntity banner;

  @override
  Widget build(BuildContext context) {
    return ImageLoadingService(
      imageUrl: banner.imageUrl,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
