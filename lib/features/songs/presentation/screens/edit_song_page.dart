import 'dart:io';

import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/generic_image_picker.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/image_picker_helper.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dialog.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dropdown/generic_dropdown.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/core/utils/generic_toasts.dart';
import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';
import 'package:artist_ums/features/songs/domain/entities/song_model.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_event.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditSongPage extends StatelessWidget {
  final String id;

  const EditSongPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SongBloc, SongState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            showCustomWarningToast("Song updated successfully");
            context.pop(context);
          },
          error: (msg) {
            showCustomErrorToast(msg);
          },
        );
      },
      child: _EditSongView(id: id),
    );
  }
}

class _EditSongView extends StatelessWidget {
  final String id;

  const _EditSongView({required this.id});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: CustomScrollView(
        slivers: [
          const _EditSongHeader(),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: _EditSongForm(id: id),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditSongHeader extends StatelessWidget {
  const _EditSongHeader();

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
              Text("Edit Song", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text(
                "Update your track information",
                style: StylesConstants.hintGrey14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditSongForm extends StatefulWidget {
  final String id;

  const _EditSongForm({required this.id});

  @override
  State<_EditSongForm> createState() => _EditSongFormState();
}

class _EditSongFormState extends State<_EditSongForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController albumController;

  String? artistId;
  final ValueNotifier<List<File>> cover = ValueNotifier<List<File>>([]);

  SongModel? song;

  @override
  void initState() {
    super.initState();
    song = context.read<SongBloc>().state.maybeWhen(
      loaded: (songs) =>
          songs.where((e) => e.id == widget.id).cast<SongModel?>().firstOrNull,
      orElse: () => null,
    );
    titleController = TextEditingController(text: song?.title ?? "");
    albumController = TextEditingController(text: song?.album ?? "");
    artistId = song?.artistId;

    if (song?.coverUrl != null) {
      ImagePickerHelper().urlToFile(song!.coverUrl!).then((file) {
        cover.value = [file];
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    albumController.dispose();
    cover.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<SongBloc>().add(
      SongEvent.updateSong(
        id: widget.id,
        artistId: artistId!,
        title: titleController.text.trim(),
        album: albumController.text.trim(),
        coverUrl: cover.value.firstOrNull,
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
          ValueListenableBuilder<List<File>>(
            valueListenable: cover,
            builder: (context, state, child) {
              return GenericImagePicker(
                key: ValueKey(state),
                selectedFiles: state,
                hasBorder: false,
                title: "Song Cover",
                limit: 1,
                onChanged: (files) {
                  cover.value = files;
                },
              );
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
            initialValue: artists
                .where((a) => a.id == artistId)
                .cast<ArtistModel?>()
                .firstOrNull,
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
                title: "Update Song",
                loading: loading,
                onPressed: () => GenericDialog.show(
                  context,
                  title: 'Update Song',
                  subtitle: 'Are you sure you want to update this song?',
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
