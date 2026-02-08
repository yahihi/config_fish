function oc-stop -d "Stop OpenClaw Gateway"
    if not pgrep -f '[o]penclaw-gateway' >/dev/null
        echo "Gateway is not running"
        return 1
    end
    pkill -f openclaw-gateway
    sleep 1
    echo "Gateway stopped"
end
