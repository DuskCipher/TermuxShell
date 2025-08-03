
#!/bin/bash
# Termux Shell Beautification Tool - Enhanced Version
# Compatible with Linux, Termux, and other Unix systems

__version__="2.0"

## Enhanced ANSI colors (FG & BG)
R="$(printf '\033[31m')"  
GR="$(printf '\033[32m')"  
O="$(printf '\033[33m')"  
BL="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  
CYAN="$(printf '\033[36m')"  
WT="$(printf '\033[37m')" 
BLK="$(printf '\033[30m')"
RBG="$(printf '\033[41m')"  
GRBG="$(printf '\033[42m')"  
OBG="$(printf '\033[43m')"  
BLBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  
CYANBG="$(printf '\033[46m')"  
WTBG="$(printf '\033[47m')" 
BLKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

# Enhanced color palette
LIGHT_RED='\033[91m'
LIGHT_GREEN='\033[92m'
LIGHT_YELLOW='\033[93m'
LIGHT_BLUE='\033[94m'
LIGHT_MAGENTA='\033[95m'
LIGHT_CYAN='\033[96m'
LIGHT_WHITE='\033[97m'
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
RESET='\033[0m'

#------------------------ System Detection ---------------------#
detect_system() {
    if [[ -d "/data/data/com.termux" ]]; then
        SYSTEM="termux"
        PREFIX="/data/data/com.termux/files/usr"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        SYSTEM="linux"
        PREFIX="/usr"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        SYSTEM="macos"
        PREFIX="/usr/local"
    else
        SYSTEM="unix"
        PREFIX="/usr"
    fi
}

#------------------------ Modern Loading Animation ---------------------#
loading_animation() {
    local text="$1"
    local duration=${2:-3}
    local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
    local end_time=$((SECONDS + duration))
    
    printf "${CYAN}${BOLD}"
    while [ $SECONDS -lt $end_time ]; do
        for frame in "${frames[@]}"; do
            printf "\r  %s %s" "$frame" "$text"
            sleep 0.1
        done
    done
    printf "\r  ✅ %s - ${LIGHT_GREEN}Completed!${RESET}\n"
}

#------------------------ Progress Bar ---------------------#
progress_bar() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local completed=$((current * width / total))
    local remaining=$((width - completed))
    
    printf "\r${CYAN}Progress: [${LIGHT_GREEN}"
    printf "%*s" $completed | tr ' ' '█'
    printf "${RESET}"
    printf "%*s" $remaining | tr ' ' '░'
    printf "${CYAN}] ${BOLD}%d%%${RESET}" $percentage
    
    if [[ $current -eq $total ]]; then
        printf "\n"
    fi
}

#------------------------ Modern Notification System ---------------------#
show_notification() {
    local type="$1"
    local message="$2"
    local timestamp=$(date "+%H:%M:%S")
    
    case "$type" in
        "success")
            printf "${LIGHT_GREEN}${BOLD}✅ SUCCESS${RESET} ${LIGHT_WHITE}[${timestamp}]${RESET} ${message}\n"
            ;;
        "error")
            printf "${LIGHT_RED}${BOLD}❌ ERROR${RESET} ${LIGHT_WHITE}[${timestamp}]${RESET} ${message}\n"
            ;;
        "warning")
            printf "${LIGHT_YELLOW}${BOLD}⚠️  WARNING${RESET} ${LIGHT_WHITE}[${timestamp}]${RESET} ${message}\n"
            ;;
        "info")
            printf "${LIGHT_BLUE}${BOLD}ℹ️  INFO${RESET} ${LIGHT_WHITE}[${timestamp}]${RESET} ${message}\n"
            ;;
        *)
            printf "${LIGHT_WHITE}${BOLD}📢 ${RESET}${message}\n"
            ;;
    esac
}

