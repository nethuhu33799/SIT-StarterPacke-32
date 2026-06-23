#!/usr/bin/env bash
HERE="$(cd "$(dirname "$0")" && pwd)"; P="$HERE/.hint"; n=$(cat "$P" 2>/dev/null||echo 0); n=$((n+1)); echo $n>"$P"
case $n in
 1) echo "🕴️ Capo: commit ที่ผิดไม่ได้อยู่บนสุด มีงานดีของเพื่อนทับอยู่ — git log ดูให้ออกก่อน";;
 2) echo "🕴️ Capo: ถ้าย้อนทั้งก้อนกลับไป งานดีหายหมด ต้องเล็งเฉพาะ commit ที่ผิด";;
 3) echo "🕴️ Capo: หา commit hash ของอันที่ผิด แล้วกลบเฉพาะอันนั้น เสร็จแล้ว push";;
 *) echo "🕴️ Capo: เล็งให้แม่น กลบทีละนัด";;
esac
