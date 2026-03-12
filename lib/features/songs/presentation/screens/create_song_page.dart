import 'dart:io';

import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/generic_image_picker.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dropdown/generic_dropdown.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/core/utils/generic_toasts.dart';

import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';

import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_event.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateSongPage extends StatelessWidget {
  final String? id;

  const CreateSongPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SongBloc, SongState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            showCustomSuccessToast("Song created successfully");
            Navigator.pop(context);
          },
          error: (msg) {
            showCustomErrorToast(msg);
          },
        );
      },
      child: const _CreateSongView(),
    );
  }
}

class _CreateSongView extends StatelessWidget {
  const _CreateSongView();

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: CustomScrollView(
        slivers: [
          const _CreateSongHeader(),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const _CreateSongForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateSongHeader extends StatelessWidget {
  const _CreateSongHeader();

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
              Text("Create Song", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text(
                "Add a new track to your catalog",
                style: StylesConstants.hintGrey14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateSongForm extends StatefulWidget {
  const _CreateSongForm();

  @override
  State<_CreateSongForm> createState() => _CreateSongFormState();
}

class _CreateSongFormState extends State<_CreateSongForm> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final albumController = TextEditingController();

  String? artistId;
  List<File> cover = [];

  @override
  void dispose() {
    titleController.dispose();
    albumController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      showCustomWarningToast("Please complete required fields");
      return;
    }

    if (artistId == null) {
      showCustomWarningToast("Please select an artist");
      return;
    }

    context.read<SongBloc>().add(
      SongEvent.createSong(
        artistId: artistId!,
        title: titleController.text.trim(),
        album: albumController.text.trim(),
        coverUrl: cover.isNotEmpty ? cover.first : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final artists = context.read<ArtistBloc>().state.maybeWhen(
      loaded: (artists) => artists,
      orElse: () => <ArtistModel>[],
    );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          GenericImagePicker(
            selectedFiles: cover,
            hasBorder: false,
            title: "Song Cover",
            limit: 1,
            onChanged: (files) {
              setState(() {
                cover = files;
              });
            },
          ),

          SizedBox(height: 20.h),

          GenericTextField(
            controller: titleController,
            hint: "Song Title",
            icon: ImageConstants.userLogoLottie,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter song title";
              }
              return null;
            },
          ),

          SizedBox(height: 14.h),

          GenericTextField(
            controller: albumController,
            hint: "Album",
            icon: ImageConstants.userLogoLottie,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter album name";
              }
              return null;
            },
          ),

          SizedBox(height: 14.h),

          GenericDropdown<ArtistModel>(
            title: "Artist",
            hintText: "Select Artist",
            items: artists,
            labelBuilder: (artist) => artist.name,
            validator: (value) {
              if (value == null) {
                return "Artist is required";
              }
              return null;
            },
            onChanged: (artist) {
              artistId = artist?.id;
            },
          ),

          SizedBox(height: 30.h),

          BlocBuilder<SongBloc, SongState>(
            builder: (context, state) {
              final loading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return GenericElevatedButton(
                title: "Create Song",
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