#------------------------ Typing Effect ---------------------#
typing_effect() {
    local text="$1"
    local speed=${2:-0.05}
    local color="${3:-$LIGHT_WHITE}"
    
    printf "${color}"
    for ((i=0; i<${#text}; i++)); do
        printf "${text:$i:1}"
        sleep $speed
    done
    printf "${RESET}\n"
}

#------------------------ Modern Box Drawing ---------------------#
draw_box() {
    local text="$1"
    local color="${2:-$LIGHT_CYAN}"
    local length=${#text}
    local box_width=$((length + 4))
    
    printf "${color}${BOLD}"
    printf "╔"
    printf "%*s" $((box_width-2)) | tr ' ' '═'
    printf "╗\n"
    printf "║  %s  ║\n" "$text"
    printf "╚"
    printf "%*s" $((box_width-2)) | tr ' ' '═'
    printf "╝${RESET}\n"
}

#------------------------ Internet Status Check ---------------------#
check_status() {
    printf "\n${LIGHT_BLUE}${BOLD}🌐 System Information:${RESET}\n"
    printf "   ${LIGHT_WHITE}├─ OS Type: ${LIGHT_CYAN}%s${RESET}\n" "$OSTYPE"
    printf "   ${LIGHT_WHITE}├─ System: ${LIGHT_CYAN}%s${RESET}\n" "$SYSTEM"
    printf "   ${LIGHT_WHITE}├─ User: ${LIGHT_CYAN}%s${RESET}\n" "$USER"
    printf "   ${LIGHT_WHITE}└─ Internet: " 
    
    if timeout 3s curl -fIs "https://api.github.com" >/dev/null 2>&1; then
        printf "${LIGHT_GREEN}${BOLD}Online ✅${RESET}\n"
    else
        printf "${LIGHT_RED}${BOLD}Offline ❌${RESET}\n"
    fi
}

#------------------------ Rainbow Banner ---------------------#
rainbow_banner() {
    clear
    printf "\n"
    printf "${LIGHT_RED}████████${LIGHT_YELLOW}████████${LIGHT_GREEN}████████${LIGHT_CYAN}████████${LIGHT_BLUE}████████${LIGHT_MAGENTA}████████${RESET}\n"
    printf "${LIGHT_YELLOW}██${RESET}                                                            ${LIGHT_YELLOW}██${RESET}\n"
    printf "${LIGHT_GREEN}██${RESET}  ${BOLD}${LIGHT_WHITE}╔╦╗╔═╗╦═╗╔╦╗╦ ╦═╗ ╦  ╔═╗╦ ╦╔═╗╦  ╦    ╔╗ ╔═╗╔═╗╦ ╦╔╦╗╦╔═╗╦ ╦  ${RESET}${LIGHT_GREEN}██${RESET}\n"
    printf "${LIGHT_CYAN}██${RESET}  ${BOLD}${LIGHT_WHITE} ║ ║╣ ╠╦╝║║║║ ║╚╦╝  ╚═╗╠═╣║╣ ║  ║    ╠╩╗║╣ ╠═╣║ ║ ║ ║╠╣ ╚╦╝  ${RESET}${LIGHT_CYAN}██${RESET}\n"
    printf "${LIGHT_BLUE}██${RESET}  ${BOLD}${LIGHT_WHITE} ╩ ╚═╝╩╚═╩ ╩╚═╝ ╩   ╚═╝╩ ╩╚═╝╩═╝╩═╝  ╚═╝╚═╝╩ ╩╚═╝ ╩ ╩╚   ╩   ${RESET}${LIGHT_BLUE}██${RESET}\n"
    printf "${LIGHT_MAGENTA}██${RESET}                                                            ${LIGHT_MAGENTA}██${RESET}\n"
    printf "${LIGHT_RED}████████${LIGHT_YELLOW}████████${LIGHT_GREEN}████████${LIGHT_CYAN}████████${LIGHT_BLUE}████████${LIGHT_MAGENTA}████████${RESET}\n"
    printf "\n"
    printf "                    ${BOLD}${LIGHT_WHITE}🎨 Enhanced Version ${__version__} 🎨${RESET}\n"
    printf "              ${LIGHT_CYAN}Created by ${BOLD}./B7${RESET} ${LIGHT_CYAN}(${LIGHT_YELLOW}PMC MALWARE CYBER${LIGHT_CYAN})${RESET}\n"
    printf "                    ${DIM}Compatible with Linux & Termux${RESET}\n"
}

#------------------------ Modern Menu System ---------------------#
modern_menu() {
    printf "\n${LIGHT_WHITE}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║                         🎨 MAIN MENU 🎨                        ║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[01]${RESET} ${LIGHT_WHITE}🎭 Shell Banner Themes             ${LIGHT_CYAN}(Multiple Options)${RESET}  ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_YELLOW}[02]${RESET} ${LIGHT_WHITE}✨ Custom Banner Creator           ${LIGHT_MAGENTA}(Premium - 1k)${RESET}  ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_BLUE}[03]${RESET} ${LIGHT_WHITE}🔄 Update Script                   ${LIGHT_GREEN}(Latest Version)${RESET} ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_MAGENTA}[04]${RESET} ${LIGHT_WHITE}🌈 Rainbow Mode                    ${LIGHT_RED}(New Feature!)${RESET}   ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_CYAN}[05]${RESET} ${LIGHT_WHITE}🔧 System Information              ${LIGHT_BLUE}(Diagnostics)${RESET}    ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[99]${RESET} ${LIGHT_WHITE}ℹ️  About & Credits                 ${LIGHT_WHITE}(Information)${RESET}    ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${DIM}[00]${RESET} ${DIM}🚪 Exit                             (Goodbye!)${RESET}       ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_YELLOW}[RP]${RESET} ${LIGHT_WHITE}🔥 Premium User Banners            ${LIGHT_RED}(Password Required)${RESET} ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}\n"
    printf "\n"
}

#------------------------ Enhanced Installation ---------------------#
install_dependencies() {
    rainbow_banner
    check_status
    printf "\n"
    draw_box "DEPENDENCY INSTALLATION REQUIRED" "$LIGHT_YELLOW"
    printf "\n"
    show_notification "warning" "Beberapa paket diperlukan untuk menjalankan tool ini!"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}📦 Paket yang akan diinstall:${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ Ruby${RESET} ${DIM}(untuk scripting)${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ Neofetch${RESET} ${DIM}(untuk system info)${RESET}\n"
    printf "   ${LIGHT_GREEN}└─ Git${RESET} ${DIM}(untuk update)${RESET}\n"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}╔════════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_CYAN}[01]${RESET} ${LIGHT_WHITE}❌ Tidak, keluar sekarang${RESET}           ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[02]${RESET} ${LIGHT_WHITE}✅ Ya, install dependencies${RESET}         ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚════════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" choice

    case "$choice" in
        1|01)
            show_notification "info" "Installation dibatalkan. Goodbye! 👋"
            exit 0
            ;;
        2|02)
            printf "\n"
            show_notification "info" "Memulai instalasi dependencies..."
            
            loading_animation "Updating package list" 2
            
            if [[ "$SYSTEM" == "termux" ]]; then
                apt update >/dev/null 2>&1
                for i in {1..3}; do
                    progress_bar $i 3
                    sleep 0.5
                done
                
                loading_animation "Installing Ruby" 3
                apt install ruby -y >/dev/null 2>&1
                
                loading_animation "Installing Neofetch" 2
                pkg install neofetch -y >/dev/null 2>&1
                
            else
                # For Linux systems
                if command -v apt >/dev/null 2>&1; then
                    sudo apt update >/dev/null 2>&1
                    sudo apt install ruby neofetch git -y >/dev/null 2>&1
                elif command -v yum >/dev/null 2>&1; then
                    sudo yum install ruby neofetch git -y >/dev/null 2>&1
                elif command -v pacman >/dev/null 2>&1; then
                    sudo pacman -S ruby neofetch git --noconfirm >/dev/null 2>&1
                fi
            fi
            
            printf "\n"
            show_notification "success" "Semua dependencies berhasil diinstall! 🎉"
            sleep 2
            main_program
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            install_dependencies
            ;;
    esac
}

#------------------------ Theme Menu ---------------------#
theme_menu() {
    rainbow_banner
    printf "\n"
    draw_box "SHELL THEME SELECTION" "$LIGHT_GREEN"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}🎨 Pilih tema shell yang kamu inginkan:${RESET}\n"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}╔════════════════════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[F1]${RESET} ${LIGHT_WHITE}💀 PMC Team Theme      ${LIGHT_CYAN}(Cyber Style)${RESET}      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[F2]${RESET} ${LIGHT_WHITE}🤖 Android Theme       ${LIGHT_YELLOW}(Green Robot)${RESET}     ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_WHITE}[F3]${RESET} ${LIGHT_WHITE}⚫ Black Team Theme     ${LIGHT_WHITE}(Dark Mode)${RESET}       ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_BLUE}[F4]${RESET} ${LIGHT_WHITE}🎭 Anonymous Hacker     ${LIGHT_MAGENTA}(Mystery)${RESET}        ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[F5]${RESET} ${LIGHT_WHITE}⚫ Dark Gothic Theme    ${LIGHT_RED}(Dark Mode!)${RESET}      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${DIM}[00]${RESET} ${DIM}🔙 Kembali ke Menu Utama${RESET}                  ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚════════════════════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih tema [F1-F5]: ${RESET}")" theme_choice

    case "$theme_choice" in
        1|F1|f1)
            apply_theme "pmc"
            ;;
        2|F2|f2)
            apply_theme "android"
            ;;
        3|F3|f3)
            apply_theme "black"
            ;;
        4|F4|f4)
            apply_theme "anon"
            ;;
        5|F5|f5)
            apply_theme "dark"
            ;;
        00|0)
            main_program
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            theme_menu
            ;;
    esac
}

