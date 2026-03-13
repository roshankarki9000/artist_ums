import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dialog.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

class ArtistTile extends StatelessWidget {
  final ArtistModel artist;

  const ArtistTile({super.key, required this.artist});

  void _delete(BuildContext context) {
    context.read<ArtistBloc>().add(ArtistEvent.deleteArtist(id: artist.id));
  }

  void _edit(BuildContext context) {
    context.push('/artists/edit-artist/${artist.id}');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: artist.coverUrl != null
            ? GenericImage.network(
                artist.coverUrl!,
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
                    ImageConstants.noArtistLogoGif,
                    width: 35.r,
                    height: 35.r,
                  ),
                ),
              ),
      ),
      title: Text(artist.name, style: StylesConstants.textDark16w600),
      subtitle: Text(artist.bio ?? "N/A"),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == 'edit') _edit(context);
          if (value == 'delete') {
            GenericDialog.show(
              context,
              title: 'Delete Artist',
              subtitle: 'Are you sure you want to delete this artist?',
              onYes: () => _delete(context),
            );
          }
        },
        itemBuilder: (_) => [
          const PopupMenuItem(value: 'edit', child: Text("Edit")),
          const PopupMenuItem(value: 'delete', child: Text("Delete")),
        ],
      ),
    );
  }
}
