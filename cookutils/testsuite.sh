#!/bin/sh
# testsuite
# init_compile
TARGET=x86_64-linux-gnu
logdir=$PWD

echo "[COMPILING] $TARGET-gcc -v -Wall -o test.out test.c" \
	| tee $logdir/testsuite.log
echo 'int main() { return 0; }' > test.c
$TARGET-gcc -v -Wall -o test.out test.c 2>&1 | tee -a $logdir/testsuite.log
if [ -x /usr/bin/file ]; then
	echo -e "\n[CHECKING] file test.out" | tee -a $logdir/testsuite.log
	file test.out | tee -a $logdir/testsuite.log
fi
echo -e "\n[CHECKING] readelf -h test.out" | tee -a $logdir/testsuite.log
readelf -h test.out | tee -a $logdir/testsuite.log