#------------------------ Apply Theme ---------------------#
apply_theme() {
    local theme="$1"
    printf "\n"
    show_notification "info" "Menerapkan tema ${theme}..."
    
    loading_animation "Configuring shell environment" 3
    
    case "$theme" in
        "pmc")
            if [[ -f "bash.bashrc" ]]; then
                cp bash.bashrc "$PREFIX/etc/bash.bashrc" 2>/dev/null || sudo cp bash.bashrc "$PREFIX/etc/bash.bashrc"
                if [[ -f "login/motd" ]]; then
                    cp login/motd "$PREFIX/etc/motd" 2>/dev/null || sudo cp login/motd "$PREFIX/etc/motd"
                fi
                show_notification "success" "PMC Team theme berhasil diterapkan! 💀"
            fi
            ;;
        "android")
            if [[ -f "android/bash.bashrc" ]]; then
                cp android/bash.bashrc "$PREFIX/etc/bash.bashrc" 2>/dev/null || sudo cp android/bash.bashrc "$PREFIX/etc/bash.bashrc"
                show_notification "success" "Android theme berhasil diterapkan! 🤖"
            fi
            ;;
        "black")
            if [[ -f "black/bash.bashrc" ]]; then
                cp black/bash.bashrc "$PREFIX/etc/bash.bashrc" 2>/dev/null || sudo cp black/bash.bashrc "$PREFIX/etc/bash.bashrc"
                show_notification "success" "Black Team theme berhasil diterapkan! ⚫"
            fi
            ;;
        "anon")
            if [[ -f "anon/bash.bashrc" ]]; then
                cp anon/bash.bashrc "$PREFIX/etc/bash.bashrc" 2>/dev/null || sudo cp anon/bash.bashrc "$PREFIX/etc/bash.bashrc"
                show_notification "success" "Anonymous theme berhasil diterapkan! 🎭"
            fi
            ;;
        "dark")
            # Dark theme menggunakan bash.bashrc utama yang sudah diupdate
            cp bash.bashrc "$PREFIX/etc/bash.bashrc" 2>/dev/null || sudo cp bash.bashrc "$PREFIX/etc/bash.bashrc"
            show_notification "success" "Dark Gothic theme berhasil diterapkan! ⚫"
            ;;
    esac
    
    printf "\n"
    show_notification "warning" "Restart terminal untuk melihat perubahan!"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}╔═══════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[01]${RESET} ${LIGHT_WHITE}🔙 Kembali ke Menu Utama${RESET}        ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[02]${RESET} ${LIGHT_WHITE}🚪 Exit${RESET}                      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚═══════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" back_choice

    case "$back_choice" in
        1|01)
            main_program
            ;;
        2|02)
            exit_message
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            apply_theme "$theme"
            ;;
    esac
}

