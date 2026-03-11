import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/glow.dart';
import 'package:artist_ums/core/utils/extensions/date_time_extension.dart';
import 'package:artist_ums/core/utils/extensions/string_extension.dart';
import 'package:artist_ums/features/activity_logs/presentation/bloc/activity_log_bloc.dart';
import 'package:artist_ums/features/activity_logs/presentation/bloc/activity_log_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitiesLog extends StatefulWidget {
  const ActivitiesLog({super.key});

  @override
  State<ActivitiesLog> createState() => _ActivitiesLogState();
}

class _ActivitiesLogState extends State<ActivitiesLog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            'Activity Logs',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        BlocBuilder<ActivityLogBloc, ActivityLogState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (activities) => ListView.separated(
                padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 22.h),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: activities.length + 1,
                itemBuilder: (context, index) {
                  if (index == activities.length) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Center(
                        child: Text(
                          'There is no more activity right now',
                          style: StylesConstants.hintGrey14w400.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    );
                  }

                  return _ActivityLog(
                    action: activities[index].action,
                    createdAt: activities[index].createdAt,
                    entity: activities[index].entity,
                    description: activities[index].description ?? 'N/a',
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
              ),
              orElse: () => const Center(child: CupertinoActivityIndicator()),
            );
          },
        ),
      ],
    );
  }
}

class _ActivityLog extends StatelessWidget {
  const _ActivityLog({
    required this.description,
    required this.createdAt,
    required this.action,
    required this.entity,
  });

  final String description;
  final DateTime createdAt;
  final String action;
  final String entity;

  @override
  Widget build(BuildContext context) {
    Color insertColor = Color(0xFFEAF3FF);
    return Glow(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: action.toLowerCase() == 'insert' ? insertColor : Colors.amber,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 15,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Row(
          spacing: 10.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(35.r),
              child: Image.asset(
                'assets/gifs/notice.gif',
                height: 25.r,
                width: 25.r,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.h,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: action.capitalizeFirstLetter),
                            TextSpan(text: ' '),
                            TextSpan(text: entity.toLowerCase()),
                          ],
                          style: StylesConstants.textDark14w600,
                        ),
                      ),
                      Text(
                        createdAt.formatToDateTimeString(
                          format: 'MMMM dd, yyyy',
                        ),
                        style: StylesConstants.textDark14w700,
                      ),
                    ],
                  ),
                  Text(
                    description.toParagraph,
                    style: StylesConstants.hintGrey14w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
