import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dialog.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/presentation/widgets/glow.dart';
import 'package:artist_ums/core/utils/extensions/num_extension.dart';
import 'package:artist_ums/features/users/domain/entities/user_model.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({super.key, required this.user});

  void _delete(BuildContext context) {
    context.read<UserBloc>().add(UserEvent.deleteUser(id: user.id));
  }

  void _edit(BuildContext context) {
    context.push('/users/edit-user/${user.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Glow(
      child: ListTile(
        isThreeLine: true,
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 6.h),

        leading: SizedBox(
          width: 50.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: user.coverUrl != null
                ? GenericImage.network(user.coverUrl!, fit: BoxFit.cover)
                : Container(
                    color: ColorConstant.disabledBackground1,
                    child: Center(
                      child: GenericImage.asset(
                        ImageConstants.notFoundLogoGif,
                        width: 35.r,
                        height: 35.r,
                      ),
                    ),
                  ),
          ),
        ),

        title: Text(user.name, style: StylesConstants.textDark16w600),

        subtitle: Text(
          "${user.email}\n"
          "Total Artists: ${user.artistsCreated.twoDigits}\n"
          "Total Songs: ${user.songsCreated.twoDigits}",
        ),

        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') _edit(context);
            if (value == 'delete') {
              GenericDialog.show(
                context,
                title: 'Delete User',
                subtitle: 'Are you sure you want to delete this user?',
                onYes: () => _delete(context),
              );
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'edit', child: Text("Edit")),
            PopupMenuItem(value: 'delete', child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
