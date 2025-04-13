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
      title: 'Flutterウィジェット勉強用アプリ',
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
              height: 200,
              // 横並びの画像を強制的に同じサイズにする
              fit: BoxFit.cover,
            ),

            Image.asset(
              "assets/shiba.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ]),
          Text("Centerにテキストウィジェットを配置してみる"),
          Text(
            "画面に長文を表示したいとき、FlutterではmaxLinesを使用することで最大行数の指定や、overflowで最大範囲を超えた際の挙動を制御できる",
            maxLines: 2, // 最大行数を2行に指定
            overflow: TextOverflow.ellipsis, // 未切れを…で表現する
          ),

          // 以下のテキストウィジェットをコンテナでラップし、コンテナの背景色を足す。
          // テキストウィジェットをさらにPaddingウィジェットでラップし、Edge(画面端)からの距離を設定する
          Container(
            color: Colors.amberAccent,
            child: const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                  "もしFlutterでmaxLinesやoverflowを使用しないと、行数や見切れを制御することなく、ひたすらにすべてを表示しきるまで改行し続けて制御することなく冗長に文章が表示されます。"),
            ),
          ),
          // Paddingで指定せずとも、Alignで上下左右を指定してラップすることもできる
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "これは青色の太文字です",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
          ElevatedButton (
              //重要!!! onPressedは引数に関数を取るプロパティなので、直接printではなく、関数を渡す必要がある
              //ここでは、使い捨て関数（無名関数、ラムダ式）を(){処理}の形で定義して関数を渡している
              onPressed: () {
                // テキストボタン押下時の動きとしてダイアログを定義
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("お知らせ"),
                        content: Text(
                          "アラートダイアログです",
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                // 元の画面へ戻るを表す定型文（pop=前の画面に戻る)
                                Navigator.of(context).pop();
                              },
                              child: Text("close"))
                        ],
                      );
                    });
              },
              child: Text("お知らせがあります"))
        ],
      )),
    );
  }
}
