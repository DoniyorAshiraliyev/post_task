import 'package:flutter/material.dart';
import 'package:post_task/core/params/no_param.dart';
import 'package:post_task/features/posts/domain/entity/post/post_model.dart';
import 'package:post_task/features/posts/domain/usecase/post_usecase.dart';

class PostController with ChangeNotifier {
  final PostUseCase<List<Post>, NoParam> useCase;

  PostController({required this.useCase})
      : list = [],
        isLoading = false {
    getAllImage();
  }

  List<Post> list;
  bool isLoading;

  Future<void> getAllImage() async {
    isLoading = true;
    notifyListeners();

    final result = await useCase(const NoParam());

    result.fold(
      (l) {
        // error  msg
        debugPrint(l.message);
      },
      (r) {
        list = r;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
