part of 'widgets.dart';

class TopOverlayWidget extends StatelessWidget {
  const TopOverlayWidget({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? const SizedBox.shrink(),
        Consumer<TopOverlayNotifier>(
          builder: (_, overlay, __) => overlay.child ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class TopOverlayNotifier extends ChangeNotifier {
  Widget? _child;
  Widget? get child => _child;

  void showTopOverlayWidget(Widget child) {
    _child = child;
    notifyListeners();
  }

  void hideTopOverlayWidget() {
    _child = null;
    notifyListeners();
  }
}
