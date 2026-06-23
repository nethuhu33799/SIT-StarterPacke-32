#!/usr/bin/env bash
HERE="$(cd "$(dirname "$0")" && pwd)"; SCENE="$HERE/scene"; REMOTE="$HERE/scene-remote.git"; fail=0
say(){ echo "   $*"; }
[ -d "$SCENE/.git" ] || { echo "❌ ยังไม่เจอที่เกิดเหตุ — รัน: bash case-3/setup.sh ก่อน"; exit 1; }
cd "$SCENE"
# 1) ของเสียต้องหาย
[ -f blacklist.txt ] && { say "❌ blacklist.txt ยังอยู่ — ยังไม่ได้กลบ"; fail=1; }
# 2) งานดีของเพื่อนต้องไม่หาย
[ -f menu.txt ] || { say "❌ menu.txt หายไปด้วย — เธอย้อนแรงไปจนงานดีของเพื่อนหาย ต้องเก็บแค่ของเสีย"; fail=1; }
grep -q "เวลาเปิดร้าน\|9:00" README.md 2>/dev/null || { say "❌ งานอัปเดตเวลาเปิดร้านหายไปด้วย — กลบเฉพาะ commit ที่ผิดพอ"; fail=1; }
# 3) ห้ามลบประวัติ
if ! git log --oneline | grep -q "blacklist"; then
  say "❌ คุณลบประวัติทิ้ง! ของหลุดไปแล้ว ห้ามเขียนประวัติใหม่ — ใช้วิธีกลบเฉพาะ commit ที่ผิด"; fail=1
fi
# 4) remote: tip ต้องไม่มี blacklist แต่ต้องมี menu และยังมีประวัติเดิม
TIP=$(git --git-dir="$REMOTE" ls-tree -r --name-only refs/heads/main 2>/dev/null)
echo "$TIP" | grep -qx "blacklist.txt" && { say "❌ remote ยังมี blacklist.txt — อย่าลืม push"; fail=1; }
echo "$TIP" | grep -qx "menu.txt" || { say "❌ remote ไม่มี menu.txt — งานดีหายบน remote"; fail=1; }
git --git-dir="$REMOTE" log --oneline refs/heads/main 2>/dev/null | grep -q "blacklist" || { say "❌ ประวัติบน remote ถูกล้าง — ห้าม force-push"; fail=1; }
if [ "$fail" = 0 ]; then
  echo "✅ คดีปิด — กลบเฉพาะของเสีย งานดีของทีมอยู่ครบ ประวัติไม่พัง"
  echo "   จบครบทุกคดีแล้ว — เธอคือ The Fixer คนต่อไป 🤝"
fi
exit $fail
