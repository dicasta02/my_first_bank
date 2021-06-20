import 'dart:async';

import 'package:my_first_bank/blocs/provider/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends Bloc {
  final StreamController<int> currentPageController = BehaviorSubject<int>();

  ValueStream<int> get currentPage => currentPageController.stream;

  void changePage(int i) {
    currentPageController.sink.add(i);
  }

  @override
  void dispose() {
    currentPageController?.close();
  }
}
