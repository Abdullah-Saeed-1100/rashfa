import 'package:get_it/get_it.dart';

import '../repos/juice_repo.dart';
import '../repos/juice_repo_impl.dart';
import 'supabase_database_service.dart';
import 'supabase_storage_service.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    // Register Supabase service
    getIt.registerSingleton<SupabaseDatabaseService>(SupabaseDatabaseService());
    getIt.registerSingleton<SupabaseStorageService>(SupabaseStorageService());

    // Register EstateRepo
    getIt.registerSingleton<JuiceRepo>(
      JuiceRepoImpl(
        supabaseDatabaseService: getIt<SupabaseDatabaseService>(),
        supabaseStorageService: getIt<SupabaseStorageService>(),
      ),
    );
  }
}
