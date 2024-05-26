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
                SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black26),
                      height: deviceHeight(context) * 1 / 2,
                      width: defaultWidth(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text('Jenis Cuti: ${cuti['jenis']}'),
                          Text('Alasan Cuti: ${cuti['alasan']}'),
                          Text('Periode Cuti: ${cuti['tanggal']}'),
                          Text(
                              'Jumlah Hari: ${calculateDays(cuti['tanggal']!)}'),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        width: defaultWidth(context),
                        decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'sisa cuti tahunan'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '12 hari'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.abc),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ))
                  ],
                ),
                SizedBox(height: 95),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int calculateDays(String date) {
    // Implement your logic to calculate days
    return 1;
  }
}
