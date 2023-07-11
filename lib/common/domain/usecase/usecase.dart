import 'package:fpdart/fpdart.dart';
import 'package:post_task/core/errors/failures/failure.dart';
import 'package:post_task/core/params/no_param.dart';

abstract class UseCase<T, P extends NoParam> {
  const UseCase();

  Future<Either<Failure, T>> call(P parameter);
}