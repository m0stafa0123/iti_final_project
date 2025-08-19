import 'package:flutter_application_1/core/imports/imports.dart';


class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());
  final AuthRepository _authRepository = AuthRepository();

  Future<void> signUp(String email, String password) async {
    emit(AuthCubitLoading());
    try {
      await _authRepository.signUp(email, password);
      final user = FirebaseAuth.instance.currentUser;
     if (user != null) {
        emit(AuthCubitAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthCubitError(e.toString()));
    }
  }
  Future<void> login(String email, String password) async {
    emit(AuthCubitLoading());
    try {
      await _authRepository.login(email, password);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(AuthCubitAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthCubitError(e.toString()));
    }
  }
  Future<void> logout() async {
    emit(AuthCubitLoading());
    try {
      await _authRepository.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthCubitError(e.toString()));
    }
  }
  Future<void> signinWithGoogle() async {
    emit(AuthCubitLoading());
    try {
      final user = await _authRepository.loginWithGoogle();
      if (user != null) {
        emit(AuthCubitAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthCubitError(e.toString()));
    }
  }

}
