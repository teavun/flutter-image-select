import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_select/bloc/image_bloc.dart';

class ImageSelectView extends StatelessWidget {
  final String title;

  const ImageSelectView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageBloc>(
      create: (BuildContext context) => ImageBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state is ImageInitial) {
              return Column(
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ImageBloc>(context)
                            .add(SelectAnImage());
                      },
                      icon: Icon(Icons.photo))
                ],
              );
            }
            if (state is ImageSelected) {
              return Image.file(state.imageFile);
            }
          },
        ),
      ),
    );
  }
}
