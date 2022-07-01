abstract class BaseViewodel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

abstract class BaseViewModelInputs {
  void start();

  /// start tasks   --> start view model job

  void dispode();

  /// close  all tasks  --> will be called when view model die
}

abstract class BaseViewModelOutputs {}
