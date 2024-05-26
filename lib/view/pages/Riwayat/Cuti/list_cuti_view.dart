import 'package:flutter/material.dart';
import 'package:flutter_testing/common/common.dart';
import 'package:flutter_testing/widgets/header_component.dart';
import 'package:flutter_testing/widgets/header_container.dart';
import 'detail_cuti_view.dart';

class ListCutiView extends StatefulWidget {
  const ListCutiView({Key? key}) : super(key: key);

  @override
  _ListCutiViewState createState() => _ListCutiViewState();
}

class _ListCutiViewState extends State<ListCutiView> {
  late HeaderComponent headerComponent;
  late HeaderContainer headerContainer;

  List<Map<String, String>> CutiList = [];

  @override
  void initState() {
    super.initState();
    headerComponent = HeaderComponent();
    headerContainer = HeaderContainer(HeaderName: "Riwayat Cuti");
    // You can call your API here
    fetchCutiList();
  }

  void fetchCutiList() {
    // Simulating API call
    setState(() {
      CutiList = List.generate(
        10,
        (index) => {
          'jenis': 'Cuti ke ${index + 1}',
          'alasan': 'sakit',
          'tanggal': '2024-03-${index + 1}'
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    void navigateToDetail(Map<String, String> cuti) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailCutiView(cuti: cuti),
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
                              color: Colors.grey.withOpacity(
                                0.5),
                                spreadRadius: 2, // Penyebaran bayangan
                                blurRadius: 7,
                              offset: Offset(1, 4)
                            )
                          ]),
                      height: deviceHeight(context) * 1 / 2,
                      // width: deviceWidth(context) - 15,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: CutiList.length,
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
                                    navigateToDetail(CutiList[index]);
                                  },
                                  child: Icon(
                                    Icons.info,
                                    color: whiteColor,
                                  ),
                                ),
                                title: Text(
                                  "Jenis Cuti : ${CutiList[index]['jenis']!}",
                                  style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontSize: 11),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Alasan Cuti : ${CutiList[index]['alasan']!}",
                                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontSize: 11),
                                    ),
                                    Text(
                                     "Tanggal : ${CutiList[index]['tanggal']!}",
                                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        width: defaultWidth(context),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'sisa cuti tahunan'.toUpperCase(),
                              style: TextStyle(
                                color: whiteColor,
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '12 hari'.toUpperCase(),
                              style: TextStyle(
                                color: whiteColor,
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                           
                          ],
                        ))
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
        child: Icon(Icons.arrow_back,color: whiteColor,),
      ),
    );
  }
}
