import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/features/songs/domain/entities/song_model.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SongTile extends StatelessWidget {
  final SongModel song;

  const SongTile({super.key, required this.song});

  void _delete(BuildContext context) {
    context.read<SongBloc>().add(SongEvent.deleteSong(id: song.id));
  }

  void _edit(BuildContext context) {
    context.push('/songs/edit-song/${song.id}');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 6.h),

      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: song.coverUrl != null
            ? GenericImage.network(
                song.coverUrl!,
                width: 50.r,
                height: 50.r,
                fit: BoxFit.cover,
              )
            : Container(
                width: 50.r,
                height: 50.r,
                color: ColorConstant.disabledBackground1,
                child: Center(
                  child: GenericImage.asset(
                    ImageConstants.noMusicLogoGif,
                    width: 35.r,
                    height: 35.r,
                  ),
                ),
              ),
      ),

      title: Text(song.title, style: StylesConstants.textDark16w600),

      subtitle: Text(
        song.album ?? "N/A",
        style: StylesConstants.textDark14w400,
      ),

      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == 'delete') _delete(context);
          if (value == 'edit') _edit(context);
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'edit',
            child: Text("Edit", style: StylesConstants.textDark16w400),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text("Delete", style: StylesConstants.textDark16w400),
          ),
        ],
      ),
    );
  }
}
