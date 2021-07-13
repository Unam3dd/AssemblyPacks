BITS 16

; https://fr.wikipedia.org/wiki/INT_10H

; nasm -f bin -o hello_world_boot.img hello_world_boot.s
; cat bootloader.img > /dev/fd0
; dd if=bootloader.img of=/dev/fd0

org 0x7C00 ; jump at this address (MBR address)

jmp short _start ; jump to entrypoint

msg: db "hello", 0h ; string

; entry_point
_start:
    ; Change background color
    mov ah, 0Bh ; background color subfunction
    mov bh, 00h ; background color subfunction
    mov bl, 0004h ; color https://en.wikipedia.org/wiki/BIOS_color_attributes
    int 10h ; call bios interrupt

    mov al, 1h ; write mode (AL (bit 0 : update cursor after writing) / (bit 1 : string conatins attributes))
    mov bh, 0h ; page number 
    mov bl, 0Ah ; attribute if string contains only characters (bit 1 of AL is zero).
    mov cx, 5 ; number of characters in string (attributes are not counted).
    mov dl, 0 ; column
    mov dh, 9 ; row at which to start writing
    mov bp, msg ; point to string to be printed
    mov ah, 13h ; write string function
    int 10h ; call bios interrupt

; set MBR to 512 byte
times 0200h - 2 - ($ - $$) db 0 
dw 0AA55h ; SIGN
