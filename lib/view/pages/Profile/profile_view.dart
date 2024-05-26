// import "dart:ffi";

import "package:faker/faker.dart";
import "package:flutter/material.dart";
import 'package:flutter_testing/models/user.dart';
import 'package:flutter_testing/view/pages/Profile/detail_profile_view.dart';
import "package:provider/single_child_widget.dart";
import '../../../widgets/header_component.dart';
import '../../../widgets/header_container.dart';
import '../Riwayat/Mutasi/detail_mutasi_view.dart';
import '../../../common/common.dart';

class ProfileView extends StatefulWidget {
  final User user;
  const ProfileView({super.key, required this.user});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late HeaderComponent headerComponent;
  late HeaderContainer headerContainer;

  // List<String,String> user = [];

  @override
  void initState() {
    super.initState();
    headerComponent = HeaderComponent();
    headerContainer = HeaderContainer(HeaderName: "PROFILE");
    // You can call your API here
  }

  void fetchProfile() {}

  @override
  Widget build(BuildContext context) {
    void navigateToDetail(User user) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailProfileView(user: user),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: deviceWidth(context),
              height: 205 - statusBarHeight(context),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                HeaderComponent(),
                SizedBox(height: 62),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: HeaderContainer(HeaderName: "DETAIL JABATAN"),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.5), // Warna bayangan dan opasitasnya
                              spreadRadius: 2, // Penyebaran bayangan
                              blurRadius: 7, // Ketajaman bayangan
                              offset: Offset(0,
                                  3), // Perpindahan bayangan (horizontal, vertical)
                            ),
                          ],
                        ),
                        height: deviceHeight(context) * 1 / 2,
                        width: defaultWidth(context) - 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage("assets/asset_sikep/akun.png"),
                              ),
                            ),
                            SizedBox(height: 50),
                            Text(
                              'NAMA',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.namaLengkap!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'NIK',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.nik!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'NIP',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.nipNippk!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'STATUS TENAGA',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.statusTenaga!} ',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(
                              height: 20,
                            ),
                            
                           Center(
                              child: SizedBox(
                                width: double
                                    .infinity, // Lebar mengikuti lebar layar
                                child: ElevatedButton(
                                  onPressed: () =>
                                      navigateToDetail(widget.user),
                                  child: Text(
                                    "Detail",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => primaryColor),
                                    padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                    ),
                                    shape: MaterialStateProperty.resolveWith(
                                      (states) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5), // Radius kotak
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 95),
              ],
            ),
          ],
        ),
      ),
    );
 
  }
}
