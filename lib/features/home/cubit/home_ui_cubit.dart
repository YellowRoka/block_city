import 'package:block_city/repostiry/model/weather_model.dart';
import 'package:block_city/repostiry/open_weather_dio_api.dart';
import 'package:block_city/service/geolocator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'home_ui_state.dart';
part 'home_ui_cubit.freezed.dart';

@injectable
class HomeUICubit extends Cubit<HomeUIState> {
  final OpenWeatherDioApi    openWeatherApi;
  final GeolocatorService geolocatorService;

  
  HomeUICubit(
    this.openWeatherApi,
    this.geolocatorService,
  ) : super( const HomeUIState.initial() ){
    getWeatherData();
  }
  
  Future<void> getWeatherData() async {
    emit( const HomeUIState.loading() );
    await geolocatorService.checkPermissions();

    geolocatorService.getCurrentPosition();
    final Position locationData = await geolocatorService.getCurrentPosition();
    
    final result = await openWeatherApi.getData( 
      lat: locationData.latitude.toString(), //47.995343,
      lon: locationData.longitude.toString(), //19.82646,
    );
    await Future.delayed( const Duration( milliseconds: 1000 ) );

    if(result == null){
      emit( const HomeUIState.error('Something went wrong! :(') ); 
    }
    else{
      emit( HomeUIState.loaded(result) );
    }
  }

  Future<void> refreshData() async {
    await getWeatherData();
  }
}
