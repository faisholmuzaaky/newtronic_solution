part of 'models.dart';

class TransaksiModel {
  String? platform;
  String? tanggal;
  String? harga;
  String? imageUrl;

  TransaksiModel({
    this.platform,
    this.tanggal,
    this.harga,
    this.imageUrl,
  });
}

List<TransaksiModel> listTransaksiMock = [
  TransaksiModel(
      platform: 'Netflix',
      tanggal: '17 Agustus 2023',
      harga: 'Rp 150.000',
      imageUrl: 'assets/Group 3.png'),
  TransaksiModel(
      platform: 'Amazon Prime',
      tanggal: '28 November 2023',
      harga: 'Rp 120.000',
      imageUrl: 'assets/Group 4.png'),
  TransaksiModel(
      platform: 'Spotify',
      tanggal: '31 Mei 2023',
      harga: 'Rp 60.000',
      imageUrl: 'assets/Group 5.png'),
];
