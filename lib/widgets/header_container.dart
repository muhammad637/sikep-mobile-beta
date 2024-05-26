import 'package:flutter/material.dart';
import '../common/common.dart';
class HeaderContainer extends StatelessWidget {
  String? HeaderName;
  double fontSize = 30;
  HeaderContainer({required this.HeaderName, this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: defaultWidth(context),
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEEEEEE),
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${HeaderName}'.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Selamat Beraktivitas',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ));
  }
}
