import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trick_crm_app/core/widgets/app_upload_image.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';

List<Widget> uploadImage({required Function(XFile?) fun}) {
  return [
    Text(
      "Image",
      style: R.textStyles.font17PrimaryW600,
    ),
    spacingV(13),
    Row(
      children: [
        AppUploadImage(
          onImageSelected: fun,
        ),
        spacingH(14),
        const Text("Accept images: JPG, PNG,\nJPG2000, GIF,...")
      ],
    ),
  ];
}
