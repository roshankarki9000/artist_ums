import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/image_picker_helper.dart';
import 'package:artist_ums/features/profile/domain/entities/profile_model.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWidget extends StatelessWidget {
  final ProfileModel profile;
  const AvatarWidget({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(80.r),
          child: profile.coverUrl != null
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
                    child: GenericImage.lottieAsset(
                      ImageConstants.avatarLogoLottie,
                    ),
                  ),
                ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () async {
              final file = await ImagePickerHelper.pickImageFromGallery();
              if (file != null && context.mounted) {
                context.read<ProfileBloc>().add(
                  ProfileEvent.updateUser(
                    id: profile.id,
                    name: profile.name,
                    coverFile: file,
                  ),
                );
              }
            },
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
