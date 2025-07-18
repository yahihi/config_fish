# Ollama自動起動用のfish関数

function ollama_auto --description 'Auto start ollama if not running'
    # Ollamaが起動していなければ起動
    if not pgrep -f "ollama serve" > /dev/null
        echo "Starting Ollama in background..."
        nohup ollama serve > ~/.ollama/ollama.log 2>&1 &
        sleep 2
        echo "Ollama started on http://localhost:11434"
    else
        echo "Ollama is already running"
    end
end

# fishシェル起動時に自動実行
ollama_auto