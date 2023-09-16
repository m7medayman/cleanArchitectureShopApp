
abstract class BaseViewModel extends BaseInput with BaseOutput {}

abstract class BaseInput {
  void start();
  void dispose();
}

abstract class BaseOutput {}
