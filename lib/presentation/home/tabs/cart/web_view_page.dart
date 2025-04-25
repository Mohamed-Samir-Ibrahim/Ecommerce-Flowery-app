import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewPage extends StatefulWidget {
  const PaymentWebViewPage({super.key,  this.url});
  final String? url;

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebViewPage> {
  late final WebViewController controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            // Handle navigation to success/cancel URLs
            if (request.url.startsWith('http://localhost:3000/allOrders')) {
              // Payment succeeded
              // Navigator.of(context).pop(); // Close WebView
              Navigator.pushReplacementNamed(context,RoutesNames.orderPage); // Go to orders screen
              return NavigationDecision.prevent;
            }
            else if (request.url.startsWith('http://localhost:3000/cart')) {
              // Payment cancelled
              // Navigator.of(context).pop(); // Close WebView
              Navigator.pushReplacementNamed(context, RoutesNames.cartScreen,); // Go back to cart
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            setState(() => _isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => _isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(
widget.url??""      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.completePayment),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context), // Allow manual close
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}