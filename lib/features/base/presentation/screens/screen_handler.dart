import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/injection_container.dart' as di;
import '../../../../core/constants/app_texts.dart';
import '../../data/entities/base_state.dart';
import '../widgets/app_loader.dart';
import '../widgets/app_no_connection.dart';
import '../widgets/app_no_data.dart';
import '../widgets/app_success_image.dart';

class ScreenHandler extends StatefulWidget {
  final StateNotifierProvider<dynamic, BaseState<dynamic>> screenProvider;
  final void Function()? onDeviceReconnected;
  final String? noDataMessage;
  final Widget? noDataWidget;
  final bool showLoading;
  final bool showActionSucceeded;

  const ScreenHandler({
    super.key,
    required this.screenProvider,
    this.onDeviceReconnected,
    this.noDataMessage,
    this.noDataWidget,
    this.showLoading = true,
    this.showActionSucceeded = true,
  });

  @override
  ScreenHandlerState createState() {
    return ScreenHandlerState();
  }
}

class ScreenHandlerState extends State<ScreenHandler> {
  bool isConnectedAtLastTime = true;

  late final _isLoadingProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider.select((state) => state.isLoading));
  });

  late final _actionSucceededProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).actionSucceeded;
  });

  late final _successMessageProvider = Provider<String?>((ref) {
    return ref.watch(widget.screenProvider).successMessage;
  });

  late final Provider<bool> _noConnectionProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).hasNoConnection;
  });

  late final Provider<bool> _noDataProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).hasNoData;
  });

  late final Provider<bool> _isPerformingRequestProvider =
      Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).isPerformingRequest;
  });

  late final _isReconnectedProvider = Provider<bool>((ref) {
    bool isConnected = ref.watch(di.isConnectedProvider);
    bool isPerformingRequest = ref.read(_isPerformingRequestProvider);
    if (isConnected &&
        !isConnectedAtLastTime &&
        widget.onDeviceReconnected != null &&
        !isPerformingRequest) {
      Future.delayed(Duration.zero, () {
        widget.onDeviceReconnected!();
      });
    }
    isConnectedAtLastTime = isConnected;
    return isConnected;
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Consumer(
          builder: (_, ref, __) {
            final bool noData = ref.watch(_noDataProvider);
            return AppNoData(
                show: noData,
                noDataView: widget.noDataWidget,
                msg: widget.noDataMessage ?? AppTexts.noData.message);
          },
        ),
        Consumer(
          builder: (_, ref, __) {
            final bool noConnection = ref.watch(_noConnectionProvider);

            ref.watch(_isReconnectedProvider);
            return noConnection
                ? AppNoConnection(
                    onTap: widget.onDeviceReconnected,
                  )
                : const SizedBox();
          },
        ),
        if (widget.showLoading)
          Consumer(
            builder: (_, ref, __) {
              final bool isLoading = ref.watch(_isLoadingProvider);
              return isLoading ? const AppLoader() : const SizedBox();
            },
          ),
        if (widget.showActionSucceeded)
          Consumer(
            builder: (_, ref, __) {
              final bool actionSucceeded = ref.watch(_actionSucceededProvider);
              final String? successMessage = ref.watch(_successMessageProvider);
              return actionSucceeded
                  ? AppSuccessImage(successMessage: successMessage ?? '')
                  : const SizedBox();
            },
          ),
      ],
    );
  }
}
