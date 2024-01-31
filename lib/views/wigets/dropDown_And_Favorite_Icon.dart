
import 'package:flutter/material.dart';

import 'drob_down.dart';

class DropDownAndFavoriteIcon extends StatefulWidget {
  const DropDownAndFavoriteIcon({super.key});

  @override
  State<DropDownAndFavoriteIcon> createState() =>
      _DropDownAndFavoriteIconState();
}

class _DropDownAndFavoriteIconState extends State<DropDownAndFavoriteIcon> {
  bool isFavorite = false;
  var dropdownValue = "hello";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: DropDownMenuComponent(
              items: const ['S', 'M', 'L', 'XL', 'XXL'],
              hint: 'Size',
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            isFavorite = !isFavorite;
            setState(() {});
          },
          child: SizedBox(
            height: 80,
            width: 80,
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
                  size: 30,
                )
                    : const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black54,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
