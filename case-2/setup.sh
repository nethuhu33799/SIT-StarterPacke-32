#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
SCENE="$HERE/scene"; REMOTE="$HERE/scene-remote.git"
rm -rf "$SCENE" "$REMOTE"
git init -q --bare "$REMOTE"
mkdir -p "$SCENE"; cd "$SCENE"; git init -q
git config user.email "rookie@famiglia.local"; git config user.name "Rookie"
echo "# ตารางเวรหน้าร้าน" > README.md
git add . && git commit -qm "ตั้งตารางเวรหน้าร้าน"
echo "จันทร์ เอ / อังคาร บี / พุธ ซี" > shifts.txt
git add . && git commit -qm "ลงเวรประจำสัปดาห์"
git branch -M main
git remote add origin "$REMOTE"
git push -q -u origin main
# ความผิดพลาด: commit ข้อความที่ไม่ควรมี แล้ว 'push' ออกไปแล้ว
echo "คืนนี้จัดการเรื่องนาย ก. ให้จบ" > note.txt
git add . && git commit -qm "ฝากโน้ตไว้ (พลาด: ข้อความที่ไม่ควรหลุด)"
git push -q origin main
echo
echo "📁 ที่เกิดเหตุพร้อมแล้ว → cd \"$SCENE\""
echo "   โน้ตอันตรายถูก commit แล้ว 'push ขึ้น remote' ที่ทีมอื่นใช้ร่วม — หลุดออกไปแล้ว!"
