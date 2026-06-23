#!/usr/bin/env bash
# THE FIXER — คืนค่าโรงงาน (factory reset)
# ล้าง "ที่เกิดเหตุ" ทุกคดีที่ setup.sh สร้างไว้ ให้ repo กลับสู่สภาพเพิ่ง clone มา
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
rm -rf "$ROOT"/case-*/scene "$ROOT"/case-*/scene-remote.git "$ROOT"/case-*/.hint
echo "🧹 คืนค่าโรงงานเรียบร้อย — ล้างที่เกิดเหตุทุกคดีแล้ว repo กลับสู่สภาพเริ่มต้น"
echo "   เริ่มเล่นใหม่: อ่าน README แล้วรัน  bash case-1/setup.sh"
