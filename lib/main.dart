import 'package:flutter/material.dart';
import 'package:flutter_sample_app/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebViewApp(),
      // デバッグバナーの表示・非表示を切り替える(デフォルトはtrueで表示する)
      debugShowCheckedModeBanner: true,
    );
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  /// WebViewControllerオブジェクト
  late final WebViewController controller;

  /// 初期状態を設定
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://alphablink.jp/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
