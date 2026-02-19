function oc-status -d "Show OpenClaw Gateway status"
    # 生きているプロセスを探す（ゾンビ除外）
    set -l alive_pid
    for pid in (pgrep -f '[o]penclaw-gateway' 2>/dev/null)
        set -l state (ps -o stat= -p $pid 2>/dev/null)
        if test -n "$state"; and not string match -q 'Z*' "$state"
            set alive_pid $pid
            break
        end
    end

    if test -z "$alive_pid"
        echo "Gateway: not running"
        return 1
    end

    echo "Gateway: running (pid $alive_pid)"
    curl -sf http://localhost:18789/health >/dev/null
    and echo "Health: ok"
    or echo "Health: not responding"
end
