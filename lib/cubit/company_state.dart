part of 'company_cubit.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<Company> company;

  CompanyLoaded(this.company);

  @override
  List<Object> get props => [company];
}

class CompanyLoadingFailed extends CompanyState {
  final String message;

  CompanyLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
