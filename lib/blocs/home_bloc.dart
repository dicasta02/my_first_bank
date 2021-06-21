import 'dart:async';

import 'package:my_first_bank/blocs/provider/bloc.dart';
import 'package:my_first_bank/domain/authetication_use_case.dart';
import 'package:my_first_bank/models/aunthentication_response.dart';
import 'package:my_first_bank/models/authetication_request.dart';
import 'package:my_first_bank/models/event.dart';
import 'package:my_first_bank/models/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends Bloc {
  final AuthenticationUseCase _authenticationUseCase;

  HomeBloc(this._authenticationUseCase) {
    _userController.stream.listen((user) {
      _user = user;
      validateEmptyFields(_user, _password);
    });
    _passwordController.stream.listen((password) {
      _password = password;
      validateEmptyFields(_user, _password);
    });
  }

  String _user = '';
  String _password = '';

  final _emptyFieldsSubject = BehaviorSubject<bool>();
  final _loadingSubject = BehaviorSubject<bool>();
  final _userController = StreamController<String>();
  final _passwordController = StreamController<String>();

  ValueStream<bool> get emptyFields => _emptyFieldsSubject.stream;

  ValueStream<bool> get loading => _loadingSubject.stream;

  Sink<String> get userSink => _userController.sink;

  Sink<String> get passwordSink => _passwordController.sink;

  @override
  void dispose() {
    _loadingSubject.close();
    _emptyFieldsSubject.close();
    _userController.close();
    _passwordController.close();
  }

  void validateEmptyFields(String user, String password) {
    if (user.trim().isEmpty || password.trim().isEmpty) {
      _emptyFieldsSubject.add(true);
    } else {
      _emptyFieldsSubject.add(false);
    }
  }

  Future<Result<Event<AuthenticationResponse>>> signIn(
      AuthenticationRequest authenticationRequest) {
    _loadingSubject.add(true);
    return _authenticationUseCase.signIn(authenticationRequest).then((result) {
      _loadingSubject.add(false);
      return result;
    });
  }
}
