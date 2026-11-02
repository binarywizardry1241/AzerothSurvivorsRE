1459b1570 push rbp
1459b1571 push rsi
1459b1572 push rdi
1459b1573 push rbx
1459b1574 sub rsp, 0x88
1459b157b lea rbp, [rsp + 0x80]
1459b1583 movaps xmmword ptr [rbp - 0x10], xmm6
1459b1587 mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1459b158f movaps xmm6, xmm3
1459b1592 mov rdi, r8
1459b1595 mov ebx, edx
1459b1597 mov rsi, rcx
1459b159a call 0x140002200
1459b159f mov ecx, 0x20
1459b15a4 mov edx, 1
1459b15a9 call 0x1400021c0
1459b15ae test rax, rax
1459b15b1 je 0x1459b1654
1459b15b7 mov dword ptr [rax], ebx
1459b15b9 mov qword ptr [rbp - 0x58], 0x20
1459b15c1 mov qword ptr [rbp - 0x50], rax
1459b15c5 mov qword ptr [rbp - 0x48], 4
1459b15cd mov word ptr [rbp - 0x40], 0x236
1459b15d3 lea rcx, [rbp - 0x38]
1459b15d7 lea rdx, [rbp - 0x58]
1459b15db mov r8, rdi
1459b15de call 0x14598cc40
1459b15e3 mov rax, qword ptr [rbp - 0x38]
1459b15e7 mov rdx, qword ptr [rbp - 0x28]
1459b15eb sub rax, rdx
1459b15ee cmp rax, 3
1459b15f2 jbe 0x1459b162f
1459b15f4 mov rax, qword ptr [rbp - 0x30]
1459b15f8 movss dword ptr [rax + rdx], xmm6
1459b15fd add rdx, 4
1459b1601 mov qword ptr [rbp - 0x28], rdx
1459b1605 movups xmm0, xmmword ptr [rbp - 0x38]
1459b1609 movups xmmword ptr [rsi], xmm0
1459b160c mov rax, qword ptr [rbp - 0x28]
1459b1610 mov qword ptr [rsi + 0x10], rax
1459b1614 mov rax, qword ptr [rbp - 0x20]
1459b1618 mov qword ptr [rsi + 0x18], rax
1459b161c mov rax, rsi
1459b161f movaps xmm6, xmmword ptr [rbp - 0x10]
1459b1623 add rsp, 0x88
1459b162a pop rbx
1459b162b pop rdi
1459b162c pop rsi
1459b162d pop rbp
1459b162e ret
1459b162f mov qword ptr [rsp + 0x20], 1
1459b1638 lea rcx, [rbp - 0x38]
1459b163c mov r8d, 4
1459b1642 mov r9d, 1
1459b1648 call 0x145d14a10
1459b164d nop
1459b164e mov rdx, qword ptr [rbp - 0x28]
1459b1652 jmp 0x1459b15f4
1459b1654 mov ecx, 1
1459b1659 mov edx, 0x20
1459b165e call 0x145eb6fcb
1459b1663 ud2