#------------------------ Dark Gothic Theme ---------------------#
dark_gothic_theme() {
    printf "\n"
    show_notification "info" "Mengaktifkan Dark Gothic Theme - Tema Gelap!"
    
    loading_animation "Generating dark theme configuration" 3
    
    # Dark theme sudah ada di bash.bashrc utama
    show_notification "success" "Dark Gothic theme berhasil diterapkan! ⚫"
    
    printf "\n"
    show_notification "warning" "Restart terminal untuk melihat perubahan!"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}╔═══════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[01]${RESET} ${LIGHT_WHITE}🔙 Kembali ke Menu Utama${RESET}        ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[02]${RESET} ${LIGHT_WHITE}🚪 Exit${RESET}                      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚═══════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" dark_choice

    case "$dark_choice" in
        1|01)
            main_program
            ;;
        2|02)
            exit_message
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            dark_gothic_theme
            ;;
    esac
}

#------------------------ Rainbow Mode ---------------------#
rainbow_mode() {
    rainbow_banner
    printf "\n"
    draw_box "RAINBOW MODE ACTIVATION" "$LIGHT_MAGENTA"
    printf "\n"
    show_notification "info" "Mengaktifkan Rainbow Mode - Mode warna-warni!"
    
    loading_animation "Generating rainbow theme configuration" 3
    
    # Create rainbow bash configuration
    cat > rainbow_bash.bashrc << 'EOF'

# Rainbow PS1 with changing colors
PS1='\[\033[38;5;196m\]┌─[\[\033[38;5;208m\]\T\[\033[38;5;196m\]]─────\[\033[38;5;46m\][ \[\033[38;5;51m\]RAINBOW USER \[\033[38;5;46m\]]\[\033[38;5;196m\]───[\[\033[38;5;201m\]\#\[\033[38;5;196m\]]\n\[\033[38;5;226m\]|\n\[\033[38;5;196m\]└─[\[\033[38;5;129m\]\W\[\033[38;5;196m\]]────►\[\033[38;5;46m\]'

clear
echo " "
echo -e "\033[38;5;196m██████╗  \033[38;5;208m█████╗ \033[38;5;220m██╗\033[38;5;46m███╗   ██╗\033[38;5;51m██████╗  \033[38;5;129m██████╗ \033[38;5;201m██╗    ██╗"
echo -e "\033[38;5;208m██╔══██╗\033[38;5;220m██╔══██╗\033[38;5;46m██║\033[38;5;51m████╗  ██║\033[38;5;129m██╔══██╗\033[38;5;201m██╔═══██╗\033[38;5;196m██║    ██║"
echo -e "\033[38;5;220m██████╔╝\033[38;5;46m███████║\033[38;5;51m██║\033[38;5;129m██╔██╗ ██║\033[38;5;201m██████╔╝\033[38;5;196m██║   ██║\033[38;5;208m██║ █╗ ██║"
echo -e "\033[38;5;46m██╔══██╗\033[38;5;51m██╔══██║\033[38;5;129m██║\033[38;5;201m██║╚██╗██║\033[38;5;196m██╔══██╗\033[38;5;208m██║   ██║\033[38;5;220m██║███╗██║"
echo -e "\033[38;5;51m██║  ██║\033[38;5;129m██║  ██║\033[38;5;201m██║\033[38;5;196m██║ ╚████║\033[38;5;208m██████╔╝\033[38;5;220m╚██████╔╝\033[38;5;46m╚███╔███╔╝"
echo -e "\033[38;5;129m╚═╝  ╚═╝\033[38;5;201m╚═╝  ╚═╝\033[38;5;196m╚═╝\033[38;5;208m╚═╝  ╚═══╝\033[38;5;220m╚═════╝ \033[38;5;46m ╚═════╝ \033[38;5;51m ╚══╝╚══╝ "
echo " "
echo -e "                     \033[1;37m🌈 Rainbow Mode Activated! 🌈"
echo -e "                     \033[1;36mCreated by ./B7 (PMC Team)"
echo " "
EOF

    cp rainbow_bash.bashrc "$PREFIX/etc/bash.bashrc" 2>/dev/null || sudo cp rainbow_bash.bashrc "$PREFIX/etc/bash.bashrc"
    rm -f rainbow_bash.bashrc

    printf "\n"
    show_notification "success" "Rainbow mode berhasil diaktifkan! 🌈"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}╔═══════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[01]${RESET} ${LIGHT_WHITE}🔙 Kembali ke Menu Utama${RESET}        ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[02]${RESET} ${LIGHT_WHITE}🚪 Exit${RESET}                      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚═══════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" rainbow_choice

    case "$rainbow_choice" in
        1|01)
            main_program
            ;;
        2|02)
            exit_message
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            rainbow_mode
            ;;
    esac
}

