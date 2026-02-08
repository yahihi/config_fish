function oc-status -d "Show OpenClaw Gateway status"
    set -l pid (pgrep -f '[o]penclaw-gateway' | head -1)
    if test -z "$pid"
        echo "Gateway: not running"
        return 1
    end
    echo "Gateway: running (pid $pid)"
    curl -sf http://localhost:18789/health >/dev/null
    and echo "Health: ok"
    or echo "Health: not responding"
end
