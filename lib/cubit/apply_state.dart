part of 'apply_cubit.dart';

abstract class ApplyState extends Equatable {
  const ApplyState();

  @override
  List<Object> get props => [];
}

class ApplyInitial extends ApplyState {}

class ApplyLoaded extends ApplyState {
  final List<Apply> apply;

  ApplyLoaded(this.apply);

  @override
  List<Object> get props => [apply];
}

class ApplyLoadingFailed extends ApplyState {
  final String message;

  ApplyLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
