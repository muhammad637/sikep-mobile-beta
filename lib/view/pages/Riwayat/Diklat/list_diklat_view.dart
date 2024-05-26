import "dart:ffi";

import "package:faker/faker.dart";
import "package:flutter/material.dart";
import "package:provider/single_child_widget.dart";
import '../../../../widgets/header_component.dart';
import '../../../../widgets/header_container.dart';
import 'detail_diklat_view.dart';
import '../../../../common/common.dart';

class ListDiklatView extends StatefulWidget {
  const ListDiklatView({super.key});

  @override
  State<ListDiklatView> createState() => _ListDiklatViewState();
}

class _ListDiklatViewState extends State<ListDiklatView> {
  late HeaderComponent headerComponent;
  late HeaderContainer headerContainer;

  List<Map<String, String>> DiklatList = [];

  @override
  void initState() {
    super.initState();
    headerComponent = HeaderComponent();
    headerContainer = HeaderContainer(HeaderName: "Riwayat Cuti");
    // You can call your API here
    fetchDiklatList();
  }

  void fetchDiklatList() {
    // Simulating API call
    setState(() {
      DiklatList = List.generate(
        10,
        (index) => {
          'tipe': '${index % 2 == 0 ? "Promosi" : "Demosi"}',
          'jabatan_sebelumnya': 'params${index + 2}',
          'jabatan_baru': 'params${index + 3}',
          'ruangan_sebelumnya': 'params${index + 1}',
          'ruangan_baru': 'params',
          'tanggal_sk': '2024-03-${index + 1}',
          'tanggal_berlaku': '2024-03-${index + 1}',
          'no_sk': '12312312',
        },
      );
    });
  }

  

  @override
  Widget build(BuildContext context) {
    void navigateToDetail(Map<String, String> diklat) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailDiklatView(diklat: diklat),
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
                          itemCount: DiklatList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(),
                                trailing: InkWell(
                                  onTap: () {
                                    navigateToDetail(DiklatList[index]);
                                  },
                                  child: Icon(
                                    Icons.info,
                                    color: whiteColor,
                                  ),
                                ),
                                title: Text(
                                  "Jenis Cuti : ${DiklatList[index]['tipe']!}",
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Alasan Cuti : ${DiklatList[index]['jabatan_sebelumnya']!}",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                    Text(
                                      "Tanggal : ${DiklatList[index]['jabatan_baru']!}",
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
