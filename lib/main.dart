import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/features/home/logic/cubit/fetch_all_juices_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/repos/juice_repo.dart';
import 'core/services/get_it_service.dart';
import 'core/services/simple_bloc_observer.dart';
import 'core/utils/app_keys.dart';
import 'features/add_juice/logic/cubit/add_juices_cubit.dart';
import 'features/details_juice/logic/cubit/delete_juice_cubit.dart';
import 'features/home/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important

  // Initialize Supabase
  await Supabase.initialize(
    url: AppKeys.supabaseUrl,
    anonKey: AppKeys.supabaseAnonKey,
  );
  // Setup service locator
  ServiceLocator.setup();

  // Set up Bloc observer
  Bloc.observer = SimpleBlocObserver();

  //
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  //
  runApp(const RashfaApp());
}

class RashfaApp extends StatelessWidget {
  const RashfaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FetchAllJuicesCubit(juiceRepo: getIt.get<JuiceRepo>())
                    ..fetchAllJuices(),
        ),
        BlocProvider(
          create:
              (context) => AddJuicesCubit(juiceRepo: getIt.get<JuiceRepo>()),
        ),
        BlocProvider(
          create:
              (context) => DeleteJuiceCubit(juiceRepo: getIt.get<JuiceRepo>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF212325),
          fontFamily: "Marhey",
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
