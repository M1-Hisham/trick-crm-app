import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<XFile?> {
  ImagePickerCubit() : super(null);
  XFile? image;
}
