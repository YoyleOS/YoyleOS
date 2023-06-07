build_boot:
    nasm src/boot/boot.s -f bin -o build/boot/boot.bin
	cp build/boot/boot.bin build/boot/boot.img
run_boot: build_boot
    qemu-system-i386 build/boot/boot.img