#------------------------ System Information ---------------------#
system_info() {
    rainbow_banner
    printf "\n"
    draw_box "SYSTEM INFORMATION & DIAGNOSTICS" "$LIGHT_BLUE"
    printf "\n"
    
    printf "${LIGHT_WHITE}${BOLD}🖥️  Hardware Information:${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ OS: ${LIGHT_WHITE}%s${RESET}\n" "$(uname -s)"
    printf "   ${LIGHT_GREEN}├─ Kernel: ${LIGHT_WHITE}%s${RESET}\n" "$(uname -r)"
    printf "   ${LIGHT_GREEN}├─ Architecture: ${LIGHT_WHITE}%s${RESET}\n" "$(uname -m)"
    printf "   ${LIGHT_GREEN}└─ Hostname: ${LIGHT_WHITE}%s${RESET}\n" "$(hostname)"
    
    printf "\n${LIGHT_WHITE}${BOLD}📁 Directory Information:${RESET}\n"
    printf "   ${LIGHT_CYAN}├─ Home: ${LIGHT_WHITE}%s${RESET}\n" "$HOME"
    printf "   ${LIGHT_CYAN}├─ Current: ${LIGHT_WHITE}%s${RESET}\n" "$(pwd)"
    printf "   ${LIGHT_CYAN}├─ Shell: ${LIGHT_WHITE}%s${RESET}\n" "$SHELL"
    printf "   ${LIGHT_CYAN}└─ Prefix: ${LIGHT_WHITE}%s${RESET}\n" "$PREFIX"
    
    if command -v neofetch >/dev/null 2>&1; then
        printf "\n${LIGHT_WHITE}${BOLD}🎨 Running Neofetch...${RESET}\n"
        neofetch
    fi
    
    printf "\n${LIGHT_WHITE}${BOLD}╔═══════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[01]${RESET} ${LIGHT_WHITE}🔙 Kembali ke Menu Utama${RESET}        ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[02]${RESET} ${LIGHT_WHITE}🚪 Exit${RESET}                      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚═══════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" info_choice

    case "$info_choice" in
        1|01)
            main_program
            ;;
        2|02)
            exit_message
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            system_info
            ;;
    esac
}

