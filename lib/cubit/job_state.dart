part of 'job_cubit.dart';

abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}

class JobLoaded extends JobState {
  final List<Job> jobs;

  JobLoaded(this.jobs);

  @override
  List<Object> get props => [jobs];
}

class JobLoadingFailed extends JobState {
  final String message;

  JobLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
