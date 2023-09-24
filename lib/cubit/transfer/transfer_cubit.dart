import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newtronic_solution/model/models.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitial());

  selectedBank({required BankModel bank}) {
    emit(TransferSelectedBank(bank));
  }
}
