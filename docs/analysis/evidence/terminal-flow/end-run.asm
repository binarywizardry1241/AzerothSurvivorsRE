14594b330 55 push rbp
14594b331 4156 push r14
14594b333 56 push rsi
14594b334 57 push rdi
14594b335 53 push rbx
14594b336 4883ec50 sub rsp, 0x50
14594b33a 488d6c2450 lea rbp, [rsp + 0x50]
14594b33f 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14594b347 0fb699c70a0000 movzx ebx, byte ptr [rcx + 0xac7]
14594b34e fecb dec bl
14594b350 80fb02 cmp bl, 2
14594b353 0f87de000000 ja 0x14594b437
14594b359 4889ce mov rsi, rcx
14594b35c 488bb950060000 mov rdi, qword ptr [rcx + 0x650]
14594b363 4c8bb158060000 mov r14, qword ptr [rcx + 0x658]
14594b36a 48c7815806000000000000 mov qword ptr [rcx + 0x658], 0
14594b375 4d85f6 test r14, r14
14594b378 741a je 0x14594b394
14594b37a 660f1f440000 nop word ptr [rax + rax]
14594b380 4889f9 mov rcx, rdi
14594b383 e878b5fcff call 0x145916900
14594b388 4881c7a0000000 add rdi, 0xa0
14594b38f 49ffce dec r14
14594b392 75ec jne 0x14594b380
14594b394 c686c50a0000ff mov byte ptr [rsi + 0xac5], 0xff
14594b39b c686b70a000001 mov byte ptr [rsi + 0xab7], 1
14594b3a2 c686c70a000004 mov byte ptr [rsi + 0xac7], 4
14594b3a9 f30f1086340a0000 movss xmm0, dword ptr [rsi + 0xa34]
14594b3b1 c7867809000001000000 mov dword ptr [rsi + 0x978], 1
14594b3bb f30f11867c090000 movss dword ptr [rsi + 0x97c], xmm0
14594b3c3 4889f1 mov rcx, rsi
14594b3c6 e84593fdff call 0x145924710
14594b3cb 4c8d05ffe88d01 lea r8, [rip + 0x18de8ff]
14594b3d2 488d4dd0 lea rcx, [rbp - 0x30]
14594b3d6 41b906000000 mov r9d, 6
14594b3dc 4889f2 mov rdx, rsi
14594b3df e84c0b0000 call 0x14594bf30
14594b3e4 488bbe40060000 mov rdi, qword ptr [rsi + 0x640]
14594b3eb 483bbe30060000 cmp rdi, qword ptr [rsi + 0x630]
14594b3f2 751d jne 0x14594b411
14594b3f4 488d8e30060000 lea rcx, [rsi + 0x630]
14594b3fb 488b45d0 mov rax, qword ptr [rbp - 0x30]
14594b3ff 488945f0 mov qword ptr [rbp - 0x10], rax
14594b403 488b45d8 mov rax, qword ptr [rbp - 0x28]
14594b407 488945e8 mov qword ptr [rbp - 0x18], rax
14594b40b e8d0f72a00 call 0x145bfabe0
14594b410 90 nop
14594b411 488b8638060000 mov rax, qword ptr [rsi + 0x638]
14594b418 488d0c7f lea rcx, [rdi + rdi*2]
14594b41c 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594b420 488954c810 mov qword ptr [rax + rcx*8 + 0x10], rdx
14594b425 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
14594b429 0f1104c8 movups xmmword ptr [rax + rcx*8], xmm0
14594b42d 48ffc7 inc rdi
14594b430 4889be40060000 mov qword ptr [rsi + 0x640], rdi
14594b437 80fb03 cmp bl, 3
14594b43a 0f92c0 setb al
14594b43d 4883c450 add rsp, 0x50
14594b441 5b pop rbx
14594b442 5f pop rdi
14594b443 5e pop rsi
14594b444 415e pop r14
14594b446 5d pop rbp
14594b447 c3 ret
