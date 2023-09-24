part of 'transfer_cubit.dart';

@immutable
sealed class TransferState {}

final class TransferInitial extends TransferState {}

final class TransferSelectedBank extends TransferState {
  final BankModel bank;
  TransferSelectedBank(this.bank);
}
