import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currency;
  final String value;
  final String unit;
  final IconData currencyIcon;
  final bool inverted;
  final double order;

  const CurrencyCard({
    super.key,
    required this.currencyIcon,
    required this.currency,
    required this.value,
    required this.unit,
    required this.inverted,
    required this.order,
  });

  // text colors
  final _blackColor = Colors.black;
  final _whiteColor = Colors.white;

  // background colors
  final _blackBackground = const Color(0xFF1F2123);
  final _whiteBackground = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -20 * order),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: inverted ? _whiteBackground : _blackBackground,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                      color: inverted ? _blackColor : _whiteColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        value,
                        style: TextStyle(
                          color: inverted ? _blackColor : _whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        unit,
                        style: TextStyle(
                          color: inverted ? _blackColor : _whiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                  scale: 2.2,
                  child: Transform.translate(
                    offset: const Offset(-5, 12),
                    child: Icon(
                      currencyIcon,
                      color: inverted ? _blackColor : _whiteColor,
                      size: 88,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
