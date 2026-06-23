#!/usr/bin/env bash
HERE="$(cd "$(dirname "$0")" && pwd)"; SCENE="$HERE/scene"; REMOTE="$HERE/scene-remote.git"; fail=0
say(){ echo "   $*"; }
[ -d "$SCENE/.git" ] || { echo "❌ ยังไม่เจอที่เกิดเหตุ — รัน: bash case-2/setup.sh ก่อน"; exit 1; }
cd "$SCENE"
# 1) เนื้อหาอันตรายต้องหายจากของในมือ
[ -f note.txt ] && { say "❌ note.txt ยังอยู่ในที่เกิดเหตุ — ยังไม่ได้กลบงาน"; fail=1; }
# 2) ห้ามลบประวัติ: commit เดิมต้องยังอยู่ (พิสูจน์ว่าไม่ได้ใช้ reset)
if ! git log --oneline | grep -q "ฝากโน้ตไว้"; then
  say "❌ คุณลบประวัติทิ้ง! แต่งานนี้ 'หลุดออกไปแล้ว' (push แล้ว)"
  say "   เพื่อนที่ดึงไปอาจมี commit นี้ในเครื่องแล้ว — การเขียนประวัติใหม่จะทำของทีมพัง"
  say "   เคสที่หลุดแล้วต้อง 'กลบด้วย commit ใหม่' ไม่ใช่ลบของเก่า"
  fail=1
fi
# 3) remote ต้องอัปเดต: tip ของ origin/main ต้องไม่มี note.txt แล้ว
if git --git-dir="$REMOTE" ls-tree -r --name-only refs/heads/main 2>/dev/null | grep -qx "note.txt"; then
  say "❌ remote ยังมี note.txt อยู่ — แก้ในเครื่องแล้วอย่าลืม push ขึ้นไปด้วย"; fail=1
fi
# 4) remote ต้องยังมี commit เดิมในประวัติ (ห้าม force-push ลบทิ้ง)
if ! git --git-dir="$REMOTE" log --oneline refs/heads/main 2>/dev/null | grep -q "ฝากโน้ตไว้"; then
  say "❌ คุณ force-push ลบประวัติบน remote — ห้ามทำกับงานที่หลุดออกไปแล้ว"; fail=1
fi
if [ "$fail" = 0 ]; then
  echo "✅ คดีปิด — กลบงานเรียบร้อยโดยไม่แตะประวัติของทีม และ push ขึ้นไปแล้ว"
  echo "   ไปต่อคดีสุดท้าย:  bash case-3/setup.sh"
fi
exit $fail
