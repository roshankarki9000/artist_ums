import 'dart:io';

import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/generic_image_picker.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/image_picker_helper.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dialog.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/core/utils/generic_toasts.dart';

import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_event.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditArtistPage extends StatelessWidget {
  final String id;

  const EditArtistPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArtistBloc, ArtistState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            showCustomSuccessToast("Artist updated successfully");
            context.pop(context);
          },
          error: (msg) {
            showCustomErrorToast(msg);
          },
        );
      },
      child: _EditArtistView(id: id),
    );
  }
}

class _EditArtistView extends StatelessWidget {
  final String id;

  const _EditArtistView({required this.id});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: CustomScrollView(
        slivers: [
          const _EditArtistHeader(),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: _EditArtistForm(id: id),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditArtistHeader extends StatelessWidget {
  const _EditArtistHeader();

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
              Text("Edit Artist", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text(
                "Update artist information",
                style: StylesConstants.hintGrey14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditArtistForm extends StatefulWidget {
  final String id;

  const _EditArtistForm({required this.id});

  @override
  State<_EditArtistForm> createState() => _EditArtistFormState();
}

class _EditArtistFormState extends State<_EditArtistForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController bioController;

  final ValueNotifier<List<File>> cover = ValueNotifier<List<File>>([]);

  ArtistModel? artist;

  @override
  void initState() {
    super.initState();

    artist = context.read<ArtistBloc>().state.maybeWhen(
      loaded: (artists) => artists
          .where((e) => e.id == widget.id)
          .cast<ArtistModel?>()
          .firstOrNull,
      orElse: () => null,
    );

    nameController = TextEditingController(text: artist?.name ?? "");
    bioController = TextEditingController(text: artist?.bio ?? "");

    if (artist?.coverUrl != null) {
      ImagePickerHelper().urlToFile(artist!.coverUrl!).then((file) {
        cover.value = [file];
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    cover.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<ArtistBloc>().add(
      ArtistEvent.updateArtist(
        id: widget.id,
        name: nameController.text.trim(),
        bio: bioController.text.trim(),
        coverUrl: cover.value.firstOrNull,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ValueListenableBuilder<List<File>>(
            valueListenable: cover,
            builder: (context, state, child) {
              return GenericImagePicker(
                key: ValueKey(state),
                selectedFiles: state,
                hasBorder: false,
                title: "Artist Cover",
                limit: 1,
                onChanged: (files) {
                  cover.value = files;
                },
              );
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
                title: "Update Artist",
                loading: loading,
                onPressed: () => GenericDialog.show(
                  context,
                  title: 'Update Artist',
                  subtitle: 'Are you sure you want to update this artist?',
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