#------------------------ About Section ---------------------#
about_section() {
    rainbow_banner
    printf "\n"
    draw_box "ABOUT & CREDITS" "$LIGHT_MAGENTA"
    printf "\n"
    
    printf "${LIGHT_WHITE}${BOLD}👨‍💻 Developer Information:${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ Author: ${LIGHT_WHITE}./B7${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ Team: ${LIGHT_YELLOW}PMC MALWARE CYBER${RESET}\n" 
    printf "   ${LIGHT_GREEN}├─ Version: ${LIGHT_CYAN}%s${RESET}\n" "$__version__"
    printf "   ${LIGHT_GREEN}└─ License: ${LIGHT_WHITE}MIT${RESET}\n"
    
    printf "\n${LIGHT_WHITE}${BOLD}🌐 Social Media & Links:${RESET}\n"
    printf "   ${LIGHT_BLUE}├─ GitHub: ${LIGHT_WHITE}https://github.com/Unlimitid-Crak-You${RESET}\n"
    printf "   ${LIGHT_BLUE}├─ Instagram: ${LIGHT_WHITE}@aprizal_febrian${RESET}\n"
    printf "   ${LIGHT_BLUE}└─ WhatsApp: ${LIGHT_WHITE}+62 831-3756-0358${RESET}\n"
    
    printf "\n${LIGHT_WHITE}${BOLD}🛡️  Disclaimer:${RESET}\n"
    printf "   ${LIGHT_RED}├─ Tool ini dibuat untuk tujuan edukasi${RESET}\n"
    printf "   ${LIGHT_RED}├─ Author tidak bertanggung jawab atas penyalahgunaan${RESET}\n"
    printf "   ${LIGHT_RED}└─ Gunakan dengan bijak dan bertanggung jawab${RESET}\n"
    
    printf "\n${LIGHT_WHITE}${BOLD}🎉 Features:${RESET}\n"
    printf "   ${LIGHT_YELLOW}├─ Cross-platform compatibility (Linux/Termux)${RESET}\n"
    printf "   ${LIGHT_YELLOW}├─ Multiple shell themes${RESET}\n"
    printf "   ${LIGHT_YELLOW}├─ Rainbow mode with animations${RESET}\n"
    printf "   ${LIGHT_YELLOW}├─ Modern UI with progress bars${RESET}\n"
    printf "   ${LIGHT_YELLOW}└─ Auto system detection${RESET}\n"
    
    printf "\n${LIGHT_WHITE}${BOLD}╔═══════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[01]${RESET} ${LIGHT_WHITE}🔙 Kembali ke Menu Utama${RESET}        ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[02]${RESET} ${LIGHT_WHITE}🚪 Exit${RESET}                      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚═══════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" about_choice

    case "$about_choice" in
        1|01)
            main_program
            ;;
        2|02)
            exit_message
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            about_section
            ;;
    esac
}

