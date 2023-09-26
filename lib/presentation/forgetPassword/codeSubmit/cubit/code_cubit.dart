import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'code_state.dart';

class CodeCubit extends Cubit<CodeState> {
  CodeCubit() : super(const CodeInitial());
}
