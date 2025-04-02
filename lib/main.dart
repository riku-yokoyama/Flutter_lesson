import 'package:flutter/material.dart';

void main() {
  // アプリのルート定型
  runApp(const MyApp());
}

// これも定型文<アプリのUIの基盤になるMaterialAppを返す>
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// これも定型文<実際のUIはMyhomepageのstatefullウィジェットに書く>
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // UI構築するスキャフォールド
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        // Centerを使用すると横は中央になるが、Columnを使用すると縦が上寄せになるので
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            // Image.networkウィジェットは変化しうるので、CenterWidgetはconstだとエラーになる
            Image.network(
                "https://www.calulu-dogwear.jp/html/plugin/Exp/assets/images/column/recommend/calulu_006/main.jpg",
                width: 200,
                height: 200),

            Image.asset(
              "assets/shiba.jpg",
              width: 200,
              height: 200,
            ),
          ]),
          Text("Centerにテキストウィジェットを配置してみる"),
          Text(
            "画面に長文を表示したいとき、FlutterではmaxLinesを使用することで最大行数の指定や、overflowで最大範囲を超えた際の挙動を制御できる",
            maxLines: 2, // 最大行数を2行に指定
            overflow: TextOverflow.ellipsis, // 未切れを…で表現する
          ),
          Text(
              "もしFlutterでmaxLinesやoverflowを使用しないと、行数や見切れを制御することなく、ひたすらにすべてを表示しきるまで改行し続けて制御することなく冗長に文章が表示されます。"),
          Text(
            "これは青色の太文字です",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      )),
    );
  }
}
