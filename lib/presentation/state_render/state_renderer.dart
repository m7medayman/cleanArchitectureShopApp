import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_shop/presentation/resources/assets_manager.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';
import 'package:mvvm_shop/presentation/resources/styles_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';

enum StateScreens {
//popup state
  popupLoadingState,
  SuccesspopupState,
  popupErrorState,
// full page state
  emptyPageState,
  loadingPageState,
  errorPageState
}

class StateRenderer extends StatelessWidget {
  String message;
  StateScreens stateType;
  Function? retryFunc;
  bool isPopup;
  StateRenderer(
      {super.key,
      this.isPopup = false,
      required this.message,
      required this.stateType,
      this.retryFunc});

  @override
  Widget build(BuildContext context) {
    return _getDialog(stateType, message, context);
  }
}

Widget _getDialog(
    StateScreens stateType, String message, BuildContext context) {
  switch (stateType) {
    case StateScreens.popupErrorState:
      return _errorPopupDialog(message, context);
    case StateScreens.loadingPageState:
      return _loadingPopupDialog(message);
    case StateScreens.SuccesspopupState:
      return _SuccessPopupDialog(message);
    default:
      return _loadingPopupDialog(message);
  }
}

Widget _SuccessPopupDialog(
  String message,
) {
  return _popupDialog(
      [_getJsonImage(LottieAssets.success), _getDialogMessage(message)]);
}

Widget _loadingPopupDialog(
  String message,
) {
  return _popupDialog(
      [_getJsonImage(LottieAssets.loading), _getDialogMessage(message)]);
}

Widget _errorPopupDialog(String message, BuildContext context) {
  return _popupDialog([
    _getJsonImage(LottieAssets.error),
    _getDialogMessage(message),
    _getButton(
        buttonText: AppStrings.retryAgain, context: context, isPopup: true)
  ]);
}

Widget _getDialogMessage(String message) {
  return Text(
    message,
    style: getMediumStyle(),
  );
}

Dialog _popupDialog(List<Widget> dialogContentList) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s1_5)),
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s12),
          boxShadow: const [BoxShadow(color: Colors.black26)]),
      child: _getDialogContent(dialogContentList),
    ),
  );
}

Widget _getDialogContent(List<Widget> dialogContentList) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: dialogContentList,
  );
}

Widget _getJsonImage(String lottieImage) {
  return SizedBox(
    height: AppSize.h100,
    width: AppSize.h100,
    child: Lottie.asset(lottieImage),
  );
}

Widget _getButton(
    {Function? onPressedFunc,
    required String buttonText,
    required bool isPopup,
    required BuildContext context}) {
  return ElevatedButton(
      onPressed: () => pressed(onPressedFunc, isPopup, context),
      child: Text(
        buttonText,
        style: getMediumStyle(),
      ));
}

pressed(Function? onPressed, bool isPopup, BuildContext context) {
  if (isPopup) {
    _popupFunc(onPressed, context);
  } else {
    print('is not popup');
    _normalStateFunc(onPressed);
  }
}

_popupFunc(Function? onPressed, BuildContext context) {
  Navigator.of(context).pop();
  if (onPressed != null) {
    onPressed();
  }
}

_normalStateFunc(Function? onPressed) {
  if (onPressed != null) {
    onPressed();
  }
}
