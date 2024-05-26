import "dart:ffi";

import "package:faker/faker.dart";
import "package:flutter/material.dart";
import "package:provider/single_child_widget.dart";
import '../../../../widgets/header_component.dart';
import '../../../../widgets/header_container.dart';
import 'detail_mutasi_view.dart';
import '../../../../common/common.dart';

class ListMutasiView extends StatefulWidget {
  const ListMutasiView({super.key});

  @override
  State<ListMutasiView> createState() =>
      _ListMutasiViewState();
}

class _ListMutasiViewState extends State<ListMutasiView> {
  late HeaderComponent headerComponent;
  late HeaderContainer headerContainer;

  List<Map<String, String>> mutasi = [];

  @override
  void initState() {
    super.initState();
    headerComponent = HeaderComponent();
    headerContainer = HeaderContainer(HeaderName: "RIWAYAT MUTASI");
    // You can call your API here
    fetchDiklatList();
  }

  void fetchDiklatList() {
    // Simulating API call
    setState(() {
      mutasi = List.generate(
        10,
        (index) => {
          'jenis_mutasi': '${index % 2 == 0 ? "Internal" : "Eksternal"}',
          'ruangan_sebelumnya': 'params${index + 2}',
          'ruangan_baru': 'params${index + 3}',
          'no_sk': 'params${index + 3}',
          'tanggal_berlaku': 'params${index + 1}',
          'tanggal_sk': 'params',
          'instansi_sebelumnya': 'params',
          'instansi_baru': 'params',
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    void navigateToDetail(Map<String, String> mutasi) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailMutasiView(mutasi: mutasi),
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
                          itemCount: mutasi.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(child: Image.asset("assets/asset_sikep/akun.png"),),
                                trailing: InkWell(
                                  onTap: () {
                                    navigateToDetail(mutasi[index]);
                                  },
                                  child: Icon(
                                    Icons.info,
                                    color: whiteColor,
                                  ),
                                ),
                                title: Text(
                                  "Jenis mutasi : ${mutasi[index]['jenis_mutasi']!}",
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                       mutasi[index]['jenis_mutasi'] ==
                                              'internal'
                                          ? 'Ruangan Sebelumnya : ${mutasi[index]['ruangan_sebelumnya']}'
                                          : 'Instansi Sebelumnya ${mutasi[index]['instansi_sebelumnya']!}',
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                    Text(
                                      mutasi[index]['jenis_mutasi'] ==
                                              'internal'
                                          ? 'Ruangan Baru ${mutasi[index]['ruangan_baru']}'
                                          : 'Instansi Baru ${mutasi[index]['instansi_baru']!}',
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
