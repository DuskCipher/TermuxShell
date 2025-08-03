
command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}

# Modern Enhanced PS1 with gradient colors and icons
PS1='\[\033[38;5;196m\]╭─[\[\033[38;5;208m\]⏰ \T\[\033[38;5;196m\]]─────\[\033[38;5;46m\][\[\033[38;5;51m\] 💀 PMC CYBER ROOT 💀 \[\033[38;5;46m\]]\[\033[38;5;196m\]───[\[\033[38;5;201m\]⚡\#\[\033[38;5;196m\]]\n\[\033[38;5;226m\]│ \[\033[38;5;129m\]🌟 \[\033[38;5;51m\]$(whoami)\[\033[38;5;226m\] in \[\033[38;5;129m\]$(pwd | sed "s|$HOME|~|")\n\[\033[38;5;196m\]╰─[\[\033[38;5;129m\]📁 \W\[\033[38;5;196m\]]────►\[\033[38;5;46m\] '

# Function untuk animasi loading
show_loading() {
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    local delay=0.1
    local iterations=10
    
    for ((i=0; i<iterations; i++)); do
        for ((j=0; j<${#chars}; j++)); do
            printf "\r\033[38;5;51m🚀 Loading PMC System ${chars:$j:1}\033[0m"
            sleep $delay
        done
    done
    printf "\r\033[38;5;46m✅ PMC System Ready!    \033[0m\n"
}

# Fungsi untuk menampilkan info sistem
show_system_info() {
    echo -e "\033[38;5;196m╔════════════════════════════════════════════════════════════════╗\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;226m                    🖥️  SYSTEM INFORMATION 🖥️                     \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m╠════════════════════════════════════════════════════════════════╣\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;46m 📱 Device: \033[38;5;51m$(uname -m)\033[38;5;46m | 🐧 OS: \033[38;5;51m$(uname -s)\033[38;5;46m | 🏠 Shell: \033[38;5;51m$SHELL  \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;129m 👤 User: \033[38;5;201m$(whoami)\033[38;5;129m | 🏡 Home: \033[38;5;201m$HOME                           \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;208m 📅 Date: \033[38;5;220m$(date '+%Y-%m-%d')\033[38;5;208m | ⏰ Time: \033[38;5;220m$(date '+%H:%M:%S')              \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m╚════════════════════════════════════════════════════════════════╝\033[0m"
}

# Fungsi untuk menampilkan quote hacker
show_hacker_quote() {
    local quotes=(
        "🔥 'Information is power. But like all power, there are those who want to keep it for themselves.' - Aaron Swartz"
        "💀 'The quieter you become, the more you can hear.' - Anonymous"
        "⚡ 'Privacy is not something that I'm merely entitled to, it's an absolute prerequisite.' - Marlon Brando"
        "🌟 'Knowledge is free, we are not. Free the information.' - PMC Team"
        "🎯 'In a world where you can be anything, be anonymous.' - Hacker Wisdom"
    )
    local random_quote=${quotes[$RANDOM % ${#quotes[@]}]}
    echo -e "\033[38;5;51m$random_quote\033[0m"
}

# Fungsi untuk efek matrix
matrix_effect() {
    echo -e "\033[38;5;46m"
    for i in {1..3}; do
        echo -n "01011010 01101000 01100001 01100011 01101011 01100101 01110010 "
        sleep 0.1
    done
    echo -e "\033[0m"
}

# Clear screen dengan efek
clear

# Tampilkan loading animation
show_loading

sleep 1
clear

echo " "
# Enhanced ASCII Art dengan gradient colors
echo -e "\033[38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣄⣠⣀⡀⣀⣠⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;208m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⢠⣠⣼⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⢠⣤⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;220m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣟⣾⣿⣽⣿⣿⣅⠈⠉⠻⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⢀⡶⠒⢉⡀⢠⣤⣶⣶⣿⣷⣆⣀⡀⠀⢲⣖⠒⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;46m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣶⣦⣤⣤⣶⣿⣿⣿⣿⣿⣿⣽⡿⠻⣷⣀⠀⢻⣿⣿⣿⡿⠟⠀⠀⠀⠀⠀⠀⣤⣶⣶⣤⣀⣀⣬⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣦⣼⣀⠀\033[0m"
echo -e "\033[38;5;51m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠓⣿⣿⠟⠁⠘⣿⡟⠁⠀⠘⠛⠁⠀⠀⢠⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠙⠁\033[0m"
echo -e "\033[38;5;129m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠟⠋⠀⠈⠙⣿⣿⣿⣿⣿⣿⣷⣦⡄⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣆⢘⣿⣯⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⠉⢱⡿⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;201m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡿⠦⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿\033[38;5;196m 💀 PMC CYBER 💀 \033[38;5;201m⣿⣿⣿⣿⣿⣿⣿⡿⡗⠀⠈⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣉⣿⡿⢿⢷⣾⣾⣿⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;208m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⠿⠿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣾⣿⣿⣷⣦⣶⣦⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀\033[0m"

echo " "
# Enhanced Logo dengan efek berkedip
echo -e "\033[38;5;46m ╔═══════════════════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[38;5;46m ║  \033[5m\033[38;5;196m💀 ╔═╗ ╔╦╗ ╔═╗   ╔╦╗ ╔═╗ ╦   ╦ ╦ ╔═╗ ╦═╗ ╔═╗   ╔╦╗ ╔═╗ ╔═╗ ╔╦╗ 💀\033[0m  \033[38;5;46m║\033[0m"
echo -e "\033[38;5;46m ║  \033[38;5;208m⚡ ╠═╝ ║║║ ║     ║║║ ╠═╣ ║   ║║║ ╠═╣ ╠╦╝ ║╣     ║  ║╣  ╠═╣ ║║║ ⚡\033[0m  \033[38;5;46m║\033[0m"
echo -e "\033[38;5;46m ║  \033[38;5;51m🔥 ╩   ╩ ╩ ╚═╝   ╩ ╩ ╩ ╩ ╩═╝ ╚╩╝ ╩ ╩ ╩╚═ ╚═╝    ╩  ╚═╝ ╩ ╩ ╩ ╩ 🔥\033[0m  \033[38;5;46m║\033[0m"
echo -e "\033[38;5;46m ╚═══════════════════════════════════════════════════════════════════════╝\033[0m"

echo " "
# Matrix effect
matrix_effect

echo " "
# Show system info
show_system_info

echo " "
# Show hacker quote
echo -e "\033[38;5;196m╔════════════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[38;5;196m║\033[38;5;226m                      💭 HACKER WISDOM 💭                         \033[38;5;196m║\033[0m"
echo -e "\033[38;5;196m╠════════════════════════════════════════════════════════════════╣\033[0m"
echo -e "\033[38;5;196m║ $(show_hacker_quote) \033[38;5;196m║\033[0m"
echo -e "\033[38;5;196m╚════════════════════════════════════════════════════════════════╝\033[0m"

echo " "
# Command tips dengan animasi
echo -e "\033[38;5;129m🎯 \033[1mQuick Commands:\033[0m"
echo -e "\033[38;5;51m   ├─ \033[38;5;226mls -la\033[38;5;51m     → List all files\033[0m"
echo -e "\033[38;5;51m   ├─ \033[38;5;226mps aux\033[38;5;51m     → Show processes\033[0m"
echo -e "\033[38;5;51m   ├─ \033[38;5;226mnetstat -tuln\033[38;5;51m → Network status\033[0m"
echo -e "\033[38;5;51m   └─ \033[38;5;226mwhoami\033[38;5;51m     → Current user\033[0m"

echo " "
# Enhanced creator info dengan gradient
echo -e "\033[38;5;196m                 ⚡ Created by \033[5m\033[38;5;226m./B7\033[0m \033[38;5;196m(\033[38;5;51mPMC MALWARE CYBER TEAM\033[38;5;196m) ⚡\033[0m"
echo -e "\033[38;5;129m                          🌟 Enhanced Terminal Experience 🌟\033[0m"

echo " "
# Neofetch jika tersedia
if command -v neofetch &> /dev/null; then
    echo -e "\033[38;5;46m🖥️  System Details:\033[0m"
    neofetch --ascii_distro arch_small
fi

echo " "
