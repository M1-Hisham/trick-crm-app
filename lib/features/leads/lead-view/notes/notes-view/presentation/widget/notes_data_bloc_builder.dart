import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_text_form_field.dart';

class NotesDataBlocBuilder extends StatelessWidget {
  const NotesDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: '',
      labelText: 'Notes',
      controller: TextEditingController(text: 'test'),
    );
  }
}
