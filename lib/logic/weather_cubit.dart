import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_search/logic/weather_states.dart';
import 'package:weather_search/models/weather_model.dart';
import 'package:weather_search/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherService ) : super(InitialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
void getWeather({required String cityName})async{
  emit(WeatherLoading());
  try{
   weatherModel = await weatherService.getWeather(cityName: cityName);
    emit(WeatherSuccess());
  }catch(e){
    emit(WeatherFailure());
  }
  


}
}