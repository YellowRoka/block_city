part of 'home_ui_cubit.dart';

@freezed
class HomeUIState with _$HomeUIState {
  const factory HomeUIState.initial() = _InitialState;
  const factory HomeUIState.loading() = _LoadingState;
  const factory HomeUIState.loaded(WeatherModel weather) = _LoadedState;
  const factory HomeUIState.error(String error) = _ErrorState;
}
