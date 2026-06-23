#!/usr/bin/env bash
HERE="$(cd "$(dirname "$0")" && pwd)"; SCENE="$HERE/scene"; fail=0
say(){ echo "   $*"; }
[ -d "$SCENE/.git" ] || { echo "❌ ยังไม่เจอที่เกิดเหตุ — รัน: bash case-1/setup.sh ก่อน"; exit 1; }
cd "$SCENE"
if [ -f secret-accounts.txt ]; then say "❌ ไฟล์ secret-accounts.txt ยังอยู่ในที่เกิดเหตุ"; fail=1; fi
if git log --all --oneline -- secret-accounts.txt 2>/dev/null | grep -q .; then
  say "❌ ยังเจอร่องรอยไฟล์ลับใน history"
  say "   คิดดู: งานนี้ 'ยังไม่หลุดออกนอกบ้าน' (ยังไม่ push) → เก็บให้เกลี้ยงไปเลยได้"
  say "   เครื่องมือที่ 'ย้อน HEAD กลับ' เหมาะกว่าการ 'กลบทับด้วย commit ใหม่'"
  fail=1
fi
if ! git log --oneline | grep -q "ค่าใช้จ่ายประจำเดือน"; then
  say "❌ เผลอย้อนแรงไปจนงานดีของเพื่อนหายด้วย — ย้อนแค่ commit ลับพอ"; fail=1
fi
if [ "$fail" = 0 ]; then
  echo "✅ คดีปิด — ที่เกิดเหตุสะอาด ไม่เหลือร่องรอยในประวัติเลย"
  echo "   ไปต่อคดีถัดไป:  bash case-2/setup.sh"
fi
exit $fail
