import 'package:dartz/dartz.dart';
import 'package:learningapp/core/errors/failure.dart';


typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;