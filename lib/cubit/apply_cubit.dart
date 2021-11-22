import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jogjakarir_app/models/models.dart';
import 'package:jogjakarir_app/services/services.dart';

part 'apply_state.dart';

class ApplyCubit extends Cubit<ApplyState> {
  ApplyCubit() : super(ApplyInitial());

  Future<void> getApply() async {
    ApiReturnValue<List<Apply>> result = await ApplyServices.getApplys();

    if (result.value != null) {
      emit(ApplyLoaded(result.value));
    } else {
      emit(ApplyLoadingFailed(result.message));
    }
  }

  Future<String> submitApply(Apply apply, {File file}) async {
    ApiReturnValue<Apply> result =
        await ApplyServices.submitApply(apply, file: file);

    print("ini response");
    print(result.value);
    if (result.value != null) {
      emit(ApplyLoaded((state as ApplyLoaded).apply + [result.value]));

      return result.value.file;
    } else {
      return null;
    }
  }

  Future<void> uploadFile(File cv) async {
    ApiReturnValue<String> result = await ApplyServices.upload(cv);

    // if (result.value != null) {
    //   emit(ApplyLoaded((state as ApplyLoaded).apply.copyWith(
    //       file: "http://192.168.43.86:8000/storage/" + result.value)));
  }
}
