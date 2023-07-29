abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {

}



/// **************************(Inputs)****************************** \\\
abstract class BaseViewModelInputs{
  void start();
  void dispose();
}


/// **************************(Outputs)***************************** \\\
mixin class BaseViewModelOutputs{

}