import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial());

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    File _image;
    final picker = ImagePicker();
    if (event is SelectAnImage) {
      // todo : android:requestLegacyExternalStorage="true"
      // https://pub.dev/packages/image_picker

      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        yield ImageSelected(_image);
      } else {
        print('No image selected.');
      }
    }
  }
}
