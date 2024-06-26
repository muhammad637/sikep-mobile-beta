import 'package:flutter/material.dart';
import 'package:flutter_testing/common/common.dart';
import 'package:flutter_testing/view/pages/Riwayat/Diklat/list_diklat_view.dart';
import 'package:flutter_testing/view/login.dart';
import 'package:flutter_testing/view/pages/Riwayat/Cuti/list_cuti_view.dart';
import 'package:flutter_testing/view/pages/Riwayat/Jabatan/list_jabatan_view.dart';
import 'package:flutter_testing/view/pages/Riwayat/KenaikanPangkat/list_kenaikanPangkat_view.dart';
import 'package:flutter_testing/view/pages/Riwayat/Mutasi/list_mutasi_view.dart';
import 'package:flutter_testing/view/pages/Riwayat/SIP/list_sip_view.dart';
import 'package:flutter_testing/view/pages/Riwayat/STR/list_str_view.dart';
import './../../widgets/header_component.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  HeaderComponent headerDashboard = HeaderComponent();
  _MenuActivityComponent menuComponen = const _MenuActivityComponent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: deviceWidth(context),
            height: 205 - statusBarHeight(context),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
          ),
          Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              headerDashboard,
              const SizedBox(
                height: 32,
              ),
              _InformationsComponent(),
              const SizedBox(
                height: 20,
              ),
              _MenuActivityComponent(),
              const SizedBox(
                height: 20,
              ),
             
              SizedBox(
                height: 95,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderDashboardComponent extends StatelessWidget {
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
            image: DecorationImage(
              image: AssetImage('assets/images/secondary_logo.png'),
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
              backgroundColor: MaterialStateProperty.all(maroonColor),
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
                'assets/images/ic_logout.png',
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

class _MenuActivityComponent extends StatelessWidget {
  const _MenuActivityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Riwayat",
          style: semiBlackFont.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 24,
          runSpacing: 20,
          children: [
            _MenuComponent(
              titleMenu: "Cuti",
              iconPath: 'assets/asset_sikep/cuti.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListCutiView()));
              },
            ),
            _MenuComponent(
              titleMenu: "DIklat",
              iconPath: 'assets/asset_sikep/diklat.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListDiklatView()));
              },
            ),
            _MenuComponent(
              titleMenu: "Kenaikan Pangkat",
              iconPath: 'assets/asset_sikep/kenaikan_pangkat.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListKenaikanPangkatView()));
              },
            ),
            _MenuComponent(
              titleMenu: "Mutasi",
              iconPath: 'assets/asset_sikep/mutasi.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListMutasiView()));
              },
            ),
            _MenuComponent(
              titleMenu: "STR",
              iconPath: 'assets/asset_sikep/str.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListSTRView()));
              },
            ),
            _MenuComponent(
              titleMenu: "SIP",
              iconPath: 'assets/asset_sikep/sip.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListSIPView()));
              },
            ),
            _MenuComponent(
              titleMenu: "Jabatan",
              iconPath: 'assets/asset_sikep/jabatan.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListJabatanView()));
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _MenuComponent extends StatelessWidget {
  final String titleMenu;
  final String iconPath;
  final void Function()? onTap;

  _MenuComponent(
      {required this.titleMenu, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(6),
          child: Container(
            width: deviceWidth(context) / 2 - 1.5 * defaultMargin,
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  iconPath,
                  width: 50,
                  height: 50,
                ),
                Text(
                  titleMenu,
                  style: boldWhiteFont.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InformationsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        HeaderContainer(
          HeaderName: 'dashboard',
        ),
      ],
    );
    //   }
    // );
  }
}

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
