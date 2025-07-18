# My Fish Shell Configuration

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/YOUR_USERNAME/fish-config.git ~/.config/fish

# Fisherをインストール
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# プラグインを一括インストール
fisher update
```

## 機密情報の設定

1. `~/.env.fish`を作成してAPIキーなどを設定：
```fish
set -gx OPENAI_API_KEY "your-key-here"
```

2. 権限を設定：
```bash
chmod 600 ~/.env.fish
```

## ファイル構成

- `config.fish` - メイン設定ファイル
- `fish_plugins` - Fisherプラグインリスト
- `functions/` - カスタム関数
- `completions/` - 補完設定
- `conf.d/` - 追加設定
- `.env.fish` - 環境変数（Gitignore対象）
- `config.local.fish` - ローカル設定（Gitignore対象）

## 含まれるプラグイン

- [Tide](https://github.com/IlanCosman/tide) - モダンなプロンプト
- [Tokyo Night](https://github.com/vitallium/tokyonight-fish) - カラーテーマ

## カスタマイズ

ローカル環境固有の設定は`~/.config/fish/config.local.fish`に記述してください。