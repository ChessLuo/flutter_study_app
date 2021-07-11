/**
 * @描述 flutter官方webview
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/7/13
 *
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterWebView extends StatefulWidget {
  final String url;
  final String barTitle;

  const FlutterWebView({Key key, this.url, this.barTitle}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<FlutterWebView>
    with AutomaticKeepAliveClientMixin {
  String _webUrl;

  @override
  void initState() {
    super.initState();
    _webUrl = Uri.decodeComponent(widget.url);

    print("web url == $_webUrl");
  }

  ///js与flutter交互
  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'invoke', //invoke要和网页协商一致
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        });
  }

  ///组合脚本执行方法，将数据发送给js端（flutter与js交互）
  void _onExecJavascript(String url) async {
    _controller.future.then((controller) {
      controller.loadUrl(url);
    });
    //或者 evaluateJavascript('callJS("js方法")')
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool _loading = true; //等待

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.barTitle,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          //设置安全区域 ，不沉浸式
          top: true,
          child: Builder(builder: (BuildContext context) {
            return Stack(
              children: <Widget>[
                _showWebView(context),
                _loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
              ],
            );
          }),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  ///初始化webview显示
  Widget _showWebView(BuildContext context) {
    return WebView(
      initialUrl: widget.url,

      ///初始化url
      javascriptMode: JavascriptMode.unrestricted,

      ///JS执行模式
      onWebViewCreated: (WebViewController webViewController) {
        ///在WebView创建完成后调用，只会被调用一次
        //
        //
        _controller.complete(webViewController);
      },
      javascriptChannels: <JavascriptChannel>[
        ///JS和Flutter通信的Channel；
        _alertJavascriptChannel(context),
      ].toSet(),
      navigationDelegate: (NavigationRequest request) {
        //路由委托（可以通过在此处拦截url实现JS调用Flutter部分）；
        ///通过拦截url来实现js与flutter交互
        if (request.url.startsWith('js://webview')) {
          Fluttertoast.showToast(msg: 'JS调用了Flutter By navigationDelegate');
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;

          ///阻止路由替换，不能跳转，因为这是js交互给我们发送的消息
        }

        return NavigationDecision.navigate;

        ///允许路由替换
      },
      onPageFinished: (String url) {
        ///页面加载完成回调
        setState(() {
          _loading = false;
        });
        print('Page finished loading: $url');
      },
    );
  }
}
