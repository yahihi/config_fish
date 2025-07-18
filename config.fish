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
    
    # asdfの初期化
    # source $HOME/.asdf/asdf.fish
    
    # zoxideの初期化
    zoxide init fish | source
    
    # direnvの初期化
    direnv hook fish | source
    
    # ホームディレクトリの.envrcを自動読み込み（オプション）
    # cd ~ && cd -
    
    # グローバル環境変数（APIキーなど）
    if test -f ~/.env.fish
        source ~/.env.fish
    end
    
    # ローカル設定（Gitに含めない）
    if test -f ~/.config/fish/config.local.fish
        source ~/.config/fish/config.local.fish
    end
    
    # Tideプロンプトのカスタマイズ（オプション）
    # set -g tide_git_icon 
    # set -g tide_python_icon 🐍
    source "/home/yahihi/.asdf/installs/rust/1.88.0/env.fish"  # For fish
end
