import 'dart:io';

import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/image_picker_helper.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dialog.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/core/utils/generic_toasts.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/profile/domain/entities/profile_model.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_event.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (msg) {
            showCustomSuccessToast("Profile updated successfully");
            context.read<AuthBloc>().add(AuthEvent.checkSession());
            Navigator.pop(context);
          },
          error: (failure) {
            showCustomErrorToast(failure);
          },
        );
      },
      child: _EditProfileView(),
    );
  }
}

class _EditProfileView extends StatelessWidget {
  const _EditProfileView();

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: CustomScrollView(
        slivers: [
          const _EditProfileHeader(),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: _EditProfileForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditProfileHeader extends StatelessWidget {
  const _EditProfileHeader();

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
              Text("Edit profile", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text(
                "Update your profile information",
                style: StylesConstants.hintGrey14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditProfileForm extends StatefulWidget {
  const _EditProfileForm();

  @override
  State<_EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<_EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  File? selectedImage;
  ProfileModel? profile;
  @override
  void initState() {
    super.initState();
    profile = context.read<ProfileBloc>().state.maybeWhen(
      orElse: () => null,
      loaded: (profile) => profile,
    );
    nameController = TextEditingController(text: profile?.name);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final file = await ImagePickerHelper.pickImageFromGallery();

    if (file != null) {
      setState(() {
        selectedImage = file;
      });
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<ProfileBloc>().add(
      ProfileEvent.updateUser(
        id: profile!.id,
        name: nameController.text.trim(),
        coverFile: selectedImage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _ProfileAvatar(
            profile: profile!,
            selectedImage: selectedImage,
            onPick: _pickImage,
          ),

          SizedBox(height: 30.h),

          GenericTextField(
            controller: nameController,
            hint: "Name",
            icon: ImageConstants.userLogoLottie,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
          ),

          SizedBox(height: 30.h),

          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              final loading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return GenericElevatedButton(
                title: "Update profile",
                loading: loading,
                onPressed: () => GenericDialog.show(
                  context,
                  title: 'Update Profile',
                  subtitle: 'Are you sure you want to update?',
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

class _ProfileAvatar extends StatelessWidget {
  final ProfileModel profile;
  final File? selectedImage;
  final VoidCallback onPick;

  const _ProfileAvatar({
    required this.profile,
    required this.selectedImage,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(80.r),
          child: selectedImage != null
              ? Image.file(
                  selectedImage!,
                  width: 120.r,
                  height: 120.r,
                  fit: BoxFit.cover,
                )
              : profile.coverUrl != null
              ? GenericImage.network(
                  profile.coverUrl!,
                  width: 120.r,
                  height: 120.r,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  width: 120.r,
                  height: 120.r,
                  child: Center(
                    child: Transform.scale(
                      scale: 2,
                      child: GenericImage.lottieAsset(
                        ImageConstants.avatarLogoLottie,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onPick,
            child: Container(
              width: 32.r,
              height: 32.r,
              decoration: BoxDecoration(
                color: ColorConstant.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
