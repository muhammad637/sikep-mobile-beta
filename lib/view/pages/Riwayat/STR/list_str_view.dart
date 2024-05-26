import "dart:ffi";

import "package:faker/faker.dart";
import "package:flutter/material.dart";
import "package:provider/single_child_widget.dart";
import '../../../../widgets/header_component.dart';
import '../../../../widgets/header_container.dart';
import 'detail_str_view.dart';
import '../../../../common/common.dart';

class ListSTRView extends StatefulWidget {
  const ListSTRView({super.key});

  @override
  State<ListSTRView> createState() => _ListSTRViewState();
}

class _ListSTRViewState extends State<ListSTRView> {
  late HeaderComponent headerComponent;
  late HeaderContainer headerContainer;

  List<Map<String, String>> str = [];

  @override
  void initState() {
    super.initState();
    headerComponent = HeaderComponent();
    headerContainer = HeaderContainer(HeaderName: "RIWAYAT str");
    // You can call your API here
    fetchDiklatList();
  }

  void fetchDiklatList() {
    // Simulating API call
    setState(() {
      str = List.generate(
        10,
        (index) => {
          'no_str': 'STR ${index+1}',
          'no_sip': 'params${index + 2}',
          'kompetensi': 'params${index + 3}',
          'no_kompetensi': 'params${index + 3}',
          'penerbit_str': 'params${index + 1}',
          'tanggal_terbit_str': 'params',
          'masa_berakhir_str': 'params',
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    void navigateToDetail(Map<String, String> str) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailSTRView(str: str),
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
                          itemCount: str.length,
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
                                    navigateToDetail(str[index]);
                                  },
                                  child: Icon(
                                    Icons.info,
                                    color: whiteColor,
                                  ),
                                ),
                                title: Text(
                                  "No STR : ${str[index]['no_str']!}",
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Penerbit STR : ${str[index]['penerbit_str']}" ,
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                    Text(
                                     "Masa Berakhir : ${str[index]['masa_berakhir_str']}",
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