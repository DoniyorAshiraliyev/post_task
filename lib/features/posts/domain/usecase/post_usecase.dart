import 'package:post_task/common/domain/usecase/usecase.dart';
import 'package:post_task/core/params/no_param.dart';


abstract class PostUseCase<T, P extends NoParam> extends UseCase<T, P> {
  const PostUseCase();
}