part of 'todo_cubit.dart';

@freezed
class TodoState<T> with _$TodoState<T> {
  const factory TodoState.initial() = _Initial;

  const factory TodoState.loading() = TodoLoading;
  const factory TodoState.success(T data) = TodoSuccess<T>;
  const factory TodoState.error(String errorMessage) = TodoError;
}
