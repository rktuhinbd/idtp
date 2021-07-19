import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/repository/repository.dart';
import 'package:idtp/src/utils/toast.dart';

import 'fund_transfer_event.dart';
import 'fund_transfer_state.dart';

class FundTransferBloc extends Bloc<FundTransferEvent, FundTransferState> {
  FundTransferBloc() : super(InitFundTransferState());

  @override
  Stream<FundTransferState> mapEventToState(FundTransferEvent event) async* {
    if (event is LoadingFundTransferEvent) {
      yield LoadingFundTransferState();
      try {
        var response =
            await Repository().fundTransfer(event.fundTransferRequest);

        if (response.code == "200") {
          showToast("Fund Transfer Successful");
          yield LoadedFundTransferState();
        } else {
          yield LoadedFundTransferState();
          showToast("Fund Transfer Failure!");
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
