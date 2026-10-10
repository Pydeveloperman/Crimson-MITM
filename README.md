## 🖥️ Tizimning Ishlash Jarayoni (Interface Preview)

Dastur terminalda chiroyli Crimson Neon ranglar palitrasi va interaktiv menyu orqali ishlaydi. Quyida tizim interfeysining matnli ko‘rinishi keltirilgan:

### 1. Asosiy Menyu (Main Menu)
Dastur ishga tushganda root huquqlarini tekshiradi, keshni tozalaydi va quyidagi menyuni chiqaradi:

```text
███╗   ███╗██╗████████╗███╗   ███╗   ██████╗ ██████╗ 
████╗ ████║██║╚══██╔══╝████╗ ████║  ██╔═══██╗██╔══██╗
██╔████╔██║██║   ██║   ██╔████╔██║  ██║   ██║██████╔╝
██║╚██╔╝██║██║   ██║   ██║╚██╔╝██║  ██║   ██║██╔═══╝ 
██║ ╚═╝ ██║██║   ██║   ██║ ╚═╝ ██║  ╚██████╔╝██║     
╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝   ╚═════╝ ╚═╝     
         [ BASH AUTOMATION & ENGINE WRAPPER ]

┌───[ CYBER CORE MAIN MENU ]─────────────────────────┐
│  [1] YANGI REYDNI BOSHLASH (START ATTACK)          │
│  [2] SESHINDAN TO'LIQ CHIQISH (EXIT ENGINE)        │
└────────────────────────────────────────────────────┘

│ Tanlovingizni kiriting: » 1
```

### 2. Tarmoq Diagnostikasi va Nishonni Sozlash (Target Routing)
Hujum boshlanganda lokal tarmoqdagi faol qurilmalarni ko‘rsatadi va ma’lumotlarni kiritishni so‘raydi:

```text
┌───[ LOKAL TARMOQ DIAGNOSTIKASI ]──────────────────┐
  192.168.1.5 ──> MAC: [ 52:54:00:12:34:56 ]
  192.168.1.1 ──> MAC: [ 00:11:22:33:44:55 ]
└────────────────────────────────────────────────────┘

┌───[ TARGET ROUTING CONFIGURATION ]─────────────────┐
│ Qurbon IP manzilini kiriting:
│ » 192.168.1.5
│ Router (Gateway) IP manzilini kiriting:
│ » 192.168.1.1
└────────────────────────────────────────────────────┘

[*] Target bilan barqaror ko'prik o'rnatish uchun ping yuborilmoqda...
[+] Tizim mudofaasi aylanib o'tildi. Tool yuklanmoqda...
```

### 3. Real Vaqtda Trafikni Tutish (Live Sniffing & Data Intercept)
Dastur fonda zaharli paketlarni yuborish bilan birga, HTTP trafigidan login/parollarni va DNS so‘rovlarini ushlaydi:

```text
[+] TARGET LOCK: 192.168.1.5 (52:54:00:12:34:56)
[*] INJECTION REACTION: LIVE SNIFFING RUNNING...
[*] To'xtatish uchun Ctrl+C bosing.

[14:23:05] ⚡ ACCESS GRANTED ───> GOOGLE.COM
  ├── ://google.com
  ├── ://google.com

[███████████████ DATA INTERCEPTED (CRIMSON REACTION) ███████████████]
┌────────────────────────────────────────────────────────────────────────┐
│ username=admin&password=Secret123&login_submit=Sign+In
└────────────────────────────────────────────────────────────────────────┘

[42 raw packets injected] 💀 Sniffer: ACTIVE
```
