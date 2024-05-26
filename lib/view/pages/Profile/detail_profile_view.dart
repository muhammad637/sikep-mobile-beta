import 'package:flutter/material.dart';
import 'package:flutter_testing/models/user.dart';
import "package:faker/faker.dart";
import "package:flutter/material.dart";
import 'package:flutter_testing/models/user.dart';
import "package:provider/single_child_widget.dart";
import '../../../widgets/header_component.dart';
import '../../../widgets/header_container.dart';
import '../Riwayat/Mutasi/detail_mutasi_view.dart';
import '../../../common/common.dart';

class DetailProfileView extends StatefulWidget {
  final User user;
  const DetailProfileView({super.key, required this.user});

  @override
  State<DetailProfileView> createState() => _DetailProfileViewState();
}

class _DetailProfileViewState extends State<DetailProfileView> {
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
                  child: HeaderContainer(HeaderName: "DETAIL JABATAN"),
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
                        child: ListView(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage("assets/asset_sikep/akun.png"),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'NAMA',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.namaLengkap!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'NIK',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.nik!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Jenis Kelamin',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.jenisKelamin!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Tempat, Tanggal Lahir',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                                '${widget.user.tempatLahir!}, ${widget.user.tanggalLahir!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Alamat',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.alamat!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Usia',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.usia!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Agama',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.agama!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'No. WhatsApp',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.noWa!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Status Pegawai',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.statusPegawai!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Ruangan ID',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.ruanganId!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Tahun Pensiun',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tahunPensiun!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Pendidikan Terakhir',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.pendidikanTerakhir!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Tanggal Lulus',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tanggalLulus!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'No. Ijazah',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.noIjazah!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Jabatan',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.jabatan!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Cuti Tahunan',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.cutiTahunan!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Tahun Cuti',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tahunCuti!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Sisa Cuti Tahunan',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.sisaCutiTahunan!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Masa Kerja',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.masaKerja!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Status Tenaga',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.statusTenaga!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Status Tipe',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.statusTipe!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'TMT CPNS',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tmtCpns!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'TMT PNS',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tmtPns!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'TMT PPPK',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tmtPppk!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'TMT Pangkat Terakhir',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tmtPangkatTerakhir!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Pangkat Golongan ID',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.pangkatGolonganId!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Sekolah',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.sekolah!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Jenis Tenaga',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.jenisTenaga!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'NI PTT PK THL',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.niPttPkThl!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Tanggal Masuk',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.tanggalMasuk!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'No. Karpeg',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.noKarpeg!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'No. Taspen',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.noTaspen!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'No. NPWP',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.noNpwp!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'No. HP',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.noHp!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.email!}',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(
                              'Pelatihan',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.user.pelatihan!}',
                                style: TextStyle(fontSize: 15)),
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
