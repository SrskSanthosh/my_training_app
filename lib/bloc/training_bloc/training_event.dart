import 'package:equatable/equatable.dart';
import 'package:training_app/models/models.dart';

abstract class TrainingEvent extends Equatable {
  const TrainingEvent();
  @override
  List<Object> get props => [];
}

class FetchCourseEvent extends TrainingEvent {
  const FetchCourseEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FetchCourseEvent';
}

class FetchFiltersEvent extends TrainingEvent {
  const FetchFiltersEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'FetchFiltersEvent';
}

class ViewDetailsEvent extends TrainingEvent {
  final TrainingList trainingList;
  const ViewDetailsEvent({required this.trainingList});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ViewDetailsEvent';
}
