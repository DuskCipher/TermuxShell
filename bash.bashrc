
command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}

# Dark Gothic PS1 dengan warna merah dan hitam
PS1='\[\033[38;5;196m\]╭─[\[\033[38;5;15m\]⏰ \T\[\033[38;5;196m\]]─────\[\033[38;5;9m\][\[\033[38;5;15m\] 💀 PMC CYBER ROOT 💀 \[\033[38;5;9m\]]\[\033[38;5;196m\]───[\[\033[38;5;208m\]⚡\#\[\033[38;5;196m\]]\n\[\033[38;5;8m\]│ \[\033[38;5;196m\]🔥 \[\033[38;5;15m\]$(whoami)\[\033[38;5;8m\] in \[\033[38;5;196m\]$(pwd | sed "s|$HOME|~|")\n\[\033[38;5;196m\]╰─[\[\033[38;5;9m\]📁 \W\[\033[38;5;196m\]]────►\[\033[38;5;15m\] '

# Fungsi untuk animasi loading dark
show_loading() {
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    local delay=0.1
    local iterations=8
    
    for ((i=0; i<iterations; i++)); do
        for ((j=0; j<${#chars}; j++)); do
            printf "\r\033[38;5;196m🔥 Loading PMC System ${chars:$j:1}\033[0m"
            sleep $delay
        done
    done
    printf "\r\033[38;5;9m✅ PMC System Ready!    \033[0m\n"
}

# Fungsi untuk menampilkan info sistem dengan tema dark
show_system_info() {
    echo -e "\033[38;5;196m╔════════════════════════════════════════════════════════════════╗\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;15m                    🖥️  SYSTEM INFORMATION 🖥️                     \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m╠════════════════════════════════════════════════════════════════╣\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;9m 📱 Device: \033[38;5;15m$(uname -m)\033[38;5;9m | 🐧 OS: \033[38;5;15m$(uname -s)\033[38;5;9m | 🏠 Shell: \033[38;5;15m$SHELL  \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;8m 👤 User: \033[38;5;15m$(whoami)\033[38;5;8m | 🏡 Home: \033[38;5;15m$HOME                           \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m║\033[38;5;208m 📅 Date: \033[38;5;15m$(date '+%Y-%m-%d')\033[38;5;208m | ⏰ Time: \033[38;5;15m$(date '+%H:%M:%S')              \033[38;5;196m║\033[0m"
    echo -e "\033[38;5;196m╚════════════════════════════════════════════════════════════════╝\033[0m"
}

# Fungsi untuk menampilkan quote hacker dengan tema dark
show_hacker_quote() {
    local quotes=(
        "🔥 'Information is power. But like all power, there are those who want to keep it for themselves.' - Aaron Swartz"
        "💀 'The quieter you become, the more you can hear.' - Anonymous"
        "⚡ 'Privacy is not something that I'm merely entitled to, it's an absolute prerequisite.' - Marlon Brando"
        "🎯 'Knowledge is free, we are not. Free the information.' - PMC Team"
        "🔴 'In a world where you can be anything, be anonymous.' - Hacker Wisdom"
    )
    local random_quote=${quotes[$RANDOM % ${#quotes[@]}]}
    echo -e "\033[38;5;15m$random_quote\033[0m"
}

# Fungsi untuk efek matrix dark
matrix_effect() {
    echo -e "\033[38;5;9m"
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
# Dark Gothic ASCII Art
echo -e "\033[38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣄⣠⣀⡀⣀⣠⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;9m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⢠⣠⣼⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⢠⣤⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;8m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣟⣾⣿⣽⣿⣿⣅⠈⠉⠻⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⢀⡶⠒⢉⡀⢠⣤⣶⣶⣿⣷⣆⣀⡀⠀⢲⣖⠒⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣶⣦⣤⣤⣶⣿⣿⣿⣿⣿⣿⣽⡿⠻⣷⣀⠀⢻⣿⣿⣿⡿⠟⠀⠀⠀⠀⠀⠀⣤⣶⣶⣤⣀⣀⣬⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣦⣼⣀⠀\033[0m"
echo -e "\033[38;5;9m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠓⣿⣿⠟⠁⠘⣿⡟⠁⠀⠘⠛⠁⠀⠀⢠⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠙⠁\033[0m"
echo -e "\033[38;5;8m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠟⠋⠀⠈⠙⣿⣿⣿⣿⣿⣿⣷⣦⡄⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣆⢘⣿⣯⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⠉⢱⡿⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡿⠦⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿\033[38;5;15m 💀 PMC CYBER 💀 \033[38;5;196m⣿⣿⣿⣿⣿⣿⣿⡿⡗⠀⠈⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;9m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣉⣿⡿⢿⢷⣾⣾⣿⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀\033[0m"
echo -e "\033[38;5;8m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⠿⠿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣾⣿⣿⣷⣦⣶⣦⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀\033[0m"

echo " "
# Dark Gothic Logo
echo -e "\033[38;5;196m ╔═══════════════════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[38;5;196m ║  \033[1m\033[38;5;15m💀 ╔═╗ ╔╦╗ ╔═╗   ╔╦╗ ╔═╗ ╦   ╦ ╦ ╔═╗ ╦═╗ ╔═╗   ╔╦╗ ╔═╗ ╔═╗ ╔╦╗ 💀\033[0m  \033[38;5;196m║\033[0m"
echo -e "\033[38;5;196m ║  \033[38;5;9m⚡ ╠═╝ ║║║ ║     ║║║ ╠═╣ ║   ║║║ ╠═╣ ╠╦╝ ║╣     ║  ║╣  ╠═╣ ║║║ ⚡\033[0m  \033[38;5;196m║\033[0m"
echo -e "\033[38;5;196m ║  \033[38;5;8m🔥 ╩   ╩ ╩ ╚═╝   ╩ ╩ ╩ ╩ ╩═╝ ╚╩╝ ╩ ╩ ╩╚═ ╚═╝    ╩  ╚═╝ ╩ ╩ ╩ ╩ 🔥\033[0m  \033[38;5;196m║\033[0m"
echo -e "\033[38;5;196m ╚═══════════════════════════════════════════════════════════════════════╝\033[0m"

echo " "
# Matrix effect dark
matrix_effect

echo " "
# Show system info
show_system_info

echo " "
# Show hacker quote
echo -e "\033[38;5;196m╔════════════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[38;5;196m║\033[38;5;15m                      💭 HACKER WISDOM 💭                         \033[38;5;196m║\033[0m"
echo -e "\033[38;5;196m╠════════════════════════════════════════════════════════════════╣\033[0m"
echo -e "\033[38;5;196m║ $(show_hacker_quote) \033[38;5;196m║\033[0m"
echo -e "\033[38;5;196m╚════════════════════════════════════════════════════════════════╝\033[0m"

echo " "
# Command tips dengan tema dark
echo -e "\033[38;5;9m🎯 \033[1mQuick Commands:\033[0m"
echo -e "\033[38;5;8m   ├─ \033[38;5;15mls -la\033[38;5;8m     → List all files\033[0m"
echo -e "\033[38;5;8m   ├─ \033[38;5;15mps aux\033[38;5;8m     → Show processes\033[0m"
echo -e "\033[38;5;8m   ├─ \033[38;5;15mnetstat -tuln\033[38;5;8m → Network status\033[0m"
echo -e "\033[38;5;8m   └─ \033[38;5;15mwhoami\033[38;5;8m     → Current user\033[0m"

echo " "
# Enhanced creator info dengan tema dark
echo -e "\033[38;5;196m                 ⚡ Created by \033[1m\033[38;5;15m./B7\033[0m \033[38;5;196m(\033[38;5;9mPMC MALWARE CYBER TEAM\033[38;5;196m) ⚡\033[0m"
echo -e "\033[38;5;8m                          🔥 Dark Terminal Experience 🔥\033[0m"

echo " "
# Neofetch jika tersedia
if command -v neofetch &> /dev/null; then
    echo -e "\033[38;5;9m🖥️  System Details:\033[0m"
    neofetch --ascii_distro arch_small
fi

echo " "
