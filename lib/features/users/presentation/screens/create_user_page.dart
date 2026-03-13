import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/core/utils/generic_toasts.dart';

import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_event.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            showCustomSuccessToast("User created successfully");
            Navigator.pop(context);
          },
          error: (failure) {
            showCustomErrorToast(failure.message);
          },
        );
      },
      child: const _CreateUserView(),
    );
  }
}

class _CreateUserView extends StatelessWidget {
  const _CreateUserView();

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: CustomScrollView(
        slivers: [
          const _CreateUserHeader(),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const _CreateUserForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateUserHeader extends StatelessWidget {
  const _CreateUserHeader();

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
        onPressed: () => Navigator.pop(context),
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
              Text("Create User", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text(
                "Add a new user to the system",
                style: StylesConstants.hintGrey14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateUserForm extends StatefulWidget {
  const _CreateUserForm();

  @override
  State<_CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<_CreateUserForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      showCustomWarningToast("Please complete required fields");
      return;
    }

    context.read<UserBloc>().add(
      UserEvent.createUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
      ),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter email";
              }
              return null;
            },
          ),

          SizedBox(height: 30.h),

          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              final loading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return GenericElevatedButton(
                title: "Create User",
                loading: loading,
                onPressed: _submit,
              );
            },
          ),
        ],
      ),
    );
  }
}
