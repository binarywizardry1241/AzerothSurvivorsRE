145821360 push rbp
145821361 push rsi
145821362 push rdi
145821363 push rbx
145821364 sub rsp, 0xe8
14582136b lea rbp, [rsp + 0x80]
145821373 mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
14582137b mov rdi, r8
14582137e mov rbx, rdx
145821381 mov rsi, rcx
145821384 mov qword ptr [rbp + 0x30], 0
14582138c mov qword ptr [rbp + 0x38], 1
145821394 mov qword ptr [rbp + 0x40], 0
14582139c call 0x140002200
1458213a1 mov ecx, 0x8000
1458213a6 mov edx, 1
1458213ab call 0x1400021f0
1458213b0 mov qword ptr [rbp + 0x58], rax
1458213b4 test rax, rax
1458213b7 je 0x1458215b9
1458213bd lea rcx, [rbp + 0x18]
1458213c1 xor edx, edx
1458213c3 call 0x145ca8720
1458213c8 nop
1458213c9 xorps xmm0, xmm0
1458213cc movups xmmword ptr [rbp - 0x28], xmm0
1458213d0 movups xmm0, xmmword ptr [rbp + 0x18]
1458213d4 movups xmmword ptr [rbp - 0x18], xmm0
1458213d8 mov rax, qword ptr [rbp + 0x28]
1458213dc mov qword ptr [rbp - 8], rax
1458213e0 mov qword ptr [rbp - 0x48], rbx
1458213e4 mov qword ptr [rbp - 0x40], rdi
1458213e8 mov rax, qword ptr [rbp + 0x58]
1458213ec mov qword ptr [rbp - 0x38], rax
1458213f0 mov qword ptr [rbp - 0x30], 0x8000
1458213f8 mov qword ptr [rbp], 0x400001
145821400 mov qword ptr [rbp + 8], 0x400001
145821408 lea rcx, [rbp - 0x48]
14582140c lea rdx, [rbp + 0x30]
145821410 xor r8d, r8d
145821413 call 0x145828bd0
145821418 nop
145821419 cmp rax, 1
14582141d jne 0x14582147f
14582141f mov eax, edx
145821421 and eax, 3
145821424 lea ecx, [rax - 2]
145821427 cmp ecx, 2
14582142a jb 0x145821447
14582142c test rax, rax
14582142f je 0x145821447
145821431 lea rax, [rdx - 1]
145821435 lea rcx, [rbp + 0x20]
145821439 mov qword ptr [rbp + 0x20], rax
14582143d mov byte ptr [rbp + 0x18], 3
145821441 call 0x145cf9ce0
145821446 nop
145821447 mov qword ptr [rsi], 0xffffffffffffffff
14582144e mov rdx, qword ptr [rbp - 0x30]
145821452 test rdx, rdx
145821455 je 0x145821466
145821457 mov rcx, qword ptr [rbp - 0x38]
14582145b mov r8d, 1
145821461 call 0x1400021d0
145821466 mov rcx, qword ptr [rbp - 0x18]
14582146a mov edx, 0xa920
14582146f mov r8d, 8
145821475 call 0x1400021d0
14582147a jmp 0x145821592
14582147f mov rdx, qword ptr [rbp - 0x30]
145821483 test rdx, rdx
145821486 je 0x145821497
145821488 mov rcx, qword ptr [rbp - 0x38]
14582148c mov r8d, 1
145821492 call 0x1400021d0
145821497 mov rcx, qword ptr [rbp - 0x18]
14582149b mov edx, 0xa920
1458214a0 mov r8d, 8
1458214a6 call 0x1400021d0
1458214ab mov rax, qword ptr [rbp + 0x40]
1458214af cmp rax, 0x400000
1458214b5 jbe 0x1458214c3
1458214b7 mov qword ptr [rsi], 0xffffffffffffffff
1458214be jmp 0x145821592
1458214c3 mov rcx, qword ptr [rbp + 0x38]
1458214c7 mov qword ptr [rbp - 0x48], rcx
1458214cb mov qword ptr [rbp - 0x40], rax
1458214cf mov qword ptr [rbp - 0x38], 0
1458214d7 mov byte ptr [rbp - 0x30], 1
1458214db lea rdi, [rbp - 0x48]
1458214df mov edx, 4
1458214e4 mov rcx, rdi
1458214e7 call 0x145b7ca30
1458214ec nop
1458214ed mov qword ptr [rbp + 0x18], rdi
1458214f1 mov qword ptr [rbp + 0x20], 0
1458214f9 mov qword ptr [rbp + 0x28], rax
1458214fd lea rcx, [rbp - 0x60]
145821501 lea rdx, [rbp + 0x18]
145821505 call 0x1459c4ae0
14582150a nop
14582150b cmp byte ptr [rbp - 0x30], 0
14582150f je 0x145821522
145821511 mov rax, qword ptr [rbp - 0x50]
145821515 mov qword ptr [rsi + 0x10], rax
145821519 movups xmm0, xmmword ptr [rbp - 0x60]
14582151d movups xmmword ptr [rsi], xmm0
145821520 jmp 0x145821592
145821522 mov rax, qword ptr [rbp - 0x60]
145821526 mov qword ptr [rbp + 0x48], rax
14582152a mov rcx, qword ptr [rbp - 0x58]
14582152e mov rax, qword ptr [rbp - 0x50]
145821532 mov qword ptr [rbp + 0x10], rax
145821536 mov qword ptr [rsi], 0xffffffffffffffff
14582153d mov qword ptr [rbp + 0x58], 0
145821545 mov qword ptr [rbp + 0x50], rcx
145821549 nop dword ptr [rax]
145821550 mov rax, qword ptr [rbp + 0x58]
145821554 cmp qword ptr [rbp + 0x10], rax
145821558 je 0x145821573
14582155a inc rax
14582155d mov qword ptr [rbp + 0x58], rax
145821561 lea rdi, [rcx + 0x1e8]
145821568 call 0x1459be140
14582156d nop
14582156e mov rcx, rdi
145821571 jmp 0x145821550
145821573 mov rax, qword ptr [rbp + 0x48]
145821577 test rax, rax
14582157a je 0x145821592
14582157c imul rdx, rax, 0x1e8
145821583 mov r8d, 8
145821589 mov rcx, qword ptr [rbp + 0x50]
14582158d jmp 0x145821475
145821592 mov rdx, qword ptr [rbp + 0x30]
145821596 test rdx, rdx
145821599 je 0x1458215aa
14582159b mov rcx, qword ptr [rbp + 0x38]
14582159f mov r8d, 1
1458215a5 call 0x1400021d0
1458215aa mov rax, rsi
1458215ad add rsp, 0xe8
1458215b4 pop rbx
1458215b5 pop rdi
1458215b6 pop rsi
1458215b7 pop rbp
1458215b8 ret
1458215b9 mov ecx, 1
1458215be mov edx, 0x8000
1458215c3 call 0x145eb6fcb
1458215c8 nop
1458215c9 ud2