#------------------------ Exit Message ---------------------#
exit_message() {
    clear
    printf "\n"
    printf "${LIGHT_GREEN}${BOLD}╔════════════════════════════════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}║${RESET}                                                                ${LIGHT_GREEN}${BOLD}║${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}║${RESET}    ${LIGHT_WHITE}${BOLD}🎉 Thank you for using Termux Shell Beautifier! 🎉${RESET}      ${LIGHT_GREEN}${BOLD}║${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}║${RESET}                                                                ${LIGHT_GREEN}${BOLD}║${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}║${RESET}      ${LIGHT_CYAN}Don't forget to restart your terminal to see changes!${RESET}   ${LIGHT_GREEN}${BOLD}║${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}║${RESET}                                                                ${LIGHT_GREEN}${BOLD}║${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}║${RESET}              ${LIGHT_YELLOW}Created with ❤️  by ./B7 (PMC Team)${RESET}             ${LIGHT_GREEN}${BOLD}║${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}║${RESET}                                                                ${LIGHT_GREEN}${BOLD}║${RESET}\n"
    printf "${LIGHT_GREEN}${BOLD}╚════════════════════════════════════════════════════════════════╝${RESET}\n"
    printf "\n"
    typing_effect "Goodbye! Have a great day! 👋" 0.1 "$LIGHT_WHITE"
    exit 0
}

#------------------------ Update Function ---------------------#
update_script() {
    rainbow_banner
    printf "\n"
    draw_box "SCRIPT UPDATE CENTER" "$LIGHT_BLUE"
    printf "\n"
    show_notification "warning" "Update akan mendownload versi terbaru dari GitHub"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}╔════════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[01]${RESET} ${LIGHT_WHITE}❌ Tidak, batal update${RESET}            ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[02]${RESET} ${LIGHT_WHITE}✅ Ya, update sekarang${RESET}           ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚════════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" update_choice

    case "$update_choice" in
        1|01)
            main_program
            ;;
        2|02)
            printf "\n"
            loading_animation "Connecting to GitHub" 2
            loading_animation "Downloading latest version" 3
            loading_animation "Installing update" 2
            
            cd "$HOME" || exit
            rm -rf termux_sell
            if git clone https://github.com/Unlimited-Crack-You/termux_sell.git >/dev/null 2>&1; then
                cd termux_sell || exit
                chmod +x *
                show_notification "success" "Update berhasil! Menjalankan versi terbaru..."
                sleep 2
                exec bash install.sh
            else
                show_notification "error" "Update gagal! Periksa koneksi internet."
                sleep 2
                main_program
            fi
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            update_script
            ;;
    esac
}

#------------------------ Custom Banner ---------------------#
custom_banner() {
    rainbow_banner
    printf "\n"
    draw_box "CUSTOM BANNER CREATOR" "$LIGHT_YELLOW"
    printf "\n"
    show_notification "info" "Custom banner dengan tema sesuai keinginan kamu!"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}💰 Harga: ${LIGHT_GREEN}Rp 1.000${RESET} ${DIM}(untuk ngopi developer 😄)${RESET}\n"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}✨ Yang kamu dapat:${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ Banner dengan nama kamu${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ Tema sesuai keinginan${RESET}\n"
    printf "   ${LIGHT_GREEN}├─ Warna custom${RESET}\n"
    printf "   ${LIGHT_GREEN}└─ Support seumur hidup${RESET}\n"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}╔════════════════════════════════════════╗${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[01]${RESET} ${LIGHT_WHITE}📱 Hubungi Admin${RESET}               ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_BLUE}[02]${RESET} ${LIGHT_WHITE}🔙 Kembali ke Menu Utama${RESET}       ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[03]${RESET} ${LIGHT_WHITE}🚪 Exit${RESET}                     ${LIGHT_WHITE}${BOLD}║${RESET}\n"
    printf "${LIGHT_WHITE}${BOLD}╚════════════════════════════════════════╝${RESET}\n"
    printf "\n"
    read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih opsi: ${RESET}")" custom_choice

    case "$custom_choice" in
        1|01)
            show_notification "info" "Membuka WhatsApp..."
            if command -v am >/dev/null 2>&1; then
                am start -a android.intent.action.VIEW https://wa.me/6283137560358
            else
                printf "${LIGHT_GREEN}Contact: ${LIGHT_WHITE}https://wa.me/6283137560358${RESET}\n"
            fi
            sleep 2
            custom_banner
            ;;
        2|02)
            main_program
            ;;
        3|03)
            exit_message
            ;;
        *)
            show_notification "error" "Opsi tidak valid!"
            sleep 1
            custom_banner
            ;;
    esac
}

