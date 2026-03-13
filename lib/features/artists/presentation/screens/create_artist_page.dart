import 'dart:io';

import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/generic_image_picker.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/core/utils/generic_toasts.dart';

import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_event.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateArtistPage extends StatelessWidget {
  const CreateArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArtistBloc, ArtistState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            showCustomSuccessToast(message);
            context.pop(context);
          },
          error: (msg) {
            showCustomErrorToast(msg);
          },
        );
      },
      child: const _CreateArtistView(),
    );
  }
}

class _CreateArtistView extends StatelessWidget {
  const _CreateArtistView();

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: CustomScrollView(
        slivers: [
          const _CreateArtistHeader(),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const _CreateArtistForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateArtistHeader extends StatelessWidget {
  const _CreateArtistHeader();

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
              Text("Create Artist", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text(
                "Add a new artist to your catalog",
                style: StylesConstants.hintGrey14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateArtistForm extends StatefulWidget {
  const _CreateArtistForm();

  @override
  State<_CreateArtistForm> createState() => _CreateArtistFormState();
}

class _CreateArtistFormState extends State<_CreateArtistForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final bioController = TextEditingController();

  List<File> cover = [];

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      showCustomWarningToast("Please complete required fields");
      return;
    }

    context.read<ArtistBloc>().add(
      ArtistEvent.createArtist(
        name: nameController.text.trim(),
        bio: bioController.text.trim(),
        coverUrl: cover.isNotEmpty ? cover.first : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          GenericImagePicker(
            selectedFiles: cover,
            hasBorder: false,
            title: "Artist Cover",
            limit: 1,
            onChanged: (files) {
              setState(() {
                cover = files;
              });
            },
          ),

          SizedBox(height: 20.h),

          GenericTextField(
            controller: nameController,
            hint: "Artist Name",
            icon: ImageConstants.userLogoLottie,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter artist name";
              }
              return null;
            },
          ),

          SizedBox(height: 14.h),

          GenericTextField(
            controller: bioController,
            hint: "Artist Bio",
            icon: ImageConstants.userNoddingLogoLottie,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter artist bio";
              }
              return null;
            },
          ),

          SizedBox(height: 30.h),

          BlocBuilder<ArtistBloc, ArtistState>(
            builder: (context, state) {
              final loading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return GenericElevatedButton(
                title: "Create Artist",
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
