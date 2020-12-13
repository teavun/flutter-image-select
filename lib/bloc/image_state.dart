part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageSelected extends ImageState {
  final File imageFile;

  ImageSelected(this.imageFile);
}
