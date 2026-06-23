#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
SCENE="$HERE/scene"
rm -rf "$SCENE"; mkdir -p "$SCENE"; cd "$SCENE"
git init -q
git config user.email "rookie@famiglia.local"
git config user.name  "Rookie"
echo "# บัญชีร้านซักรีด (หน้าฉาก)" > README.md
git add . && git commit -qm "เปิดร้าน: ตั้งบัญชีร้านซักรีด"
git branch -M main
echo "ค่าน้ำค่าไฟเดือนนี้ จ่ายแล้ว" > expenses.txt
git add . && git commit -qm "ลงบัญชีค่าใช้จ่ายประจำเดือน"
cat > secret-accounts.txt <<'EOF'
[ลับสุดยอด] บัญชีจริงขององค์กร — ห้ามให้ใครเห็น
ธนาคาร X : 999-8-77777-6
รหัสตู้เซฟ : 4827
EOF
git add . && git commit -qm "อัปเดตไฟล์ร้าน (เผลอแปะเลขบัญชีลับเข้าไป)"
echo
echo "📁 ที่เกิดเหตุพร้อมแล้ว → cd \"$SCENE\""
echo "   ลูกน้องเพิ่ง commit ไฟล์ลับเข้าไป แต่ยัง 'ไม่ได้ push' ออกนอกบ้าน"
