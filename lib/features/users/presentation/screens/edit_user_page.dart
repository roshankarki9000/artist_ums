import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_event.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserPage extends StatefulWidget {
  final String id;

  const EditUserPage({super.key, required this.id});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    var user = context
        .read<UserBloc>()
        .state
        .maybeWhen(
          orElse: () => null,
          usersLoaded: (users) => users.where((e) => e.id == widget.id),
        )
        ?.firstOrNull;
    nameController = TextEditingController(text: user?.name);
    emailController = TextEditingController(text: user?.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _updateUser() {
    context.read<UserBloc>().add(
      UserEvent.updateUser(id: widget.id, name: nameController.text.trim()),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit User")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              enabled: false,
              decoration: const InputDecoration(
                labelText: "Email (cannot edit)",
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _updateUser,
                child: const Text("Update User"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
