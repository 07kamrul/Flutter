import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_management_project/data/weather_repository.dart';
import 'package:state_management_project/state/weather_store.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    final reactiveModel = Injector.getAsReactive<WeatherStore>();
    reactiveModel.setState((store) => store.getWeather(cityName),
        onError: (context, error) {
      if (error is NetworkError) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Couldn't fetch weather. Is tyhe device online?"),
          ),
        );
      }else{
        throw error;
      }
    });
  }
}
