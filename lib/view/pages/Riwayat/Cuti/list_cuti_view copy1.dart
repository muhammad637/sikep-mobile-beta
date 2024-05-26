import 'package:flutter/material.dart';
import 'package:flutter_testing/common/common.dart';

class ListCutiView extends StatefulWidget {
  const ListCutiView({super.key});

  @override
  State<ListCutiView> createState() => _ListCutiViewState();
}

class _ListCutiViewState extends State<ListCutiView> {
  List<Map<String, String>> CutiList = List.generate(
      10,
      (index) => {
            'jenis': 'Cuti ke ${index + 1}',
            'alasan': 'sakit',
            'tanggal': '2024-03-${index + 1}'
          });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('dataCuti'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black26),
            height: deviceHeight(context) * 2 / 3,
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: CutiList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
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
                  color: Colors.purple[100], borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'sisa cuti tahunan'.toUpperCase(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '12 hari'.toUpperCase(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('testing');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );

    return SingleChildScrollView();
  }
}
