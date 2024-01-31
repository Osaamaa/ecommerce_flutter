import 'package:flutter/material.dart';

class FavoriteBottom extends StatefulWidget {
  const FavoriteBottom({super.key});

  @override
  State<FavoriteBottom> createState() => _FavoriteBottomState();
}

class _FavoriteBottomState extends State<FavoriteBottom> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Positioned(
      left: size.width * .25,
      bottom: 120,
      child: InkWell(
        onTap: () {
          isFavorite = !isFavorite;
          setState(() {});
        },
        child: SizedBox(
          height: 70,
          width: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.black54,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black54,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
