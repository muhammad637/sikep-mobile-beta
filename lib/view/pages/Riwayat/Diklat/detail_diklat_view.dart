import 'package:flutter/material.dart';
import '../../../../common/common.dart';
import '../../../../widgets/header_component.dart';
import '../../../../widgets/header_container.dart';

class DetailDiklatView extends StatefulWidget {
  final Map<String, String> diklat;

  // const DetailDiklatView({super.key});
  const DetailDiklatView({Key? key, required this.diklat}) : super(key: key);

  @override
  State<DetailDiklatView> createState() => _DetailDiklatViewState();
}

class _DetailDiklatViewState extends State<DetailDiklatView> {
  int calculateDays(String date) {
    // Implement your logic to calculate days
    return 1;
  }

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
                  child: HeaderContainer(HeaderName: "Detail diklat"),
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
                        height: deviceHeight(context) * 2 / 3,
                        width: defaultWidth(context) - 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'TIPE',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.diklat['tipe']}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'JABATAN SEBELUMNYA',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.diklat['jabatan_sebelumnya']}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'JABATAN BARU',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${widget.diklat['jabatan_baru']}',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('RUANGAN SEBELUMNYA',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              '${widget.diklat['ruangan_sebelumnya']!}',
                              style: TextStyle(fontSize: 15),
                            ),
                              SizedBox(
                              height: 10,
                            ),
                            Text('RUANGAN BARU',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              '${widget.diklat['ruangan_baru']!}',
                              style: TextStyle(fontSize: 15),
                            ),
                             SizedBox(
                              height: 10,
                            ),
                            Text('TANGGAL BERLAKU',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              '${widget.diklat['tanggal_berlaku']!}',
                              style: TextStyle(fontSize: 15),
                            ),
                             SizedBox(
                              height: 10,
                            ),
                            Text('NO SK',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              '${widget.diklat['no_sk']!}',
                              style: TextStyle(fontSize: 15),
                            ),
                             SizedBox(
                              height: 10,
                            ),
                            Text('TANGGAL SK',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              '${widget.diklat['tanggal_sk']!}',
                              style: TextStyle(fontSize: 15),
                            ),
                      
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
       floatingActionButton: FloatingActionButton.small(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: whiteColor,
        ),
      ),
    );
  }
}
