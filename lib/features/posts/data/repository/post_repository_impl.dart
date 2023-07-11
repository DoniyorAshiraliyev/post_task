import 'package:fpdart/fpdart.dart';
import 'package:post_task/common/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:post_task/core/errors/exceptions/network_exceptions.dart';
import 'package:post_task/core/errors/failures/failure.dart';
import 'package:post_task/core/errors/failures/network_failure.dart';
import 'package:post_task/core/errors/failures/unexpected_failure.dart';
import 'package:post_task/core/utils/apis/apis.dart';
import 'package:post_task/features/posts/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final RemoteDataSource remoteDataSource;

  const PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List>> getAllImages() async {
    try {
      // TODO 1.check ? remote : local
      final data = await remoteDataSource.methodGet(Api.images) as List;
      return right(data);
    } on NetworkException catch (e) {
      return left(NetworkFailure(e.message));
    } catch (e) {
      return left(UnexpectedFailure(e.toString()));
    }
  }
}
