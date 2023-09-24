part of 'models.dart';

class TransferModel {
  BankModel? bank;
  String? namaPengirim;
  String? noRek;
  String? nominal;
  String? catatan;

  TransferModel({
    this.bank,
    this.namaPengirim,
    this.noRek,
    this.nominal,
    this.catatan,
  });

  TransferModel copyWith({
    BankModel? bank,
    String? namaPengirim,
    String? noRek,
    String? nominal,
    String? catatan,
  }) =>
      TransferModel(
        bank: bank ?? this.bank,
        namaPengirim: namaPengirim ?? this.namaPengirim,
        noRek: noRek ?? this.noRek,
        nominal: nominal ?? this.nominal,
        catatan: catatan ?? this.catatan,
      );
}
