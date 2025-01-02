import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/widgets/build_app_bar_reusable.dart';
import 'package:udemy_app/pages/course/paywebview/bloc/payview_bloc.dart';
import 'package:udemy_app/pages/course/paywebview/bloc/payview_events.dart';
import 'package:udemy_app/pages/course/paywebview/bloc/payview_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({super.key});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint('------my url is here didChangeDependencies: ${args['url']}');
    context.read<PayWebViewBloc>().add(TriggerWebView(url: args['url']));
  }

  @override
  void dispose() {
    webViewController.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBloc, PayWebViewStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarReusable('Payment Page'),
          body: state.url == ""
              ? SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: const CircularProgressIndicator(),
                )
              : WebView(
                  initialUrl: state.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: {
                    JavascriptChannel(
                      name: "Pay",
                      onMessageReceived: (JavascriptMessage message) {
                        print('message: ${message.message}');
                        Navigator.of(context).pop(message.message);
                      },
                    ),
                  },
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                ),
        );
      },
    );
  }
}
