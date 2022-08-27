import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/states.dart';
import 'package:travel_app/models/place_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({
    required this.dataServices,
  }) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices dataServices;
  late List<PlaceModel> places;

  void loadPlaces() async {
    try {
      emit(LoadingState());
      places = await dataServices.getPlaces();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  void loadDetails(PlaceModel place) {
    emit(DetailsState(place));
  }

  void goBack() {
    emit(LoadedState(places));
  }

  void logout() {
    emit(WelcomeState());
  }
}
