class User {
  int? id;
  String? nik;
  String? nipNippk;
  String? gelarDepan;
  String? gelarBelakang;
  String? namaDepan;
  String? namaBelakang;
  String? namaLengkap;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? alamat;
  String? usia;
  String? agama;
  String? noWa;
  String? statusPegawai;
  int? ruanganId;
  String? tahunPensiun;
  String? pendidikanTerakhir;
  String? tanggalLulus;
  String? noIjazah;
  String? jabatan;
  int? cutiTahunan;
  int? tahunCuti;
  int? sisaCutiTahunan;
  String? masaKerja;
  String? statusTenaga;
  String? statusTipe;
  String? tmtCpns;
  String? tmtPns;
  String? tmtPppk;
  String? tmtPangkatTerakhir;
  int? pangkatGolonganId;
  String? sekolah;
  String? jenisTenaga;
  String? niPttPkThl;
  String? tanggalMasuk;
  String? noKarpeg;
  String? noTaspen;
  String? noNpwp;
  String? noHp;
  String? email;
  String? pelatihan;
  String? password;
  String? statusNonaktif;
  String? token;

  User(
      {this.id,
      this.nik,
      this.nipNippk,
      this.gelarDepan,
      this.gelarBelakang,
      this.namaDepan,
      this.namaBelakang,
      this.namaLengkap,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.alamat,
      this.usia,
      this.agama,
      this.noWa,
      this.statusPegawai,
      this.ruanganId,
      this.tahunPensiun,
      this.pendidikanTerakhir,
      this.tanggalLulus,
      this.noIjazah,
      this.jabatan,
      this.cutiTahunan,
      this.tahunCuti,
      this.sisaCutiTahunan,
      this.masaKerja,
      this.statusTenaga,
      this.statusTipe,
      this.tmtCpns,
      this.tmtPns,
      this.tmtPppk,
      this.tmtPangkatTerakhir,
      this.pangkatGolonganId,
      this.sekolah,
      this.jenisTenaga,
      this.niPttPkThl,
      this.tanggalMasuk,
      this.noKarpeg,
      this.noTaspen,
      this.noNpwp,
      this.noHp,
      this.email,
      this.pelatihan,
      this.password,
      this.statusNonaktif,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nik: json['nik'],
      nipNippk: json['nip_nippk'],
      gelarDepan: json['gelar_depan'],
      gelarBelakang: json['gelar_belakang'],
      namaDepan: json['nama_depan'],
      namaBelakang: json['nama_belakang'],
      namaLengkap: json['nama_lengkap'],
      jenisKelamin: json['jenis_kelamin'],
      tempatLahir: json['tempat_lahir'],
      tanggalLahir: json['tanggal_lahir'],
      alamat: json['alamat'],
      usia: json['usia'],
      agama: json['agama'],
      noWa: json['no_wa'],
      statusPegawai: json['status_pegawai'],
      ruanganId: json['ruangan_id'],
      tahunPensiun: json['tahun_pensiun'],
      pendidikanTerakhir: json['pendidikan_terakhir'],
      tanggalLulus: json['tanggal_lulus'],
      noIjazah: json['no_ijazah'],
      jabatan: json['jabatan'],
      cutiTahunan: json['cuti_tahunan'],
      tahunCuti: json['tahun_cuti'],
      sisaCutiTahunan: json['sisa_cuti_tahunan'],
      masaKerja: json['masa_kerja'],
      statusTenaga: json['status_tenaga'],
      statusTipe: json['status_tipe'],
      tmtCpns: json['tmt_cpns'],
      tmtPns: json['tmt_pns'],
      tmtPppk: json['tmt_pppk'],
      tmtPangkatTerakhir: json['tmt_pangkat_terakhir'],
      pangkatGolonganId: json['pangkat_golongan_id'],
      sekolah: json['sekolah'],
      jenisTenaga: json['jenis_tenaga'],
      niPttPkThl: json['niPtt_pkThl'],
      tanggalMasuk: json['tanggal_masuk'],
      noKarpeg: json['no_karpeg'],
      noTaspen: json['no_taspen'],
      noNpwp: json['no_npwp'],
      noHp: json['no_hp'],
      email: json['email'],
      pelatihan: json['pelatihan'],
      password: json['password'],
      statusNonaktif: json['status_nonaktif'],
      token: json['token'],
    );
  }
}
