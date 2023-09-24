part of 'models.dart';

class BankModel {
  String? namaBank;
  String? gambar;

  BankModel({
    this.namaBank,
    this.gambar,
  });
}

List<BankModel> listBankMock = [
  BankModel(namaBank: 'OCBC', gambar: 'assets/ocbc.png'),
  BankModel(namaBank: 'Mandiri', gambar: 'assets/mandiri.png'),
  BankModel(namaBank: 'BRI', gambar: 'assets/bri.png'),
  BankModel(namaBank: 'BNI', gambar: 'assets/bni.png'),
  BankModel(namaBank: 'CIMB', gambar: 'assets/cimb.png'),
];
