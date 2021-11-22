import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jogjakarir_app/models/models.dart';
import 'package:jogjakarir_app/services/services.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());

  Future<void> getJobs() async {
    ApiReturnValue<List<Job>> result = await JobServices.getJobs();

    if (result.value != null) {
      emit(JobLoaded(result.value));
    } else {
      emit(JobLoadingFailed(result.message));
    }
  }
}
