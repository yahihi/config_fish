# Fish Shell セットアップガイド

このドキュメントは、Fish shellの環境を一から構築するための手順書です。

## 前提条件

- Fish shell がインストール済み
- asdf がインストール済み（オプション）

## セットアップ手順

### 1. 基本的なconfig.fishの作成

`~/.config/fish/config.fish` を以下の内容で作成：

```fish
if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # エディタの設定
    set -gx EDITOR nvim
    
    # パスの追加
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/bin
    fish_add_path $HOME/.asdf/shims
    
    # エイリアスの設定
    alias ll='ls -lah'
    alias la='ls -A'
    alias l='ls -CF'
    alias ..='cd ..'
    alias ...='cd ../..'
    
    # プロンプトのカスタマイズ用変数
    set -g fish_prompt_pwd_dir_length 3
    
    # 履歴の設定
    set -g fish_history_max_cmd_length 5000
    
    # asdfの初期化（asdf 0.18.0の場合、パスに応じて調整が必要）
    # source $HOME/.asdf/asdf.fish
    
    # zoxideの初期化
    zoxide init fish | source
    
    # Tideプロンプトのカスタマイズ（オプション）
    # set -g tide_git_icon 
    # set -g tide_python_icon 🐍
end
```

### 2. Fisherのインストール

Fisherがインストールされていない場合：

```bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

### 3. Tokyo Nightカラーテーマのインストール

```fish
fisher install vitallium/tokyonight-fish
```

利用可能なバリエーション：
- TokyoNight Day（明るいテーマ）
- TokyoNight Moon
- TokyoNight Night
- TokyoNight Storm

テーマの適用：
```fish
fish_config theme save "TokyoNight Night"
```

### 4. Tideプロンプトのインストール

```fish
fisher install ilancosman/tide@v6
```

初期設定：
```fish
tide configure
```

Tideの特徴：
- Gitブランチの自動表示
- Python仮想環境の表示
- 実行時間の表示
- エラーステータスの表示

### 5. asdfの補完設定

asdfがインストールされている場合：

```bash
mkdir -p ~/.config/fish/completions
ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/asdf.fish
```

### 6. 推奨プラグイン

#### autopair - 括弧の自動補完
```fish
fisher install jorgebucaran/autopair.fish
```

#### fzf.fish - ファジーファインダー統合
```fish
fisher install PatrickF1/fzf.fish
```

主な機能：
- Ctrl+R: コマンド履歴検索
- Ctrl+Alt+F: ファイル検索
- Ctrl+Alt+L: ディレクトリ移動
- Ctrl+V: 変数検索

#### done - 長時間実行コマンドの通知
```fish
fisher install franciscolourenco/done
```

## トラブルシューティング

### asdfエラーが出る場合

asdfのバージョンや設置場所により、config.fishの該当行を調整：

```fish
# asdf 0.18.0で~/.local/binにインストールされている場合
# source $HOME/.asdf/asdf.fish の行をコメントアウト
```

### プロンプトが白字のままの場合

1. `tide configure` を実行してプロンプトスタイルを選択
2. Tokyo Nightテーマを再適用：`fish_config theme save "TokyoNight Night"`

## 環境の確認

```fish
# インストール済みプラグインの確認
fisher list

# 現在のテーマ確認
fish_config theme show

# Tideの設定確認
echo $tide_left_prompt_items
echo $tide_right_prompt_items
```

## バックアップ

定期的に以下のファイルをバックアップすることを推奨：
- `~/.config/fish/config.fish`
- `~/.config/fish/fish_plugins`
- `~/.config/fish/fish_variables`