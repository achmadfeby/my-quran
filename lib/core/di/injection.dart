import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_quran/feature/quran/data/datasource/quran_remote_datasource.dart';
import 'package:my_quran/feature/quran/data/repository/quran_repository_impl.dart';
import 'package:my_quran/feature/quran/domain/repository/quran_repository.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_detail_surah_usecase.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_surahs_usecase.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_bloc.dart';

//Centralized Dependency Injection.
// Bertanggung jawab untuk mendaftarkan seluruh dependency aplikasi,
// mulai dari datasource, repository, usecase hingga bloc.
// Dengan memusatkan konfigurasi dependency di satu tempat:
// - proses testing menjadi lebih mudah
// - dependency lebih mudah diganti
// - mengurangi object creation di UI layer
// Dependency flownya itu = dio -> RemoteDataSource -> Repository -> Usecase -> BLOC

class Injection {
  Injection._();

  static List<RepositoryProvider> repositoryProviders = [
    //HTTP client untuk komunikasi dengan Quran API
    RepositoryProvider<Dio>(
      create: (_) {
        return Dio(
          BaseOptions(
            baseUrl: 'https://api.alquran.cloud/v1',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );
      },
    ),
    //Layer yang berkomunikasi langsung dengan API
    RepositoryProvider<QuranRemoteDatasource>(
      create: (context) {
        return QuranRemoteDatasource(
          context.read<Dio>(),
        );
      },
    ),
    //Mengubah model dari datasource menjadi entity domain
    RepositoryProvider<QuranRepository>(
      create: (context) {
        return QuranRepositoryImpl(
          context.read<QuranRemoteDatasource>(),
        );
      },
    ),
    //Business logic untuk mengambil List Surah
    RepositoryProvider<GetSurahsUsecase>(
      create: (context) {
        return GetSurahsUsecase(
          context.read<QuranRepository>(),
        );
      },
    ),
    //Business logic untuk mengambil detail surah
    RepositoryProvider<GetSurahDetailUsecase>(create: (context) {
      return GetSurahDetailUsecase(
        context.read<QuranRepository>(),
      );
    }),
    //Singleton audio player yang digunakan AudioBloc
    RepositoryProvider<AudioPlayer>(
      create: (_) => AudioPlayer(),
    ),
  ];

  static List<BlocProvider> blocProviders = [
    //Mengelola state List surah
    BlocProvider<SurahBloc>(
      create: (context) {
        return SurahBloc(
          context.read<GetSurahsUsecase>(),
        )..add(GetSurahsEvent());
      },
    ),
    // Mengelola state detail surah dan list ayat
    BlocProvider<SurahDetailBloc>(
      create: (context) {
        return SurahDetailBloc(
          context.read<GetSurahDetailUsecase>(),
        );
      },
    ),
    // Mengelola seluruh playback audio
    BlocProvider<AudioBloc>(
      create: (context) {
        return AudioBloc(
          context.read<AudioPlayer>(),
        );
      },
    ),
  ];
}
