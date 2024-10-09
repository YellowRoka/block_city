// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../features/home/cubit/home_ui_cubit.dart' as _i490;
import '../repostiry/open_weather_api.dart' as _i111;
import '../repostiry/open_weather_dio_api.dart' as _i67;
import '../service/geolocator_service.dart' as _i849;
import '../system/router/app_router.dart' as _i485;
import 'modules/shared_preferences_module/shared_preferences_module.dart'
    as _i295;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.factory<_i111.OpenWeatherApi>(() => _i111.OpenWeatherApi());
  gh.factory<_i849.GeolocatorService>(() => _i849.GeolocatorService());
  gh.factory<_i485.AppRouter>(() => _i485.AppRouter());
  gh.factory<_i67.OpenWeatherDioApi>(() => _i67.OpenWeatherDioApi());
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => sharedPreferencesModule.initSharedPref(),
    preResolve: true,
  );
  gh.factory<_i490.HomeUICubit>(() => _i490.HomeUICubit(
        gh<_i67.OpenWeatherDioApi>(),
        gh<_i849.GeolocatorService>(),
      ));
  return getIt;
}

class _$SharedPreferencesModule extends _i295.SharedPreferencesModule {}
