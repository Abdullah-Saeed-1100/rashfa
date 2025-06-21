import 'package:dartz/dartz.dart';
import 'package:rashfa/core/errors/failures.dart';
import 'package:rashfa/core/models/juice_model.dart';
import 'package:rashfa/core/repos/juice_repo.dart';
import '../services/supabase_database_service.dart';

class JuiceRepoImpl implements JuiceRepo {
  final SupabaseDatabaseService supabaseDatabaseService;
  JuiceRepoImpl({required this.supabaseDatabaseService});

  @override
  Future<Either<Failure, String>> addJuice({
    required JuiceModel juiceModel,
  }) async {
    try {
      await supabaseDatabaseService.insertRow(
        table: 'juices',
        values: juiceModel.toJson(),
      );
      return const Right('تمت الاضافة بنجاح');
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteJuice({required int id}) async {
    try {
      await supabaseDatabaseService.deleteRow(table: 'juices', id: id);
      return const Right('تمت الحذف بنجاح');
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<JuiceModel>>> getAllJuices() async {
    try {
      final response = await supabaseDatabaseService.fetchAll('juices');
      return Right(response.map((e) => JuiceModel.fromJson(e)).toList());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateJuice({
    required JuiceModel juiceModel,
  }) async {
    try {
      await supabaseDatabaseService.updateRow(
        table: 'juices',
        id: juiceModel.id!,
        values: juiceModel.toJson(),
      );
      return const Right('تم التحديث بنجاح');
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
