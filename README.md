# flutter_sample_app
## YAMLファイルの情報
```yaml
name: flutter_sample_app
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1
environment:
  sdk: '>=2.18.1 <3.0.0'
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
flutter:
  uses-material-design: true
```
### nameフィールド
パッケージ名を指定する。<br>
Pluginなど第三者にリリースするときには必須で必要、適切な名前を付ける。<br>
使用可能な文字は[a-z0-9_]です。

### descriptionフィールド
このパッケージについて説明を自由に記載する。

### publish_toフィールド
パッケージをPublishするときに必要になるオプション。通常のアプリケーション開発ではテンプレート通り、`none`を指定する。<br>
Pluginとして[pub.dev](https://pub.dev/)にリリースする場合にはこのオプションは削除する必要がある。

### versionフィールド
パッケージのバージョンを指定する。通常、`1.0.0+1`のように指定する。<br>
指定がない場合は`0.0.0`となる。<br>
また、`1.0.0-beta.7`などのように開発フェーズに応じたバージョン付けも可能。プレフィックスには、`-dev.数値`, `-alpha.数値`, `-beta.数値`, `-rc.数値`が指定可能。

### environmentフィールド
ビルド環境に関する各種設定を行う。<br>

バージョンの指定方法は下記表の通り。
| フィールド      | 説明                                                                       |
| --------------- | -------------------------------------------------------------------------- |
| 2.18.1          | 2.18.1のみ許可                                                             |
| >=2.18.1        | 2.18.1以上のバージョンを許可                                               |
| >=2.18.1 <3.0.0 | 2.18.1以上、3.0.0未満のバージョンを許可                                    |
| <2.18.1         | 2.18.1未満のバージョンを許可                                               |
| ^2.18.1         | 2.18.1以上で指定されたバージョン以上でメジャーバージョンが同じであれば許可 |
| any             | バージョン指定なし                                                         |
| 空白            | any指定時同様、バージョン指定なし                                          |

#### dart-sdkのバージョンを指定する
dart-sdkのバージョンを指定することができる。<br>
例えば、dart-sdkが`2.18.0`以上かつ`3.0.0`を要求する場合には以下のように記述する。
```yaml
environment:
  sdk: '>=2.18.1 <3.0.0'
```
#### Flutter SDKのバージョンを指定する
Flutter (SDK) のバージョンを指定したい場合には、flutterフィールドを利用する。
```yaml
environment:
  flutter: ^0.1.2
```

### dependenciesフィールド
利用する外部パッケージを記載する。外部パッケージは[pub.dev](https://pub.dev/)で検索することができる。<br>

#### flutterフィールド
下記のは必須項目で記載する。
```yaml
dependencies:
flutter:
sdk: flutter
```

#### cupertino_iconsフィールド
iOSアプリスタイルのUIを作成するためにCupertinoIconsクラスを利用する場合にはこの指定が必須。
```yaml
dependencies:
  cupertino_icons: ^1.0.2
```

#### gitのリポジトリを直接参照する方法
ライブラリとして、gitのリポジトリにあるパッケージを直接指定することも可能。
```yaml
dependencies:
  パッケージ名: # パッケージ名を指定する
    git:
      url: https://github.com/jlouage/flutter-carousel-pro.git # repoを指定
      ref: ^1.0.0 # バージョンもしくはブランチ名などを指定
```

#### ローカルのパッケージもしくはライブラリを参照する
ローカルにあるパッケージを直接指定することも可能。主に別プロジェクトにしたプラグインの場合にこれを利用する。
```yaml
menubar: # パッケージ名を指定する
    path: ../plugins/menubar # パッケージのパスを指定する
  window_size:
    path: ../plugins/window_size
```

### dev_dependenciesフィールド
開発時に利用するライブラリを指定する。<br>
例えば、リリースビルドされる成果物には使わない、テストやLint系などを指定する。<br>
指定方法は、`dependenciesフィールド`と同様。

#### テストライブラリ
テストライブラリは、`flutter_test`を指定する。
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
```

### アセットの設定(flutterフィールド)
flutterフィールドには、アプリのバンドル（アセット）として含むファイル（例えば、アイコンや画像など）やフォントの指定などを行う。

#### uses-material-designフィールド
Material Designを利用する場合には、`true`を指定する。
```yaml
flutter:
  uses-material-design: true
```

#### assetsフィールド
アプリのバンドルとして含むファイルを指定する。例えば、アイコンや画像などを指定する。<br>
ファイルを一つずつ指定する方法と、ディレクトリを指定する方法がある。<br>
```yaml
flutter:
  assets:
    - images_a/
    - images_b/1.jpeg
    - images_b/2jpeg
```

#### fontsフィールド
アプリのバンドルとして含むフォントを指定する。<br>
AndroidやiOSなどのようにシステムデフォルトなフォントを持たないデスクトップアプリ（Windows/Linux/macOS)の場合には設定が必須です。これを行わないと文字が正常に表示されない。