# ~/.bashrc

# Timezone aliases
alias tz-uk='sudo timedatectl set-timezone Europe/London'
alias tz-us='sudo timedatectl set-timezone America/New_York'

# Jarvis — TODO: update when Jarvis moves to server/Docker
alias jarvis='source ~/.venvs/jarvis/bin/activate && cd ~/projects/jarvis && python main.py'

fastfetch

# PyCharm venv discovery
export WORKON_HOME="$HOME/.venvs"

# Show todo checklist until manually cleared
if [[ -f "$HOME/.todo" ]]; then
    echo ""
    echo -e "\033[1;33m=== TODO ===\033[0m"
    cat "$HOME/.todo"
    echo -e "\033[1;33m============\033[0m"
    echo ""
fi
export PATH="$HOME/.local/bin:$PATH"
alias baker-update="$HOME/projects/baker/upgrade.sh"
