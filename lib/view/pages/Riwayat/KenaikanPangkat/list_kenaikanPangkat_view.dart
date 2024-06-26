import "dart:ffi";

import "package:faker/faker.dart";
import "package:flutter/material.dart";
import "package:provider/single_child_widget.dart";
import '../../../../widgets/header_component.dart';
import '../../../../widgets/header_container.dart';
import 'detail_kenaikanPangkat_view.dart';
import '../../../../common/common.dart';

class ListKenaikanPangkatView extends StatefulWidget {
  const ListKenaikanPangkatView({super.key});

  @override
  State<ListKenaikanPangkatView> createState() => _ListKenaikanPangkatViewState();
}

class _ListKenaikanPangkatViewState extends State<ListKenaikanPangkatView> {
  late HeaderComponent headerComponent;
  late HeaderContainer headerContainer;

  List<Map<String, String>> KenaikanPangkatList = [];

  @override
  void initState() {
    super.initState();
    headerComponent = HeaderComponent();
    headerContainer = HeaderContainer(HeaderName: "Kenaikan Pangkat");
    // You can call your API here
    fetchDiklatList();
  }

  void fetchDiklatList() {
    // Simulating API call
    setState(() {
      KenaikanPangkatList = List.generate(
        10,
        (index) => {
          'pangkat/gol_sebelumnya': 'Pangkat ${index + 1}',
          'pangkat/gol_baru': 'pangkat ${index + 2}',
          'tmt_terbit': '${DateTime.now().year - index - 1}-${index + 1}-01',
          'tmt_berakhir': '202${index+4}-10-10',
          'no_sk': 'banyuwangi/1/${index + 1}',
          'penerbit_sk': 'PemKab banyuwangi',
        },
      );
    });
  }

  

  @override
  Widget build(BuildContext context) {
    void navigateToDetail(Map<String, String> kenaikanPangkat) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailKenaikanPangkatView(kenaikanPangkat: kenaikanPangkat),
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
                headerComponent,
                SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: headerContainer,
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      width: deviceWidth(context),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2, // Penyebaran bayangan
                                blurRadius: 7,
                                offset: Offset(1, 4))
                          ]),
                      height: deviceHeight(context) * 1 / 2,
                      // width: deviceWidth(context) - 15,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: KenaikanPangkatList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(child: 
                                  Image.asset(
                                      "assets/asset_sikep/account_circle.png"),
                                  backgroundColor: Colors.transparent,
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    navigateToDetail(KenaikanPangkatList[index]);
                                  },
                                  child: Image.asset(
                                        "assets/asset_sikep/info.png")
                                ),
                                title: Text(
                                  "Pangkat/Gol Baru : ${KenaikanPangkatList[index]['pangkat/gol_baru']!}",
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Alasan Cuti : ${KenaikanPangkatList[index]['no_sk']!}",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                    Text(
                                      "Tanggal : ${KenaikanPangkatList[index]['penerbit_sk']!}",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  
                  ],
                ),
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
