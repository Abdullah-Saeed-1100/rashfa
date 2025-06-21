import 'package:dartz/dartz.dart';
import 'package:rashfa/core/errors/failures.dart';
import 'package:rashfa/core/models/juice_model.dart';
import 'package:rashfa/core/repos/juice_repo.dart';
import '../services/supabase_database_service.dart';
import '../services/supabase_storage_service.dart';

class JuiceRepoImpl implements JuiceRepo {
  final SupabaseDatabaseService supabaseDatabaseService;
  final SupabaseStorageService supabaseStorageService;
  JuiceRepoImpl({
    required this.supabaseDatabaseService,
    required this.supabaseStorageService,
  });

  @override
  Future<Either<Failure, String>> addJuice({
    required JuiceModel juiceModel,
  }) async {
    try {
      // upload the image
      final imageUrl = await supabaseStorageService.uploadFile(
        file: juiceModel.image!,
        path: "juices_images/",
        bucket: "bagar",
      );

      juiceModel.imageUrl = imageUrl; // add the image url to the juice model

      // insert the juice
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
