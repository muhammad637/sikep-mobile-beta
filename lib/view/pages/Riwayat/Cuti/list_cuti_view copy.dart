import 'package:flutter/material.dart';
import 'package:flutter_testing/common/common.dart';
import 'package:flutter_testing/widgets/header_component.dart';
import 'package:flutter_testing/widgets/header_container.dart';

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
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black26),
                      height: deviceHeight(context) * 1 / 2,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: CutiList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: ListTile(
                                leading: CircleAvatar(),
                                trailing: InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.info),
                                ),
                                title: Text(CutiList[index]['jenis']!),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(CutiList[index]['alasan']!),
                                    Text(CutiList[index]['tanggal']!),
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
}
