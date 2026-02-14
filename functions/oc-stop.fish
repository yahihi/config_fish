function oc-stop -d "Stop OpenClaw Gateway"
    if not pgrep -f '[o]penclaw' >/dev/null
        echo "Gateway is not running"
        return 1
    end
    pkill -f 'openclaw-gateway' 2>/dev/null
    pkill -f 'openclaw gateway' 2>/dev/null
    sleep 1
    # SIGTERM で残ったら SIGKILL
    if pgrep -f '[o]penclaw' >/dev/null 2>&1
        pkill -9 -f 'openclaw' 2>/dev/null
        sleep 0.5
    end
    echo "Gateway stopped"
end
