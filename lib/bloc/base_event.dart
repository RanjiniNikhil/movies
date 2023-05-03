class BaseEvent {}

class EventLoading extends BaseEvent {}

class EventOnSuccess<T> extends BaseEvent {
  T response;

  EventOnSuccess(this.response);
}

class EventErrorGeneral extends BaseEvent {
  String errorMessage;

  EventErrorGeneral(this.errorMessage);
}
