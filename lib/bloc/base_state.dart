abstract class BaseState {}

class StateLoading extends BaseState {}

class StateOnSuccess<T> extends BaseState {
  T response;

  StateOnSuccess(this.response);
}

class StateErrorGeneral extends BaseState {
  String errorMessage;

  StateErrorGeneral(this.errorMessage);
}
