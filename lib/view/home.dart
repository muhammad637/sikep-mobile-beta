import 'package:flutter/material.dart';
import 'package:flutter_testing/common/common.dart';
import 'package:flutter_testing/models/user.dart';
import 'package:flutter_testing/view/pages/Profile/profile_view.dart';
import 'package:flutter_testing/view/pages/dashboard_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? bottomNavBarIndex;
  PageController? pageController;

  late User user;
  @override
  void initState() {
    super.initState();
    user = User(
      id: 1,
      nik: '123456789',
      nipNippk: '123456789',
      namaLengkap: 'John Doe',
      jenisKelamin: 'Laki-laki',
      tempatLahir: 'Jakarta',
      tanggalLahir: '01 Januari 1990',
      alamat: 'Jl. Contoh No. 123',
      usia: '30',
      agama: 'Islam',
      noWa: '08123456789',
      statusPegawai: 'PNS',
      ruanganId: 101,
      tahunPensiun: '2050',
      pendidikanTerakhir: 'S1 Teknik Informatika',
      tanggalLulus: '01 Januari 2010',
      noIjazah: '123456789',
      jabatan: 'Programmer',
      cutiTahunan: 12,
      tahunCuti: 2024,
      sisaCutiTahunan: 8,
      masaKerja: '10 tahun',
      statusTenaga: 'Pegawai Negeri',
      statusTipe: 'Aktif',
      tmtCpns: '01 Januari 2010',
      tmtPns: '01 Januari 2012',
      tmtPppk: '',
      tmtPangkatTerakhir: '01 Januari 2018',
      pangkatGolonganId: 3,
      sekolah: 'Universitas Contoh',
      jenisTenaga: 'PNS',
      niPttPkThl: '123456789',
      tanggalMasuk: '01 Januari 2010',
      noKarpeg: '123456789',
      noTaspen: '123456789',
      noNpwp: '123456789',
      noHp: '08123456789',
      email: 'john.doe@example.com',
      pelatihan: 'Pelatihan A, Pelatihan B',
      password: 'password',
      statusNonaktif: 'Aktif',
      token: 'token',
    );
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex!);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          SafeArea(
              child: Stack(
            children: [
              Container(
                color: screenColor,
              ),
              PageView(
                controller: pageController,
                onPageChanged: (index) => setState(() {
                  bottomNavBarIndex = index;
                }),
                children:  [
                  DashboardView(),
                  // DashboardView(),
                  ProfileView(user: user),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                     selectedItemColor: primaryColor, // Warna teks saat terpilih
                    unselectedItemColor:
                        greyColor, // Warna teks saat tidak terpilih
                    currentIndex: bottomNavBarIndex!,
                    onTap: (index) {
                      setState(() {
                        bottomNavBarIndex = index;
                        pageController!.jumpToPage(index);
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: "Dashboard",
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          height: 24,
                          child: Icon(Icons.dashboard,size: 30,),
                          // child: Image.asset(
                          //   (bottomNavBarIndex == 0)
                          //       ? "assets/images/dashboard_active.png"
                          //       : "assets/images/dashboard_inactive.png",
                          // ),
                        ),
                      ),
                      // BottomNavigationBarItem(
                      //   label: "Histories",
                      //   icon: Container(
                      //     margin: const EdgeInsets.only(bottom: 4),
                      //     height: 24,
                      //     child: Icon(Icons.notifications)
                      //   ),
                      // ),
                      BottomNavigationBarItem(
                        label: "Profile",
                        backgroundColor: primaryColor,
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          height: 24,
                          child: Icon(
                            Icons.person_outline,
                           
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
