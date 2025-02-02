import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../resources/resources.dart';

class AppUploadImage extends StatefulWidget {
  final Function(XFile?) onImageSelected;
  const AppUploadImage({super.key, required this.onImageSelected});

  @override
  State<AppUploadImage> createState() => _AppUploadImageState();
}

class _AppUploadImageState extends State<AppUploadImage> {
  XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showImageSourceDialog,
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
                    "Upload",
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
                  File(pickedFile!.path),
                  fit: BoxFit.fill,
                ),
              ),
      ),
    );
  }

  void _showImageSourceDialog() {
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
              const SizedBox(height: 10),
              _buildDialogOption(
                icon: Icons.camera,
                text: 'Camera',
                onTap: _uploadImageFromCamera,
              ),
              _buildDialogOption(
                icon: Icons.photo,
                text: 'Gallery',
                onTap: _uploadImageFromGallery,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDialogOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: R.colors.primaryColor,
              size: 27.sp,
            ),
            spacingH(12),
            Text(
              text,
              style: R.textStyles.font20ShadowGray29W500.copyWith(
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadImageFromGallery() async {
    Navigator.pop(context);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _setPickedFile(pickedFile);
  }

  Future<void> _uploadImageFromCamera() async {
    Navigator.pop(context);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _setPickedFile(pickedFile);
  }

  void _setPickedFile(XFile? pickedFile) {
    setState(() {
      if (pickedFile != null) {
        this.pickedFile = pickedFile;
        widget.onImageSelected(pickedFile);
      }
    });
  }
}
