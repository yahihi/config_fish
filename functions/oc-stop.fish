function oc-stop -d "Stop OpenClaw Gateway"
    set -l lock_dir /tmp/openclaw-(id -u)

    # 生きているプロセスのみ取得（ゾンビ除外）
    set -l alive_pids
    for pid in (pgrep -f '[o]penclaw' 2>/dev/null)
        set -l state (ps -o stat= -p $pid 2>/dev/null)
        if test -n "$state"; and not string match -q 'Z*' "$state"
            set -a alive_pids $pid
        end
    end

    if test (count $alive_pids) -eq 0
        # プロセスなし — ロックファイルだけ残っていたら掃除
        if test -d "$lock_dir"; and count $lock_dir/*.lock >/dev/null 2>&1
            rm -f $lock_dir/*.lock
            echo "Gateway is not running (stale lock removed)"
        else
            echo "Gateway is not running"
        end
        return 1
    end

    # SIGTERM
    pkill -f 'openclaw-gateway' 2>/dev/null
    pkill -f 'openclaw gateway' 2>/dev/null
    sleep 1

    # SIGTERM で残ったら SIGKILL（ゾンビ除外で再チェック）
    for pid in (pgrep -f '[o]penclaw' 2>/dev/null)
        set -l state (ps -o stat= -p $pid 2>/dev/null)
        if test -n "$state"; and not string match -q 'Z*' "$state"
            kill -9 $pid 2>/dev/null
        end
    end
    sleep 0.5

    # ロックファイル掃除
    if test -d "$lock_dir"; and count $lock_dir/*.lock >/dev/null 2>&1
        rm -f $lock_dir/*.lock
    end

    echo "Gateway stopped"
end
