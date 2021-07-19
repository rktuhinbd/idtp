import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/repository/repository.dart';
import 'package:idtp/src/utils/toast.dart';

import 'metro_rail_payment_event.dart';
import 'metro_rail_payment_state.dart';

class MetroRailPaymentBloc
    extends Bloc<MetroRailPaymentEvent, MetroRailPaymentState> {
  MetroRailPaymentBloc() : super(InitMetroRailPaymentState());

  @override
  Stream<MetroRailPaymentState> mapEventToState(
      MetroRailPaymentEvent event) async* {
    if (event is LoadingMetroRailPaymentEvent) {
      yield LoadingMetroRailPaymentState();
      try {
        var response =
            await Repository().fundTransfer(event.fundTransferRequest);

        if (response.code == "200") {
          showToast("MRT Successful");
          yield LoadedMetroRailPaymentState();
        } else {
          yield LoadedMetroRailPaymentState();
          showToast("MRT Failure!");
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
