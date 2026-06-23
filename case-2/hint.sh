#!/usr/bin/env bash
HERE="$(cd "$(dirname "$0")" && pwd)"; P="$HERE/.hint"; n=$(cat "$P" 2>/dev/null||echo 0); n=$((n+1)); echo $n>"$P"
case $n in
 1) echo "🕴️ Capo: เช็คก่อน — งานนี้ push ออกไปแล้วหรือยัง? (ลอง git log เทียบกับ origin)";;
 2) echo "🕴️ Capo: ของหลุดออกไปแล้ว ลบประวัติทิ้งไม่ได้ คนอื่นมีของชุดนี้แล้ว";;
 3) echo "🕴️ Capo: ต้องสร้าง commit ใหม่ที่ 'กลบ' ผลของอันเก่า แล้วส่งขึ้นไปให้ทีมด้วย";;
 *) echo "🕴️ Capo: ใบ้หมดแล้ว กลบให้เนียน แล้ว push นะ";;
esac
