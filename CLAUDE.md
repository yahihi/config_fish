# Fish Shell Configuration - Claude Assistant Notes

## 現在の設定状況

### 基本設定
- **エディタ**: nvim
- **シェル**: Fish 3.7.1
- **プロンプト**: Tide v6（モダンで高機能）
- **カラーテーマ**: Tokyo Night Night
- **プラグイン管理**: Fisher 4.4.5

### インストール済みプラグイン
- `jorgebucaran/fisher` - プラグインマネージャー
- `vitallium/tokyonight-fish` - Tokyo Nightカラーテーマ
- `ilancosman/tide@v6` - プロンプトフレームワーク
- `jorgebucaran/autopair.fish` - 括弧の自動補完
- `PatrickF1/fzf.fish` - fzf統合（Ctrl+Rで履歴検索など）

### 環境変数管理
- **グローバル環境変数**: `~/.env.fish`（fishシェル起動時に自動読み込み）
- **ディレクトリ固有**: `direnv`を使用（`.envrc`ファイル）
- **ローカル設定**: `~/.config/fish/config.local.fish`（Gitに含まれない）

### Git管理
- **リポジトリ**: https://github.com/yahihi/config_fish
- **除外ファイル**: `.env.fish`, `.envrc`, `fish_variables`, `config.local.fish`

## よくある操作

### プラグインの追加
```fish
fisher install プラグイン名
```

### プロンプトのカスタマイズ
```fish
tide configure
```

### カラーテーマの変更
```fish
fish_config theme save "TokyoNight Storm"  # または Night, Moon, Day
```

### 環境変数の追加
グローバル（全ディレクトリ）:
```fish
echo 'set -gx VARIABLE_NAME "value"' >> ~/.env.fish
```

プロジェクト固有:
```bash
echo 'export VARIABLE_NAME="value"' >> .envrc
direnv allow
```

## トラブルシューティング

### asdfエラーが出る場合
config.fishの26行目のasdf初期化をコメントアウト済み。必要に応じて有効化。

### direnvが動作しない場合
1. `which direnv`でインストール確認
2. 新しいシェルで`exec fish`を実行
3. `.envrc`がある場合は`direnv allow`を実行

### 設定の同期
```bash
cd ~/.config/fish
git pull
fisher update
```

## 今後の拡張案

1. **abbreviations（短縮コマンド）の設定**
   ```fish
   abbr -a g git
   abbr -a dc docker-compose
   ```

2. **カスタム関数の追加**
   `functions/`ディレクトリに`.fish`ファイルを作成

3. **キーバインディングのカスタマイズ**
   ```fish
   bind \cf 'fzf_search_directory'
   ```

## メンテナンス

### 設定のバックアップ
```bash
cd ~/.config/fish
git add -A
git commit -m "Update fish configuration"
git push
```

### クリーンインストール手順
SETUP.mdを参照

## 参考リンク
- [Fish Documentation](https://fishshell.com/docs/current/)
- [Fisher](https://github.com/jorgebucaran/fisher)
- [Tide](https://github.com/IlanCosman/tide)
- [fzf.fish](https://github.com/PatrickF1/fzf.fish)