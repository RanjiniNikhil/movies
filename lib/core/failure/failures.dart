abstract class Failure {
  @override
  List<Object> get props => [];
}

// General failures
class FailureMessage extends Failure {
  String message;

  FailureMessage(this.message);
}
