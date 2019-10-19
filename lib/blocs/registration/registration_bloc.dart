import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:travearn/repositories/user_repository.dart';
import 'package:travearn/utils/validators.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRepository _userRepository;

  RegistrationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegistrationState get initialState => RegistrationState.empty();

  @override
  Stream<RegistrationState> transformEvents(Stream<RegistrationEvent> events, Stream<RegistrationState> Function(RegistrationEvent event) next) {
    final observableStream = events as Observable<RegistrationEvent>;
    final nonDebounceStream = observableStream.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final deBounceStream = observableStream.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(nonDebounceStream.mergeWith([deBounceStream]), next);
  }

  Stream<RegistrationState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegistrationState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegistrationState> _mapFormSubmittedToState(String email, String password,) async* {
    yield RegistrationState.loading();
    try {
      await _userRepository.signUp(email: email, password: password,);
      yield RegistrationState.success();
    } catch (_) {
      yield RegistrationState.failure();
    }
  }

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event,) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }
}
