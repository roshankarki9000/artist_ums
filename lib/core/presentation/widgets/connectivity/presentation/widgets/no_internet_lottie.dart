import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/bloc/connectivity_bloc.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/bloc/connectivity_event.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/utils/debounder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetLottie extends StatelessWidget {
  final Debouncer _retryDebouncer;
  NoInternetLottie({super.key}) : _retryDebouncer = Debouncer.medium();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12.r,
              offset: Offset(0, 6.w),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GenericImage.lottieAsset(
              ImageConstants.noInternetLogoLottie,
              width: 200.h,
              repeat: true,
            ),
            SizedBox(height: 16.h),
            Text(
              "No Internet Connection",
              textAlign: TextAlign.center,
              style: StylesConstants.hintGrey18w600,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _retryDebouncer.callAsync(() async {
                context.read<ConnectivityBloc>().add(
                  const ConnectivityEvent.retryPressed(),
                );
              }),
              child: Text("Retry", style: StylesConstants.textDark14w500),
            ),
          ],
        ),
      ),
    );
  }
}
