if status is-interactive
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

    # zoxideの初期化（インストール済みの場合のみ）
    if type -q zoxide
        zoxide init fish | source
    end

    # direnvの初期化（インストール済みの場合のみ）
    if type -q direnv
        direnv hook fish | source
    end

    # グローバル環境変数（APIキーなど）
    if test -f ~/.env.fish
        source ~/.env.fish
    end

    # ローカル設定（Gitに含めない）
    if test -f ~/.config/fish/config.local.fish
        source ~/.config/fish/config.local.fish
    end
end
