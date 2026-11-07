1459a9360 55 push rbp
1459a9361 4157 push r15
1459a9363 4156 push r14
1459a9365 4154 push r12
1459a9367 56 push rsi
1459a9368 57 push rdi
1459a9369 53 push rbx
1459a936a 4881ec80000000 sub rsp, 0x80
1459a9371 488dac2480000000 lea rbp, [rsp + 0x80]
1459a9379 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1459a9381 4c89cf mov rdi, r9
1459a9384 4c89c3 mov rbx, r8
1459a9387 4989d6 mov r14, rdx
1459a938a 4889ce mov rsi, rcx
1459a938d e86e8e65fa call 0x140002200
1459a9392 b920000000 mov ecx, 0x20
1459a9397 ba01000000 mov edx, 1
1459a939c e81f8e65fa call 0x1400021c0
1459a93a1 4885c0 test rax, rax
1459a93a4 0f84f3020000 je 0x1459a969d
1459a93aa c6005a mov byte ptr [rax], 0x5a
1459a93ad c7400100000000 mov dword ptr [rax + 1], 0
1459a93b4 48c745b020000000 mov qword ptr [rbp - 0x50], 0x20
1459a93bc 488945b8 mov qword ptr [rbp - 0x48], rax
1459a93c0 48c745c005000000 mov qword ptr [rbp - 0x40], 5
1459a93c8 66c745c89600 mov word ptr [rbp - 0x38], 0x96
1459a93ce b805000000 mov eax, 5
1459a93d3 b101 mov cl, 1
1459a93d5 84c9 test cl, cl
1459a93d7 0f84eb010000 je 0x1459a95c8
1459a93dd 8d4b01 lea ecx, [rbx + 1]
1459a93e0 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1459a93e4 890c02 mov dword ptr [rdx + rax], ecx
1459a93e7 4883c004 add rax, 4
1459a93eb 488945c0 mov qword ptr [rbp - 0x40], rax
1459a93ef 488b45b0 mov rax, qword ptr [rbp - 0x50]
1459a93f3 488945d0 mov qword ptr [rbp - 0x30], rax
1459a93f7 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459a93fb 488945d8 mov qword ptr [rbp - 0x28], rax
1459a93ff 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459a9403 488945e0 mov qword ptr [rbp - 0x20], rax
1459a9407 0fb745c8 movzx eax, word ptr [rbp - 0x38]
1459a940b 668945e8 mov word ptr [rbp - 0x18], ax
1459a940f 8b45ca mov eax, dword ptr [rbp - 0x36]
1459a9412 8945ea mov dword ptr [rbp - 0x16], eax
1459a9415 0fb745ce movzx eax, word ptr [rbp - 0x32]
1459a9419 668945ee mov word ptr [rbp - 0x12], ax
1459a941d 4c8b7de0 mov r15, qword ptr [rbp - 0x20]
1459a9421 4c8b65d0 mov r12, qword ptr [rbp - 0x30]
1459a9425 4c89e0 mov rax, r12
1459a9428 4c29f8 sub rax, r15
1459a942b 4839c3 cmp rbx, rax
1459a942e 0f87c1010000 ja 0x1459a95f5
1459a9434 4885db test rbx, rbx
1459a9437 7412 je 0x1459a944b
1459a9439 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1459a943d 4c01f9 add rcx, r15
1459a9440 4c89f2 mov rdx, r14
1459a9443 4989d8 mov r8, rbx
1459a9446 e8b0b13600 call 0x145d145fb
1459a944b 4901df add r15, rbx
1459a944e 4c897de0 mov qword ptr [rbp - 0x20], r15
1459a9452 4d39e7 cmp r15, r12
1459a9455 750a jne 0x1459a9461
1459a9457 488d4dd0 lea rcx, [rbp - 0x30]
1459a945b e860da5000 call 0x145eb6ec0
1459a9460 90 nop
1459a9461 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459a9465 42c6043800 mov byte ptr [rax + r15], 0
1459a946a 49ffc7 inc r15
1459a946d 4c897de0 mov qword ptr [rbp - 0x20], r15
1459a9471 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1459a9475 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1459a9479 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459a947d 488945c0 mov qword ptr [rbp - 0x40], rax
1459a9481 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459a9485 488945c8 mov qword ptr [rbp - 0x38], rax
1459a9489 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1459a948d 488b45b0 mov rax, qword ptr [rbp - 0x50]
1459a9491 4829d0 sub rax, rdx
1459a9494 4883f807 cmp rax, 7
1459a9498 0f8683010000 jbe 0x1459a9621
1459a949e 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459a94a2 48c7041000000000 mov qword ptr [rax + rdx], 0
1459a94aa 4883c208 add rdx, 8
1459a94ae 488955c0 mov qword ptr [rbp - 0x40], rdx
1459a94b2 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1459a94b6 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1459a94ba 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459a94be 488945e0 mov qword ptr [rbp - 0x20], rax
1459a94c2 488b45c8 mov rax, qword ptr [rbp - 0x38]
1459a94c6 488945e8 mov qword ptr [rbp - 0x18], rax
1459a94ca 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1459a94ce 488b45d0 mov rax, qword ptr [rbp - 0x30]
1459a94d2 4829d0 sub rax, rdx
1459a94d5 4883f803 cmp rax, 3
1459a94d9 0f866a010000 jbe 0x1459a9649
1459a94df 488b5d60 mov rbx, qword ptr [rbp + 0x60]
1459a94e3 8d4301 lea eax, [rbx + 1]
1459a94e6 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1459a94ea 890411 mov dword ptr [rcx + rdx], eax
1459a94ed 4883c204 add rdx, 4
1459a94f1 488955e0 mov qword ptr [rbp - 0x20], rdx
1459a94f5 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1459a94f9 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1459a94fd 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459a9501 488945c0 mov qword ptr [rbp - 0x40], rax
1459a9505 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459a9509 488945c8 mov qword ptr [rbp - 0x38], rax
1459a950d 4c8b75c0 mov r14, qword ptr [rbp - 0x40]
1459a9511 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
1459a9515 4c89f8 mov rax, r15
1459a9518 4c29f0 sub rax, r14
1459a951b 4839c3 cmp rbx, rax
1459a951e 0f874d010000 ja 0x1459a9671
1459a9524 4885db test rbx, rbx
1459a9527 7412 je 0x1459a953b
1459a9529 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1459a952d 4c01f1 add rcx, r14
1459a9530 4889fa mov rdx, rdi
1459a9533 4989d8 mov r8, rbx
1459a9536 e8c0b03600 call 0x145d145fb
1459a953b 4901de add r14, rbx
1459a953e 4c8975c0 mov qword ptr [rbp - 0x40], r14
1459a9542 4d39fe cmp r14, r15
1459a9545 750a jne 0x1459a9551
1459a9547 488d4db0 lea rcx, [rbp - 0x50]
1459a954b e870d95000 call 0x145eb6ec0
1459a9550 90 nop
1459a9551 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459a9555 42c6043000 mov byte ptr [rax + r14], 0
1459a955a 49ffc6 inc r14
1459a955d 4c8975c0 mov qword ptr [rbp - 0x40], r14
1459a9561 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1459a9565 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1459a9569 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459a956d 488945e0 mov qword ptr [rbp - 0x20], rax
1459a9571 488b45c8 mov rax, qword ptr [rbp - 0x38]
1459a9575 488945e8 mov qword ptr [rbp - 0x18], rax
1459a9579 488b7de0 mov rdi, qword ptr [rbp - 0x20]
1459a957d 483b7dd0 cmp rdi, qword ptr [rbp - 0x30]
1459a9581 750a jne 0x1459a958d
1459a9583 488d4dd0 lea rcx, [rbp - 0x30]
1459a9587 e834d95000 call 0x145eb6ec0
1459a958c 90 nop
1459a958d 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459a9591 c6043800 mov byte ptr [rax + rdi], 0
1459a9595 48ffc7 inc rdi
1459a9598 48897de0 mov qword ptr [rbp - 0x20], rdi
1459a959c 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1459a95a0 0f1106 movups xmmword ptr [rsi], xmm0
1459a95a3 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459a95a7 48894610 mov qword ptr [rsi + 0x10], rax
1459a95ab 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459a95af 48894618 mov qword ptr [rsi + 0x18], rax
1459a95b3 4889f0 mov rax, rsi
1459a95b6 4881c480000000 add rsp, 0x80
1459a95bd 5b pop rbx
1459a95be 5f pop rdi
1459a95bf 5e pop rsi
1459a95c0 415c pop r12
1459a95c2 415e pop r14
1459a95c4 415f pop r15
1459a95c6 5d pop rbp
1459a95c7 c3 ret
1459a95c8 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459a95d1 488d4db0 lea rcx, [rbp - 0x50]
1459a95d5 ba05000000 mov edx, 5
1459a95da 41b804000000 mov r8d, 4
1459a95e0 41b901000000 mov r9d, 1
1459a95e6 e825b43600 call 0x145d14a10
1459a95eb 90 nop
1459a95ec 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459a95f0 e9e8fdffff jmp 0x1459a93dd
1459a95f5 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459a95fe 488d4dd0 lea rcx, [rbp - 0x30]
1459a9602 41b901000000 mov r9d, 1
1459a9608 4c89fa mov rdx, r15
1459a960b 4989d8 mov r8, rbx
1459a960e e8fdb33600 call 0x145d14a10
1459a9613 90 nop
1459a9614 4c8b65d0 mov r12, qword ptr [rbp - 0x30]
1459a9618 4c8b7de0 mov r15, qword ptr [rbp - 0x20]
1459a961c e918feffff jmp 0x1459a9439
1459a9621 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459a962a 488d4db0 lea rcx, [rbp - 0x50]
1459a962e 41b808000000 mov r8d, 8
1459a9634 41b901000000 mov r9d, 1
1459a963a e8d1b33600 call 0x145d14a10
1459a963f 90 nop
1459a9640 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1459a9644 e955feffff jmp 0x1459a949e
1459a9649 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459a9652 488d4dd0 lea rcx, [rbp - 0x30]
1459a9656 41b804000000 mov r8d, 4
1459a965c 41b901000000 mov r9d, 1
1459a9662 e8a9b33600 call 0x145d14a10
1459a9667 90 nop
1459a9668 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1459a966c e96efeffff jmp 0x1459a94df
1459a9671 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459a967a 488d4db0 lea rcx, [rbp - 0x50]
1459a967e 41b901000000 mov r9d, 1
1459a9684 4c89f2 mov rdx, r14
1459a9687 4989d8 mov r8, rbx
1459a968a e881b33600 call 0x145d14a10
1459a968f 90 nop
1459a9690 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
1459a9694 4c8b75c0 mov r14, qword ptr [rbp - 0x40]
1459a9698 e98cfeffff jmp 0x1459a9529
1459a969d b901000000 mov ecx, 1
1459a96a2 ba20000000 mov edx, 0x20
1459a96a7 e81fd95000 call 0x145eb6fcb
1459a96ac 0f0b ud2
