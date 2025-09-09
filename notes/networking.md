# Networking Basics — hands-on

## Objective
Learn CLI networking commands and basic troubleshooting on an Ubuntu VM.

## Commands & quick notes
- `ip -brief a` — show interfaces and IP addresses.
- `ip route show` — show routes; check default gateway.
- `cat /etc/resolv.conf` — DNS servers.
- `ss -tuln` — show listening sockets (replace `netstat -tuln`).
- `ping -c 4 <host>` — test connectivity.
- `traceroute <host>` — view network hops.
- `curl -Is <url>` — quick HTTP HEAD check.
- `nslookup` / `dig` — DNS lookups.

## Hands-on tasks
1. Run `ip -brief a` and note the primary interface and IP.
2. Run `ip route show` — check presence of a `default via <gateway>`.
3. Test `ping -c 4 8.8.8.8` and `ping -c 4 google.com`.
4. Run `ss -tuln` to see listening services (e.g. `:22`).
5. Run `traceroute -m 12 google.com`.
6. Create and run `scripts/network_check.sh` to capture snapshots.

## Script: scripts/network_check.sh
Purpose: snapshot the network state and append to `logs/network_check.log`.

(See `scripts/network_check.sh` in the repo.)

## Troubleshooting checklist
- DNS issues: `cat /etc/resolv.conf`, try `nslookup google.com`.
- No outbound connectivity: check Azure NSG outbound rules and subnet NSG; check VM's network security group and route table.
- Local firewall: `sudo ufw status verbose`.
- Restart networking: `sudo netplan apply` (if using netplan) or `sudo systemctl restart systemd-networkd` (depending on stack).

## Next steps
- Convert the script into a systemd timer for periodic snapshots.
- Add log rotation for `logs/network_check.log`.
- Build deeper labs: iptables/ufw rules, tcpdump captures, performance testing (iperf).
