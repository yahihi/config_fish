function oc-restart -d "Restart OpenClaw Gateway"
    oc-stop 2>/dev/null
    oc-start
end
