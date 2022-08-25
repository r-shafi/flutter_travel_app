import 'package:equatable/equatable.dart';
import 'package:travel_app/models/place_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  final List<PlaceModel> places;

  LoadedState(this.places);

  @override
  List<Object> get props => [places];
}

class DetailsState extends CubitStates {
  final PlaceModel place;

  DetailsState(this.place);

  @override
  List<Object> get props => [place];
}
