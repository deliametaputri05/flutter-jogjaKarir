import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jogjakarir_app/models/models.dart';
import 'package:jogjakarir_app/services/services.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());

  Future<void> getEducations() async {
    ApiReturnValue<List<Education>> result =
        await EducationServices.getEducations();

    if (result.value != null) {
      emit(EducationLoaded(result.value));
    } else {
      emit(EducationLoadingFailed(result.message));
    }
  }
}
