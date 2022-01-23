import 'package:equatable/equatable.dart';
import 'package:training_app/models/filter_response.dart';
import 'package:training_app/models/training_response.dart';

abstract class TrainingState extends Equatable {
  const TrainingState();

  @override
  List<Object> get props => [];
}

class TrainingInitial extends TrainingState {}

class TrainingLoading extends TrainingState {}

class TrainingCourseLoaded extends TrainingState {
  final TrainingModelResponse trainingModelResponse;

  const TrainingCourseLoaded({required this.trainingModelResponse}) : super();
  @override
  List<Object> get props => [trainingModelResponse];

  @override
  String toString() => 'TrainingCourseLoaded $trainingModelResponse';
}

class FiltersLoaded extends TrainingState {
  final FilterModelResponse filterModelResponse;

  const FiltersLoaded({required this.filterModelResponse}) : super();
  @override
  List<Object> get props => [filterModelResponse];

  @override
  String toString() => 'FiltersLoaded $filterModelResponse';
}

class TrainingFailure extends TrainingState {
  final String error;

  const TrainingFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' TrainingFailure { error: $error }';
}
