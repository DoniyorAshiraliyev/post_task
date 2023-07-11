import 'package:fpdart/fpdart.dart';
import 'package:post_task/core/errors/failures/failure.dart';
import 'package:post_task/core/params/no_param.dart';
import 'package:post_task/features/posts/domain/entity/post/post_model.dart';
import 'package:post_task/features/posts/domain/repository/post_repository.dart';
import 'package:post_task/features/posts/domain/usecase/post_usecase.dart';

class GetAllPostUsecase
    extends PostUseCase<List<Post>, NoParam> {
  final PostRepository repository;

  const GetAllPostUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Post>>> call(NoParam parameter) async {

    final result = await repository.getAllImages();

    return result.fold(
      (l) => left(l),
      (r) => right(_parseJson(r)),
    );
  }

  List<Post> _parseJson(List json) {
    return json.map((item) => Post.fromJson(item as Map<String, dynamic>)).toList();
  }
}
