import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jogjakarir_app/models/models.dart';
import 'package:jogjakarir_app/services/services.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());

  Future<void> getCompanies() async {
    ApiReturnValue<List<Company>> result = await CompanyServices.getCompanies();

    if (result.value != null) {
      emit(CompanyLoaded(result.value));
    } else {
      emit(CompanyLoadingFailed(result.message));
    }
  }
}
