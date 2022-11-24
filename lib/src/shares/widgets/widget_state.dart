part of 'widgets.dart';

abstract class WidgetState<S extends StatefulWidget> extends State<S> {
  final topOverlay = GetIt.instance.get<TopOverlayNotifier>();

  String parseError(error) {
    //TODO implement parse error logic
    return error.toString();
  }

  void showToast(Widget content) {
    //TODO implement show toast with input widget
  }
  void showToastMessage(String message) {
    //TODO reuse showToast
  }
  void showSuccessToast(String message) {
    //TODO implement showSuccessToast
  }
  void showWarningToast(String message) {
    //TODO implement showWaringToast
  }
  void showErrorToast(String message) {
    BotToast.showText(text: message);
  }

  void showTopOverlay(Widget child) => topOverlay.showTopOverlayWidget(child);

  void hideTopOverlay() => topOverlay.hideTopOverlayWidget();

  //TODO implement show app common dialog
  Future<T?> showDialog<T>({
    required Widget child,
    BuildContext? context,
    Decoration? decoration,
    EdgeInsets? contentPadding,
  }) async {}

  @override
  Future<void> afterFirstLayout(BuildContext context) async {}
}
