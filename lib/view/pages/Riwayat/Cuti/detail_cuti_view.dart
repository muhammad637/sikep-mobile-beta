import 'package:flutter/material.dart';
import 'package:flutter_testing/common/common.dart';
import 'package:flutter_testing/widgets/header_component.dart';
import 'package:flutter_testing/widgets/header_container.dart';

class DetailCutiView extends StatelessWidget {
  final Map<String, String> cuti;

  const DetailCutiView({Key? key, required this.cuti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: HeaderContainer(HeaderName: "Detail Cuti"),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
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
                      height: deviceHeight(context) * 1 / 3,
                      width: defaultWidth(context) - 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'JENIS CUTI',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('${cuti['jenis']}',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Alasan Cuti:',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('${cuti['alasan']}',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),

                          Text('PERIODE CUTI',  style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('${cuti['tanggal']}',style: TextStyle(fontSize: 15),),
                          SizedBox(
                            height: 10,
                          ),

                          Text(
                              'JUMLAH HARI', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text(
                              '${calculateDays(cuti['tanggal']!)} hari', style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 27),
                        padding: EdgeInsets.all(10),
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'sisa cuti tahunan'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor),
                            ),
                            Text(
                              '12 hari'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor),
                            ),
                          ],
                        ))
                  ],
                ),
                // SizedBox(height: 95),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  int calculateDays(String date) {
    // Implement your logic to calculate days
    return 1;
  }
}
