import 'package:artist_ums/core/service/email_service.dart';
import 'package:artist_ums/features/auth/domain/repository/auth_repository.dart';
import 'package:artist_ums/features/users/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;
  final UserRepository userRepo;
  final EmailService emailService;
  AuthBloc(this.repo, this.userRepo, this.emailService)
    : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        started: () => _started(emit),
        checkSession: () => _checkSession(emit),
        login: (email, password) =>
            _login(emit, email: email, password: password),
        register: (name, email, password) =>
            _register(emit, name: name, email: email, password: password),
        loginWithGoogle: () => _googleLogin(emit),
        logout: () => _logout(emit),
        resetPassword: (password) => _resetPassword(emit, password: password),
      );
    });
  }

  Future<void> _started(Emitter<AuthState> emit) async {
    add(const AuthEvent.checkSession());
  }

  Future<void> _checkSession(Emitter<AuthState> emit) async {
    final result = await repo.hasSession();

    await result.fold(
      (failure) async => emit(AuthState.error(failure: failure)),
      (hasSession) async {
        if (!hasSession) {
          emit(const AuthState.unauthenticated());
          return;
        }

        final resetCheck = await userRepo.needsPasswordReset();

        await resetCheck.fold(
          (failure) async => emit(AuthState.error(failure: failure)),
          (needsReset) async {
            if (needsReset) {
              emit(const AuthState.resetRequired());
            } else {
              final result = await userRepo.getCurrentUser();
              result.fold(
                (failure) => emit(AuthState.error(failure: failure)),
                (user) => emit(AuthState.authenticated(user)),
              );
            }
          },
        );
      },
    );
  }

  Future<void> _login(
    Emitter<AuthState> emit, {
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());

    final result = await repo.login(email: email, password: password);

    await result.fold(
      (failure) async => emit(AuthState.error(failure: failure)),
      (_) async {
        final reset = await userRepo.needsPasswordReset();

        await reset.fold(
          (failure) async => emit(AuthState.error(failure: failure)),
          (needsReset) async {
            if (needsReset) {
              emit(const AuthState.resetRequired());
            } else {
              final result = await userRepo.getCurrentUser();
              result.fold(
                (failure) => emit(AuthState.error(failure: failure)),
                (user) => emit(AuthState.authenticated(user)),
              );
            }
          },
        );
      },
    );
  }

  Future<void> _register(
    Emitter<AuthState> emit, {
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());

    final result = await repo.register(
      name: name,
      email: email,
      password: password,
    );

    await result.fold(
      (failure) async {
        emit(AuthState.error(failure: failure));
      },
      (_) async {
        final emailResult = await emailService.sendUserRegistrationEmail(email);

        emailResult.fold(
          (failure) {
            emit(AuthState.error(failure: failure));
          },
          (_) {
            emit(const AuthState.unauthenticated());
          },
        );
      },
    );
  }

  Future<void> _googleLogin(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await repo.loginWithGoogle();
    result.fold((failure) => emit(AuthState.error(failure: failure)), (_) {});
  }

  Future<void> _logout(Emitter<AuthState> emit) async {
    final result = await repo.logout();

    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _resetPassword(
    Emitter<AuthState> emit, {
    required String password,
  }) async {
    emit(const AuthState.loading());

    final result = await repo.resetPassword(password: password);

    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
