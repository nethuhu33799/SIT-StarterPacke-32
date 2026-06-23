#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
SCENE="$HERE/scene"; REMOTE="$HERE/scene-remote.git"
rm -rf "$SCENE" "$REMOTE"
git init -q --bare "$REMOTE"
mkdir -p "$SCENE"; cd "$SCENE"; git init -q
git config user.email "rookie@famiglia.local"; git config user.name "Rookie"
echo "# เมนูร้านหน้าฉาก" > README.md
git add . && git commit -qm "เปิดเมนูร้าน"
git branch -M main; git remote add origin "$REMOTE"; git push -q -u origin main
# commit ปนเปื้อน (อยู่กลาง ๆ)
echo "รายชื่อคนที่ต้องเก็บเงิน: ก, ข, ค" > blacklist.txt
git add . && git commit -qm "เพิ่มไฟล์ blacklist (พลาด: ไม่ควรมี)"
git push -q origin main
# งานดีของเพื่อนตามมาทีหลัง (ต้องเก็บไว้)
echo "ก๋วยเตี๋ยว 50 / ข้าวผัด 45" > menu.txt
git add . && git commit -qm "เพิ่มเมนูอาหาร"
git push -q origin main
echo "เปิดทุกวัน 9:00-21:00" >> README.md
git add . && git commit -qm "อัปเดตเวลาเปิดร้าน"
git push -q origin main
echo
echo "📁 ที่เกิดเหตุพร้อมแล้ว → cd \"$SCENE\""
echo "   ไฟล์ blacklist หลุดไปแล้ว และมีงานดีของเพื่อน (menu, เวลาเปิดร้าน) ตามมาทีหลัง"
echo "   เก็บเฉพาะของเสีย อย่าให้งานดีหาย"
