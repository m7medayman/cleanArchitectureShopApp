import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/state_render/state_renderer.dart';

extension GetState on StateType {
  getWidget({required String message}) {
    switch (this) {
      case StateType.emptyPageState:
        return StateRenderer(message: message, stateType: this);
      case StateType.errorPageState:
        return StateRenderer(message: message, stateType: this);
      case StateType.loadingPageState:
        return StateRenderer(message: message, stateType: this);
      case StateType.popupErrorState:
        return StateRenderer(
          message: message,
          stateType: this,
          isPopup: true,
        );
      case StateType.popupLoadingState:
        return StateRenderer(
          message: message,
          stateType: this,
          isPopup: true,
        );
      case StateType.popupSuccessState:
        return StateRenderer(
          message: message,
          stateType: this,
          isPopup: true,
        );
    }
  }

  getPopupDialog(String message, BuildContext context) {
    StateRenderer state = getWidget(message: message);
    if (state.isPopup) {
      executeShowDialog(state, context);
    } else {
      assert(true, "Dialog state is not a popup State");
    }
  }

  getStateDialog(String message, BuildContext context) {
    StateRenderer state = getWidget(message: message);
    if (!state.isPopup) {
      executeShowState(state);
    } else {
      assert(true, "Dialog state is not a state dialog");
    }
  }
}

executeShowDialog(StateRenderer stateDialog, BuildContext context) {
  StateType type = stateDialog.stateType;
  if (type == StateType.popupSuccessState ||
      type == StateType.popupErrorState) {
    dismissDialog(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) => stateDialog,
        ));
  } else {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) => stateDialog,
        ));
  }
}

executeShowState(StateRenderer stateDialog) {
  return stateDialog;
}

_isCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}
