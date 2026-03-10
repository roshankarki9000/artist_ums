import 'package:artist_ums/features/users/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'user_event.dart';
import 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repo;

  UserBloc(this.repo) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.when(
        getUsers: () => _getUsers(emit),
        getCurrentUser: () => _getCurrentUser(emit),
        createUser: (name, email) =>
            _createUser(emit, name: name, email: email),
        updateUser: (id, name) => _updateUser(emit, id: id, name: name),
        deleteUser: (id) => _deleteUser(emit, id: id),
      );
    });
  }

  Future<void> _getUsers(Emitter<UserState> emit) async {
    emit(const UserState.loading());

    final result = await repo.getUsers();

    result.fold(
      (failure) => emit(UserState.error(failure: failure)),
      (users) => emit(UserState.usersLoaded(users: users)),
    );
  }

  Future<void> _getCurrentUser(Emitter<UserState> emit) async {
    emit(const UserState.loading());

    final result = await repo.getCurrentUser();

    result.fold(
      (failure) => emit(UserState.error(failure: failure)),
      (user) => emit(UserState.userLoaded(user: user)),
    );
  }

  Future<void> _createUser(
    Emitter<UserState> emit, {
    required String name,
    required String email,
  }) async {
    emit(const UserState.loading());

    final result = await repo.createUser(name: name, email: email);

    result.fold((failure) => emit(UserState.error(failure: failure)), (_) {
      emit(const UserState.success());
      add(const UserEvent.getUsers());
    });
  }

  Future<void> _updateUser(
    Emitter<UserState> emit, {
    required String id,
    required String name,
  }) async {
    emit(const UserState.loading());

    final result = await repo.updateUser(id: id, name: name);

    result.fold((failure) => emit(UserState.error(failure: failure)), (_) {
      emit(const UserState.success());
      add(const UserEvent.getUsers());
    });
  }

  Future<void> _deleteUser(
    Emitter<UserState> emit, {
    required String id,
  }) async {
    emit(const UserState.loading());

    final result = await repo.deleteUser(id);

    result.fold((failure) => emit(UserState.error(failure: failure)), (_) {
      emit(const UserState.success());
      add(const UserEvent.getUsers());
    });
  }
}
