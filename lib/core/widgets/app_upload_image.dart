import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../resources/resources.dart';

class AppUploadImage extends StatefulWidget {
  const AppUploadImage({super.key});

  @override
  State<AppUploadImage> createState() => _AppUploadImageState();
}

class _AppUploadImageState extends State<AppUploadImage> {
  XFile? pickedFile;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        imageShowDialogAdd();
      },
      splashColor: R.colors.primaryColor,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: R.colors.secGray,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: pickedFile == null
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Color(0xff727272),
                  ),
                  Text(
                    "Uploud",
                    style: TextStyle(
                      color: Color(0xff727272),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            : ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.file(
                  fit: BoxFit.fill,
                  File(pickedFile!.path),
                ),
              ),
      ),
    );
  }

  void imageShowDialogAdd() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Please choose an option',
                    style: R.textStyles.font17whiteW600.copyWith(
                      color: R.colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: uploadImageCamera,
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera,
                          color: R.colors.primaryColor,
                          size: 27.sp,
                        ),
                        spacingH(12),
                        Text(
                          'Camera',
                          style: R.textStyles.font20ShadowGray29W500.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: uploadImageGallery,
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo,
                          color: R.colors.primaryColor,
                          size: 27.sp,
                        ),
                        spacingH(12),
                        Text(
                          'Gallery',
                          style: R.textStyles.font20ShadowGray29W500,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void uploadImageGallery() async {
    Navigator.pop(context);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.pickedFile = pickedFile;
    });
  }

  void uploadImageCamera() async {
    Navigator.pop(context);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      this.pickedFile = pickedFile;
    });
  }
}
