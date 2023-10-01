part of 'code_cubit.dart';

class CodeState extends Equatable {
  const CodeState();

  @override
  List<Object> get props => [];
}

class CodeInitial extends CodeState {
  const CodeInitial();
}

class CodeLoading extends CodeState {}

class CodeError extends CodeState {
  final String error;
  const CodeError(this.error);
  @override
  List<Object> get props => [error];
}

class CodeSuccess extends CodeState {}
