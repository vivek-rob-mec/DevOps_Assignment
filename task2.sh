LOGFILE="$HOME/system_health.log"

TIME=$(date)

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

MEM_FREE=$(free | grep Mem | awk '{print $4}')
MEM_TOTAL=$(free | grep Mem | awk '{print $2}')
MEM_PERCENT=$(( 100 * MEM_FREE / MEM_TOTAL))

echo "$TIME - CPU: $CPU% used | Mem: $MEM_PERCENT% free" >> "$LOGFILE"

if (( $(echo "$CPU > 80" | bc -l) )); then
	echo "$TIME - Alert: CPU usage is High!: $CPU%" >> "$LOGFILE"

fi

if [ $MEM_PERCENT -lt 20 ]; then
	echo "$TIME - Alert: Memory is low: $MEM_PERCENT% free" >> "$LOGFILE"
fi