#------------------------ Premium User Section ---------------------#
premium_user() {
    rainbow_banner
    printf "\n"
    draw_box "PREMIUM USER AREA" "$LIGHT_RED"
    printf "\n"
    show_notification "warning" "Area khusus untuk pengguna premium"
    printf "\n"
    printf "${LIGHT_WHITE}${BOLD}🔒 Masukkan password premium:${RESET}\n"
    printf "\n"
    read -sp "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Password: ${RESET}")" premium_pass
    printf "\n\n"
    
    if [[ "$premium_pass" == "Amang" ]]; then
        show_notification "success" "Password benar! Akses premium diberikan 🔓"
        printf "\n"
        printf "${LIGHT_WHITE}${BOLD}🎭 Premium Themes Available:${RESET}\n"
        printf "\n"
        printf "${LIGHT_WHITE}${BOLD}╔════════════════════════════════════════╗${RESET}\n"
        printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_GREEN}[F1]${RESET} ${LIGHT_WHITE}🇵🇸 Free Palestine Theme${RESET}         ${LIGHT_WHITE}${BOLD}║${RESET}\n"
        printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_BLUE}[00]${RESET} ${LIGHT_WHITE}🔙 Kembali ke Menu Utama${RESET}        ${LIGHT_WHITE}${BOLD}║${RESET}\n"
        printf "${LIGHT_WHITE}${BOLD}║${RESET}  ${LIGHT_RED}[99]${RESET} ${LIGHT_WHITE}🚪 Exit${RESET}                      ${LIGHT_WHITE}${BOLD}║${RESET}\n"
        printf "${LIGHT_WHITE}${BOLD}╚════════════════════════════════════════╝${RESET}\n"
        printf "\n"
        read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih tema: ${RESET}")" premium_choice

        case "$premium_choice" in
            1|F1|f1)
                if [[ -f "pales/bash.bashrc" ]]; then
                    loading_animation "Applying Free Palestine theme" 3
                    cp pales/bash.bashrc "$PREFIX/etc/bash.bashrc" 2>/dev/null || sudo cp pales/bash.bashrc "$PREFIX/etc/bash.bashrc"
                    show_notification "success" "Free Palestine theme berhasil diterapkan! 🇵🇸"
                else
                    show_notification "error" "File tema tidak ditemukan!"
                fi
                sleep 2
                premium_user
                ;;
            00|0)
                main_program
                ;;
            99)
                exit_message
                ;;
            *)
                show_notification "error" "Opsi tidak valid!"
                sleep 1
                premium_user
                ;;
        esac
    else
        show_notification "error" "Password salah! Akses ditolak 🔒"
        sleep 2
        main_program
    fi
}

#------------------------ Main Program ---------------------#
main_program() {
    while true; do
        rainbow_banner
        check_status
        modern_menu
        
        read -p "$(printf "${LIGHT_CYAN}${BOLD}❯${RESET} ${LIGHT_WHITE}Pilih menu [01-05]: ${RESET}")" main_choice
        
        case "$main_choice" in
            1|01)
                theme_menu
                ;;
            2|02)
                custom_banner
                ;;
            3|03)
                update_script
                ;;
            4|04)
                rainbow_mode
                ;;
            5|05)
                system_info
                ;;
            99)
                about_section
                ;;
            00|0)
                exit_message
                ;;
            RP|rp)
                premium_user
                ;;
            *)
                show_notification "error" "Opsi tidak valid! Pilih 01-05, 99, atau 00"
                sleep 1
                ;;
        esac
    done
}

#------------------------ Script Entry Point ---------------------#
main() {
    # Initialize system detection
    detect_system
    
    # Check if dependencies are installed
    if ! command -v ruby >/dev/null 2>&1 || ! command -v git >/dev/null 2>&1; then
        install_dependencies
    else
        main_program
    fi
}

# Handle script termination
trap 'printf "\n\n${LIGHT_RED}${BOLD}Program interrupted. Goodbye! 👋${RESET}\n"; exit 0' SIGINT SIGTERM

# Start the program
main "$@"
