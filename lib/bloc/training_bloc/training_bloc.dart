import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/bloc/training_bloc/training_event.dart';
import 'package:training_app/bloc/training_bloc/training_state.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/pages/pages.dart';
import 'package:training_app/styles/styles.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingBloc() : super(TrainingInitial()) {
    on<FetchCourseEvent>(_onFetchCourse);
    on<FetchFiltersEvent>(_onFetchFilter);
    on<ViewDetailsEvent>(_onViewDetails);
  }

  void _onFetchCourse(
      FetchCourseEvent event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      final response = await readJson();
      emit(TrainingCourseLoaded(trainingModelResponse: response!));
    } catch (error) {
      emit(TrainingFailure(error: error.toString()));
    }
  }

  void _onFetchFilter(
      FetchFiltersEvent event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      final response = await loadFilters();
      emit(FiltersLoaded(filterModelResponse: response!));
    } catch (error) {
      emit(TrainingFailure(error: error.toString()));
    }
  }

  void _onViewDetails(
      ViewDetailsEvent event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      navigatorKey.currentState!.pushNamed(
        TrainingDetailPage.routeName,
        arguments: TrainingDetailPageArguments(
            trainingModelResponse: event.trainingList),
      );
      emit(TrainingInitial());
    } catch (error) {
      emit(TrainingFailure(error: error.toString()));
    }
  }

  Future<TrainingModelResponse?> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/trainingDetailsList.json');
      final data = await json.decode(response);
      final list = TrainingModelResponse.fromJson(data);
      return list;
    } catch (e) {
      print('readJson $e');
      return null;
    }
  }

  Future<FilterModelResponse?> loadFilters() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/filterList.json');
      final data = await json.decode(response);
      final list = FilterModelResponse.fromJson(data);
      return list;
    } catch (e) {
      print('readJson $e');
      return null;
    }
  }
}
