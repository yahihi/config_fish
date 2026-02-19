function oc-start -d "Start OpenClaw Gateway"
    set -l lock_dir /tmp/openclaw-(id -u)

    # 生きているプロセスのみチェック（ゾンビ除外）
    for pid in (pgrep -f '[o]penclaw-gateway' 2>/dev/null)
        set -l state (ps -o stat= -p $pid 2>/dev/null)
        if test -n "$state"; and not string match -q 'Z*' "$state"
            echo "Gateway is already running (pid $pid)"
            return 1
        end
    end

    # ゾンビしかいない or プロセスなし — stale lock を掃除
    if test -d "$lock_dir"; and count $lock_dir/*.lock >/dev/null 2>&1
        rm -f $lock_dir/*.lock
    end

    openclaw gateway --port 18789 --verbose >/tmp/openclaw-gateway.log 2>&1 &
    disown
    echo "Gateway started"
end
