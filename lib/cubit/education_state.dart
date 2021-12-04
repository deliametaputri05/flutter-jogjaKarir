part of 'education_cubit.dart';

abstract class EducationState extends Equatable {
  const EducationState();

  @override
  List<Object> get props => [];
}

class EducationInitial extends EducationState {}

class EducationLoaded extends EducationState {
  final List<Education> edu;

  EducationLoaded(this.edu);

  @override
  List<Object> get props => [edu];
}

class EducationLoadingFailed extends EducationState {
  final String message;

  EducationLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
