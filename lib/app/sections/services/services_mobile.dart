part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We use .h from Sizer instead of MediaQuery for consistency across devices
    return Column(
      children: [
        const CustomSectionHeading(text: '\nWhat I can do?'),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: servicesSubHeading),
        ),
        Space.y(5.w)!,
        CarouselSlider.builder(
          itemCount: servicesUtils.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.w),
            child: _ServiceCard(service: servicesUtils[i]),
          ),
          options: CarouselOptions(
            viewportFraction: 0.65, // Adjusted slightly for better mobile fit
            height: 45.h,           // Changed from 300 to 45% of screen height
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        )
      ],
    );
  }
}