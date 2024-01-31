import 'package:ecommerce/utilites/assets.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(
          AppAssets.topBannerHomePageAsset,
          width: double.infinity,
          height: size.height * 0.3,
          fit: BoxFit.cover,
        ),
        Opacity(
            opacity: 0.3,
            child: Container(
              width: double.infinity,
              height: size.height * 0.3,
              color: Colors.black,
            )),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            "Street Clothes",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
