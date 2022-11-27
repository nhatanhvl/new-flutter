import 'package:bot_toast/bot_toast.dart';
import 'package:demo/src/blocs/home/home_cubit.dart';
import 'package:demo/src/screens/login/login.dart';
import 'package:demo/src/screens/no_network_alert/no_network_alert.dart';
import 'package:demo/src/shares/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'app_cubit.dart';
import 'app_state.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => DemoAppState();
}

class DemoAppState extends WidgetState<DemoApp> with WidgetsBindingObserver {
  final botToastBuilder = BotToastInit();
  final appCubit = GetIt.instance.get<AppCubit>();
  final homeCubit = GetIt.instance.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider.value(value: appCubit),
        BlocProvider.value(value: homeCubit),
        ChangeNotifierProvider.value(value: topOverlay),
      ],
      child: BlocConsumer<AppCubit, AppState>(
          listener: handleAppState,
          builder: (_, state) => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const Login(),
              )),
    );
  }

  void handleAppState(_, AppState state) {
    if (state.isInitialized || state.isLoading) return;
    if (state.error != null) {
      showErrorToast(parseError(state.error));
    } else if (!state.hasInternetConnection) {
      showTopOverlay(const NoNetworkAlertWidget());
    } else {
      hideTopOverlay();
    }
  }
}
