import 'dart:developer';
import 'dart:io';

import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/generic_full_screen_image.dart';
import 'package:artist_ums/core/presentation/generic_image_picker/image_picker_helper.dart';
import 'package:artist_ums/core/presentation/widgets/generic_note.dart';
import 'package:artist_ums/features/dashboard/presentation/widgets/generic_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class GenericImagePicker extends FormField<List<File>> {
  final Function(List<File>) onChanged;
  final num? limit;
  final bool hasBorder;
  final String title;

  GenericImagePicker({
    super.key,
    required List<File> selectedFiles,
    required this.onChanged,
    this.limit,
    this.hasBorder = true,
    this.title = "Upload Image",
    String? Function(List<File>?)? validator,
  }) : super(
         initialValue: selectedFiles,
         validator: (value) {
           if (validator != null) return validator(value);

           if (value == null || value.isEmpty) {
             return "Please upload at least one image.";
           }

           return null;
         },
         builder: (state) {
           return _ImagePickerBody(
             state: state,
             title: title,
             limit: limit,
             onChanged: onChanged,
             hasBorder: hasBorder,
           );
         },
       );
}

class _ImagePickerBody extends StatelessWidget {
  final FormFieldState<List<File>> state;
  final num? limit;
  final bool hasBorder;
  final String title;
  final Function(List<File>) onChanged;

  const _ImagePickerBody({
    required this.state,
    required this.limit,
    required this.onChanged,
    required this.hasBorder,
    required this.title,
  });

  Future<void> _pickImage(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take Photo"),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from Gallery"),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final file = source == ImageSource.camera
        ? await ImagePickerHelper.pickImageFromCamera(crop: true)
        : await ImagePickerHelper.pickImageFromGallery(crop: true);

    if (file == null) return;

    final updated = [...?state.value, file];

    if (limit != null && updated.length > limit!) {
      log("Image limit exceeded: $limit");
      return;
    }
    state.didChange(updated);
    onChanged(updated);
    state.validate();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = state.hasError && state.errorText != null;
    final images = state.value ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _pickImage(context),
          child: Container(
            padding: hasError
                ? EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h)
                : EdgeInsets.zero,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: hasBorder
                  ? Border.all(
                      color: hasError
                          ? ColorConstant.errorRed
                          : Colors.grey.shade300,
                    )
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: StylesConstants.textDark14w500),

                SizedBox(height: 8.h),

                /// Placeholder
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: hasError
                          ? ColorConstant.errorRed
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 40.sp,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 8.h),

                if (hasError)
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Text(
                      state.errorText!,
                      style: TextStyle(
                        color: ColorConstant.errorRed,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),

                SizedBox(height: 8.h),

                if (images.isNotEmpty) ...[
                  Text(
                    "Uploaded Images",
                    style: StylesConstants.textDark14w500,
                  ),

                  SizedBox(height: 8.h),

                  GenericGridview(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    children: images.asMap().entries.map((entry) {
                      final index = entry.key;
                      final file = entry.value;

                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: ImagePreviewer(
                              imagePaths: images.map((e) => e.path).toList(),
                              initialIndex: index,
                            ),
                          ),

                          /// Delete button
                          Positioned(
                            top: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                final updated = [...images]..remove(file);
                                state.didChange(updated);
                                onChanged(updated);
                              },
                              child: Container(
                                padding: EdgeInsets.all(3.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConstant.errorRed,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10.h),
                  GenericNote(
                    title: 'Note:',
                    titleValue:
                        'There is a limit of ${(limit ?? 0).toInt()} image, Please remove current selected to add a new one.',
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
