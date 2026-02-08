function oc-start -d "Start OpenClaw Gateway"
    if pgrep -f '[o]penclaw-gateway' >/dev/null
        echo "Gateway is already running (pid $(pgrep -f '[o]penclaw-gateway' | head -1))"
        return 1
    end
    openclaw gateway --port 18789 --verbose &
    disown
    echo "Gateway started"
end
