import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistsFilterChips extends StatefulWidget {
  const ArtistsFilterChips({super.key});

  @override
  State<ArtistsFilterChips> createState() => _ArtistsFilterChipsState();
}

class _ArtistsFilterChipsState extends State<ArtistsFilterChips> {
  final ValueNotifier<ArtistModel?> _selectedArtist =
      ValueNotifier<ArtistModel?>(null);
  @override
  void dispose() {
    _selectedArtist.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ValueListenableBuilder<ArtistModel?>(
        valueListenable: _selectedArtist,
        builder: (context, selected, child) {
          return BlocBuilder<ArtistBloc, ArtistState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox.shrink(),
                loading: () => CupertinoActivityIndicator(
                  color: ColorConstant.darkModeText,
                ),
                loaded: (artists) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: artists.length,
                  separatorBuilder: (_, _) => SizedBox(width: 8.w),
                  itemBuilder: (context, index) {
                    final artist = artists[index];
                    final isSelected = selected == artist;
                    return Row(
                      children: [
                        /// CLEAR FILTER BUTTON
                        if (isSelected)
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: GenericElevatedButton.circular(
                              size: 35.r,
                              backgroundColor: ColorConstant.darkModePrimary
                                  .withAlpha(180),
                              icon: Icon(
                                Icons.close,
                                color: ColorConstant.whiteColor,
                              ),
                              onPressed: () {
                                _selectedArtist.value = null;
                                context.read<SongBloc>().add(
                                  const SongEvent.loadSongs(),
                                );
                              },
                            ),
                          ),

                        GestureDetector(
                          onTap: () {
                            _selectedArtist.value = artist;
                            context.read<SongBloc>().add(
                              SongEvent.filterSongByArtist(id: artist.id),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? ColorConstant.activeGreen
                                  : Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Text(
                              artist.name,
                              style: StylesConstants.textDark14w600.copyWith(
                                color: isSelected
                                    ? ColorConstant.activeLightGreen
                                    : ColorConstant.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
