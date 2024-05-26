import '../common/common.dart';
import 'package:flutter/material.dart';
import '../view/login.dart';

class HeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: defaultMargin,
        ),
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // warna bayangan
                spreadRadius: 1, // seberapa jauh bayangan menyebar
                blurRadius: 3, // seberapa kabur bayangan
                offset: Offset(0, 1), // posisi bayangan
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(5), // jarak antara gambar dan border
              color: Colors.white, // warna latar belakang di sekitar gambar
              child: Image.asset('assets/asset_sikep/logo.jpg'),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sikep Mobile",
              style: boldWhiteFont.copyWith(fontSize: 22),
            ),
            Text(
              "Sistem Informasi Kepegawaian Mobile",
              style: regularWhiteFont.copyWith(fontSize: 11),
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Container(
          width: 38,
          height: 38,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor),
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (route) => false);
            },
            child: Ink.image(
              image: AssetImage(
                'assets/asset_sikep/logout.png',
              ),
              width: 18,
              height: 18,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                      (route) => false);
                },
              ),
            ),
          ),
        ),
        SizedBox(
          width: defaultMargin,
        ),
      ],
    );
  }
}
