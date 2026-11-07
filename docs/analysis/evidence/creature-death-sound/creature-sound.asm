145b45d30 55 push rbp
145b45d31 4881ec90000000 sub rsp, 0x90
145b45d38 488dac2480000000 lea rbp, [rsp + 0x80]
145b45d40 48c74508feffffff mov qword ptr [rbp + 8], 0xfffffffffffffffe
145b45d48 488d153b97a901 lea rdx, [rip + 0x1a9973b]
145b45d4f 488d4da8 lea rcx, [rbp - 0x58]
145b45d53 41b823000000 mov r8d, 0x23
145b45d59 e80221f6ff call 0x145aa7e60
145b45d5e 837da801 cmp dword ptr [rbp - 0x58], 1
145b45d62 7553 jne 0x145b45db7
145b45d64 488d45b0 lea rax, [rbp - 0x50]
145b45d68 488b4810 mov rcx, qword ptr [rax + 0x10]
145b45d6c 48894d00 mov qword ptr [rbp], rcx
145b45d70 0f1000 movups xmm0, xmmword ptr [rax]
145b45d73 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
145b45d77 488d45f0 lea rax, [rbp - 0x10]
145b45d7b 488945c8 mov qword ptr [rbp - 0x38], rax
145b45d7f 488d055ac34bfa lea rax, [rip - 0x5b43ca6]
145b45d86 488945d0 mov qword ptr [rbp - 0x30], rax
145b45d8a 488d0d4997a901 lea rcx, [rip + 0x1a99749]
145b45d91 488d55c8 lea rdx, [rbp - 0x38]
145b45d95 e856a64000 call 0x145f503f0
145b45d9a 90 nop
145b45d9b 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145b45d9f 4885d2 test rdx, rdx
145b45da2 0f849c000000 je 0x145b45e44
145b45da8 488b4df8 mov rcx, qword ptr [rbp - 8]
145b45dac 41b801000000 mov r8d, 1
145b45db2 e987000000 jmp 0x145b45e3e
145b45db7 488b45b0 mov rax, qword ptr [rbp - 0x50]
145b45dbb 488945e8 mov qword ptr [rbp - 0x18], rax
145b45dbf 488b55b8 mov rdx, qword ptr [rbp - 0x48]
145b45dc3 4c8b45c0 mov r8, qword ptr [rbp - 0x40]
145b45dc7 488d4dc8 lea rcx, [rbp - 0x38]
145b45dcb 488955e0 mov qword ptr [rbp - 0x20], rdx
145b45dcf e81cfeffff call 0x145b45bf0
145b45dd4 90 nop
145b45dd5 48837dc8ff cmp qword ptr [rbp - 0x38], -1
145b45dda 7428 je 0x145b45e04
145b45ddc 488b45d8 mov rax, qword ptr [rbp - 0x28]
145b45de0 48894500 mov qword ptr [rbp], rax
145b45de4 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
145b45de8 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
145b45dec 488d0d9796a901 lea rcx, [rip + 0x1a99697]
145b45df3 4c8d45f0 lea r8, [rbp - 0x10]
145b45df7 ba23000000 mov edx, 0x23
145b45dfc e86f9f3200 call 0x145e6fd70
145b45e01 90 nop
145b45e02 eb27 jmp 0x145b45e2b
145b45e04 488d05a596a901 lea rax, [rip + 0x1a996a5]
145b45e0b 488945f0 mov qword ptr [rbp - 0x10], rax
145b45e0f 488d05aac24bfa lea rax, [rip - 0x5b43d56]
145b45e16 488945f8 mov qword ptr [rbp - 8], rax
145b45e1a 488d0d9f96a901 lea rcx, [rip + 0x1a9969f]
145b45e21 488d55f0 lea rdx, [rbp - 0x10]
145b45e25 e8c6a54000 call 0x145f503f0
145b45e2a 90 nop
145b45e2b 488b55e8 mov rdx, qword ptr [rbp - 0x18]
145b45e2f 4885d2 test rdx, rdx
145b45e32 7410 je 0x145b45e44
145b45e34 41b801000000 mov r8d, 1
145b45e3a 488b4de0 mov rcx, qword ptr [rbp - 0x20]
145b45e3e e88dc34bfa call 0x1400021d0
145b45e43 90 nop
145b45e44 4881c490000000 add rsp, 0x90
145b45e4b 5d pop rbp
145b45e4c c3 ret
