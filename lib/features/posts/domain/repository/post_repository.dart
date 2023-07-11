import 'package:fpdart/fpdart.dart';
import 'package:post_task/core/errors/failures/failure.dart';

abstract class PostRepository {
  const PostRepository();

  Future<Either<Failure, List>> getAllImages();
}