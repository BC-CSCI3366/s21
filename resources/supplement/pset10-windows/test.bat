@echo off
del .\test\*.asm

:: --login is required to include opam setup in ~\.profile
bash --login -c "dune exec bin/main.exe try codegen > /dev/null"

for /f %%f in ('dir /b .\test\*.mc') do (
	echo ---------- %%~nf ----------
	java -jar .\test\Mars4_5.jar .\test\%%~nf.asm > .\test\%%~nf.test
	:: Piping the contents to find to remove display in passing case
	fc .\test\%%~nf.test .\test\ans\%%~nf.ans | find /I /V "Comparing" | find /I /V "no differences encountered"
	)

del .\test\*.dbg* .\test\*.test*
