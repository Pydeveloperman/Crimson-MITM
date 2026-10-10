# 💀 Crimson MITM Engine (Bash & Python Automation)

Lokal tarmoqda **ARP Spoofing** va **MITM (Man-in-the-Middle)** hujumlarini avtomatlashtirish, DNS so'rovlarini tahlil qilish hamda tarmoq trafigidan ochiq matndagi (HTTP POST) maxfiy ma'lumotlarni tutib olish (sniffing) uchun mo'ljallangan interaktiv kiberxavfsizlik vositasi.

Dastur chiroyli **Crimson Neon** interfeysiga ega bo'lib, Bash skript orqali Python (Scapy) dvigatelini boshqaradi.

---

## 🚀 Imkoniyatlari

*   **Avtomatlashtirilgan ARP Spoofing:** Qurbon va router (gateway) o'rtasidagi kesh xotirani zaharli ARP paketlari bilan to'ldiradi.
*   **Lokal Tarmoq Diagnostikasi:** Tarmoqdagi faol qurilmalarni va ularning MAC manzillarini avtomatik ro'yxatga oladi.
*   **DNS Sniffing:** Qurbon tashrif buyurayotgan domen va subdomenlarni real vaqt rejimida guruhlab ko'rsatadi.
*   **Ma'lumotlarni Tutib Olish (Data Interception):** Tarmoq ichidagi HTTP POST so'rovlaridan login, parol va tokenlarni qidiradi va ajratib beradi.
*   **Xavfsiz Tiklash (Safe Cleanup):** Dastur `Ctrl+C` bilan to'xtatilganda tarmoq keshini avvalgi holatiga qaytaradi va tizimni buzib qo'ymaydi.

---

## 🛠️ Tizim Talablari va O'rnatish

Skript to'g'ri ishlashi uchun sizga **Linux** (Kali Linux, Parrot OS yoki Ubuntu) operatsion tizimi hamda `root` (sudo) huquqi kerak bo'ladi.

### 1. Zaruriy paketlarni o'rnatish:
Dastur Python'ning `scapy` kutubxonasidan foydalanadi. Uni quyidagi buyruq orqali o'rnating:
```bash
sudo apt update
sudo apt install python3 python3-pip net-tools arp-scan -y
pip3 install scapy
```

### 2. Loyihani yuklab olish:
```bash
git clone https://github.com
cd LOYIHA-NOMI
```
*(Eslatma: `USERNAME` va `LOYIHA-NOMI` o'rniga o'zingizning GitHub ma'lumotlaringizni yozing)*

### 3. Ishga tushirish huquqini berish:
```bash
chmod +x runner.sh
```
*(Eslatma: Bash skriptingiz nomi nima bo'lsa, `runner.sh` o'rniga o'shani yozing, masalan `main.sh`)*

---

## 💻 Foydalanish

Dasturni har doim `sudo` orqali ishga tushiring:
```bash
sudo ./runner.sh
```

### Bosqichlar:
1.  **Asosiy Menyu:** Menyudan `[1] START ATTACK` tanlanadi.
2.  **IP kiritish:** Tizim avomatik arp-keshni ko'rsatadi. Sizdan **Qurbon IP manzili** va **Router (Gateway) IP manzili**ni kiritish so'raladi.
3.  **Kuzatuv:** Dastur ARP Injection'ni boshlaydi va sizga real vaqtda tarmoq trafigini tahlil qilib beradi.
4.  **To'xtatish:** Jarayonni tugatish uchun shunchaki `Ctrl+C` tugmalarini bosing. Tarmoq avomatik tarzda asl holiga qaytadi.

---

## ⚠️ OGOHLANTIRISH (DISCLAIMER)

Ushbu loyiha **faqat ta'lim va kiberxavfsizlikni o'rganish (Educational Purposes Only)** maqsadida yaratilgan. Muallif ushbu dasturdan noqonuniy maqsadlarda yoki begona tarmoqlarda ruxsatsiz foydalanish natijasida kelib chiqadigan hech qanday zarar yoki javobgarlikni o'z zimmasiga olmaydi. Dasturni faqat o'zingizga tegishli bo'lgan yoki ruxsat berilgan laboratoriya tarmoqlarida sinab ko'ring!

---

## 🧑‍💻 Muallif

*   **Sizning Ismingiz** - [@SizningTelegramingiz](https://t.me/adhamjon0717)
*   GitHub: [@SizningGitHubingiz](https://github.com/Pydeveloperman)
