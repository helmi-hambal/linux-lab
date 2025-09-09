#!/usr/bin/env bash
set -euo pipefail

LOGDIR="${HOME}/linux-lab/logs"
LOGFILE="$LOGDIR/network_check.log"
mkdir -p "$LOGDIR"

{
  echo "===== $(date '+%F %T %Z') ====="
  echo "Host: $(hostname -f || hostname)"
  echo
  echo "--- IP addresses ---"
  ip -brief a || ip a
  echo
  echo "--- Routes ---"
  ip route show
  echo
  echo "--- DNS (/etc/resolv.conf) ---"
  cat /etc/resolv.conf || true
  echo
  echo "--- Listening sockets (ss -tuln) ---"
  ss -tuln || true
  echo
  echo "--- Ping tests (3 packets) ---"
  echo "-> 8.8.8.8 (no DNS)"
  if ping -c 3 -W 2 8.8.8.8 >/dev/null 2>&1; then
    echo "PING 8.8.8.8: OK"
  else
    echo "PING 8.8.8.8: FAIL"
  fi
  echo "-> google.com (DNS + network)"
  if ping -c 3 -W 2 google.com >/dev/null 2>&1; then
    echo "PING google.com: OK"
  else
    echo "PING google.com: FAIL"
  fi
  echo
  if command -v traceroute >/dev/null 2>&1; then
    echo "--- Traceroute to google.com (first 10 hops) ---"
    traceroute -m 10 google.com || true
    echo
  else
    echo "traceroute not installed; skipping traceroute"
    echo
  fi
  if command -v curl >/dev/null 2>&1; then
    echo "--- HTTP HEAD example.com ---"
    curl -Is --max-time 10 https://example.com | head -n 1 || echo "curl failed"
    echo
  else
    echo "curl not installed; skipping http check"
    echo
  fi
  echo
} >> "$LOGFILE" 2>&1

echo "Wrote network snapshot to $LOGFILE"
