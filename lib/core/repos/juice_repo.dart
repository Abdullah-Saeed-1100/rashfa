import 'package:dartz/dartz.dart';
import 'package:rashfa/core/errors/failures.dart';
import 'package:rashfa/core/models/juice_model.dart';

abstract class JuiceRepo {
  Future<Either<Failure, List<JuiceModel>>> getAllJuices();
  Future<Either<Failure, String>> addJuice({required JuiceModel juiceModel});
  Future<Either<Failure, String>> updateJuice({required JuiceModel juiceModel});
  Future<Either<Failure, String>> deleteJuice({required int id});
}
