import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dialog.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/core/utils/generic_toasts.dart';
import 'package:artist_ums/features/users/domain/entities/user_model.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_event.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditUserPage extends StatelessWidget {
  final String id;

  const EditUserPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            showCustomWarningToast("User updated successfully");
            context.pop(context);
          },
          error: (failure) {
            showCustomErrorToast(failure.message);
          },
        );
      },
      child: _EditUserView(id: id),
    );
  }
}

class _EditUserView extends StatelessWidget {
  final String id;

  const _EditUserView({required this.id});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: CustomScrollView(
        slivers: [
          const _EditUserHeader(),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: _EditUserForm(id: id),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditUserHeader extends StatelessWidget {
  const _EditUserHeader();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorConstant.whiteColor,
          size: 20.sp,
        ),
        onPressed: () => context.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstant.primaryShade1,
                ColorConstant.primaryShade2,
                ColorConstant.whiteColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.fromLTRB(16.w, 100.h, 16.w, 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Edit User", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text(
                "Update user information",
                style: StylesConstants.hintGrey14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditUserForm extends StatefulWidget {
  final String id;

  const _EditUserForm({required this.id});

  @override
  State<_EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<_EditUserForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    final user = context.read<UserBloc>().state.maybeWhen(
      usersLoaded: (users) =>
          users.where((u) => u.id == widget.id).cast<UserModel>().firstOrNull,
      orElse: () => null,
    );

    nameController = TextEditingController(text: user?.name ?? "");
    emailController = TextEditingController(text: user?.email ?? "");
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<UserBloc>().add(
      UserEvent.updateUser(id: widget.id, name: nameController.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          GenericTextField(
            controller: nameController,
            hint: "User Name",
            icon: ImageConstants.userLogoLottie,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter user name";
              }
              return null;
            },
          ),

          SizedBox(height: 14.h),

          GenericTextField(
            controller: emailController,
            hint: "Email",
            icon: ImageConstants.userNoddingLogoLottie,
            enabled: false,
          ),

          SizedBox(height: 30.h),

          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              final loading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return GenericElevatedButton(
                title: "Update User",
                loading: loading,
                onPressed: () => GenericDialog.show(
                  context,
                  title: 'Update User',
                  subtitle: 'Are you sure to update this user?',
                  onYes: () => _submit(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
