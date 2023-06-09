***This is a WIP project!***
# YoyleOS
The  Unofficial Official Yoyle Operating System Project!

# Build the boot image.
To build the boot sector, you'll need to first make
sure you have the following installed:
```
nasm
qemu (qemu-system-i386 in particular)
```

Now run the following command in your bash terminal:

``make run_boot``

qemu will now have booted the OS from the hard disk
successfully!

# Notes
- Text may take time to load. It may be because of the grey
  pixels loading up, but I just don't know lol.
- The operating system uses real mode. I know protected mode
  is alot better according to others but I like my BIOS
  interrupts and I think using assembly will overall be easier
  than using C.

# Terminal Commands
These are the terminal commands that are avaliable as of the test build:
```
t - Prints a test message: 'Hi!'
```
