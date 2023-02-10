import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_design_chips/data/models/status_model.dart';
import 'package:test_design_chips/data/repository/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo repo;
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<SendPhoneEvent>(
      (event, emit) async {
        emit(AuthLoading());
        if (event.phoneNumber.length < 12) {
          emit(AuthError());
        } else {
          try {
            final model = await repo.sendPhone(phoneNumber: event.phoneNumber);
            if (model.status == 0) {
              emit(AuthError(error: model.message));
            } else {
              emit(AuthSucces(model: model));
            }
          } catch (e) {
            emit(AuthError());
          }
        }
      },
    );
    on<SendCodeEvent>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final model = await repo.sendCode(code: event.code);
          emit(AuthSucces(model: model));
        } catch (e) {
          emit(
            AuthError(),
          );
        }
      },
    );
  }
}
