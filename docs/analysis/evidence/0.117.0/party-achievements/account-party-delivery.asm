145b154f0 55 push rbp
145b154f1 4157 push r15
145b154f3 4156 push r14
145b154f5 4155 push r13
145b154f7 4154 push r12
145b154f9 56 push rsi
145b154fa 57 push rdi
145b154fb 53 push rbx
145b154fc 4881ecb8020000 sub rsp, 0x2b8
145b15503 488dac2480000000 lea rbp, [rsp + 0x80]
145b1550b 48c78530020000feffffff mov qword ptr [rbp + 0x230], 0xfffffffffffffffe
145b15516 4889ce mov rsi, rcx
145b15519 488d4d50 lea rcx, [rbp + 0x50]
145b1551d 4889f2 mov rdx, rsi
145b15520 e8bbf7ffff call 0x145b14ce0
145b15525 48837d50ff cmp qword ptr [rbp + 0x50], -1
145b1552a 0f8489040000 je 0x145b159b9
145b15530 488d8d18010000 lea rcx, [rbp + 0x118]
145b15537 488d5550 lea rdx, [rbp + 0x50]
145b1553b 41b8c8000000 mov r8d, 0xc8
145b15541 e895e74700 call 0x145f93cdb
145b15546 4881beb0170000ffffff00 cmp qword ptr [rsi + 0x17b0], 0xffffff
145b15551 0f8455040000 je 0x145b159ac
145b15557 837e1002 cmp dword ptr [rsi + 0x10], 2
145b1555b 740d je 0x145b1556a
145b1555d f686900c000001 test byte ptr [rsi + 0xc90], 1
145b15564 0f8542040000 jne 0x145b159ac
145b1556a 8bbdb8010000 mov edi, dword ptr [rbp + 0x1b8]
145b15570 89bd20020000 mov dword ptr [rbp + 0x220], edi
145b15576 8b9dbc010000 mov ebx, dword ptr [rbp + 0x1bc]
145b1557c 448ba5c0010000 mov r12d, dword ptr [rbp + 0x1c0]
145b15583 448badc4010000 mov r13d, dword ptr [rbp + 0x1c4]
145b1558a 448bb5c8010000 mov r14d, dword ptr [rbp + 0x1c8]
145b15591 440fb6bdd8010000 movzx r15d, byte ptr [rbp + 0x1d8]
145b15599 488b8d20010000 mov rcx, qword ptr [rbp + 0x120]
145b155a0 488b9528010000 mov rdx, qword ptr [rbp + 0x128]
145b155a7 e88455f6ff call 0x145a7ab30
145b155ac 4869c0f0000000 imul rax, rax, 0xf0
145b155b3 488d15565a7801 lea rdx, [rip + 0x1785a56]
145b155ba 488b4c1008 mov rcx, qword ptr [rax + rdx + 8]
145b155bf 488b541010 mov rdx, qword ptr [rax + rdx + 0x10]
145b155c4 e86755f6ff call 0x145a7ab30
145b155c9 31d2 xor edx, edx
145b155cb 89f9 mov ecx, edi
145b155cd 2b8e7c180000 sub ecx, dword ptr [rsi + 0x187c]
145b155d3 0f42ca cmovb ecx, edx
145b155d6 48038ec8110000 add rcx, qword ptr [rsi + 0x11c8]
145b155dd 49c7c0ffffffff mov r8, 0xffffffffffffffff
145b155e4 490f42c8 cmovb rcx, r8
145b155e8 4189d9 mov r9d, ebx
145b155eb 442b8e80180000 sub r9d, dword ptr [rsi + 0x1880]
145b155f2 440f42ca cmovb r9d, edx
145b155f6 4c038ed0110000 add r9, qword ptr [rsi + 0x11d0]
145b155fd 4d0f42c8 cmovb r9, r8
145b15601 4589e2 mov r10d, r12d
145b15604 442b9684180000 sub r10d, dword ptr [rsi + 0x1884]
145b1560b 440f42d2 cmovb r10d, edx
145b1560f 4c0396d8110000 add r10, qword ptr [rsi + 0x11d8]
145b15616 4d0f42d0 cmovb r10, r8
145b1561a 4589eb mov r11d, r13d
145b1561d 442b9e88180000 sub r11d, dword ptr [rsi + 0x1888]
145b15624 440f42da cmovb r11d, edx
145b15628 4c039ee0110000 add r11, qword ptr [rsi + 0x11e0]
145b1562f 4889c7 mov rdi, rax
145b15632 4d0f42d8 cmovb r11, r8
145b15636 4489f0 mov eax, r14d
145b15639 2b868c180000 sub eax, dword ptr [rsi + 0x188c]
145b1563f 0f42c2 cmovb eax, edx
145b15642 480386f8110000 add rax, qword ptr [rsi + 0x11f8]
145b15649 490f42c0 cmovb rax, r8
145b1564d 48898ec8110000 mov qword ptr [rsi + 0x11c8], rcx
145b15654 4c898ed0110000 mov qword ptr [rsi + 0x11d0], r9
145b1565b 4c8996d8110000 mov qword ptr [rsi + 0x11d8], r10
145b15662 4c899ee0110000 mov qword ptr [rsi + 0x11e0], r11
145b15669 488986f8110000 mov qword ptr [rsi + 0x11f8], rax
145b15670 8b8520020000 mov eax, dword ptr [rbp + 0x220]
145b15676 89867c180000 mov dword ptr [rsi + 0x187c], eax
145b1567c 899e80180000 mov dword ptr [rsi + 0x1880], ebx
145b15682 4489a684180000 mov dword ptr [rsi + 0x1884], r12d
145b15689 4489ae88180000 mov dword ptr [rsi + 0x1888], r13d
145b15690 4489b68c180000 mov dword ptr [rsi + 0x188c], r14d
145b15697 80bdd501000000 cmp byte ptr [rbp + 0x1d5], 0
145b1569e 0f8489010000 je 0x145b1582d
145b156a4 488b8600110000 mov rax, qword ptr [rsi + 0x1100]
145b156ab 4c8bb608110000 mov r14, qword ptr [rsi + 0x1108]
145b156b2 4d89f4 mov r12, r14
145b156b5 4d85f6 test r14, r14
145b156b8 747b je 0x145b15735
145b156ba 4531e4 xor r12d, r12d
145b156bd 4983fe01 cmp r14, 1
145b156c1 744b je 0x145b1570e
145b156c3 4c89f1 mov rcx, r14
145b156c6 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b156d0 4c89e2 mov rdx, r12
145b156d3 4989c8 mov r8, rcx
145b156d6 49d1e8 shr r8, 1
145b156d9 4d01c4 add r12, r8
145b156dc 4d89e1 mov r9, r12
145b156df 49c1e104 shl r9, 4
145b156e3 4531d2 xor r10d, r10d
145b156e6 4a397c0808 cmp qword ptr [rax + r9 + 8], rdi
145b156eb 410f97c2 seta r10b
145b156ef 4531db xor r11d, r11d
145b156f2 46383c08 cmp byte ptr [rax + r9], r15b
145b156f6 410f97c3 seta r11b
145b156fa 450f44da cmove r11d, r10d
145b156fe 4584db test r11b, r11b
145b15701 4c0f45e2 cmovne r12, rdx
145b15705 4c29c1 sub rcx, r8
145b15708 4883f901 cmp rcx, 1
145b1570c 77c2 ja 0x145b156d0
145b1570e 4c89e1 mov rcx, r12
145b15711 48c1e104 shl rcx, 4
145b15715 44383c08 cmp byte ptr [rax + rcx], r15b
145b15719 7505 jne 0x145b15720
145b1571b 48397c0808 cmp qword ptr [rax + rcx + 8], rdi
145b15720 0f97c1 seta cl
145b15723 80d900 sbb cl, 0
145b15726 84c9 test cl, cl
145b15728 745b je 0x145b15785
145b1572a 31d2 xor edx, edx
145b1572c 80f9ff cmp cl, 0xff
145b1572f 0f94c2 sete dl
145b15732 4901d4 add r12, rdx
145b15735 4c3bb6f8100000 cmp r14, qword ptr [rsi + 0x10f8]
145b1573c 7514 jne 0x145b15752
145b1573e 488d8ef8100000 lea rcx, [rsi + 0x10f8]
145b15745 e8c6ed4700 call 0x145f94510
145b1574a 90 nop
145b1574b 488b8600110000 mov rax, qword ptr [rsi + 0x1100]
145b15752 4c89e3 mov rbx, r12
145b15755 48c1e304 shl rbx, 4
145b15759 4801c3 add rbx, rax
145b1575c 4d89f0 mov r8, r14
145b1575f 4d29e0 sub r8, r12
145b15762 7610 jbe 0x145b15774
145b15764 488d4b10 lea rcx, [rbx + 0x10]
145b15768 49c1e004 shl r8, 4
145b1576c 4889da mov rdx, rbx
145b1576f e86de54700 call 0x145f93ce1
145b15774 44883b mov byte ptr [rbx], r15b
145b15777 48897b08 mov qword ptr [rbx + 8], rdi
145b1577b 49ffc6 inc r14
145b1577e 4c89b608110000 mov qword ptr [rsi + 0x1108], r14
145b15785 4883bd78010000ff cmp qword ptr [rbp + 0x178], -1
145b1578d 0f849a000000 je 0x145b1582d
145b15793 488b8618110000 mov rax, qword ptr [rsi + 0x1118]
145b1579a 4c8bb620110000 mov r14, qword ptr [rsi + 0x1120]
145b157a1 4d89f7 mov r15, r14
145b157a4 4d85f6 test r14, r14
145b157a7 743e je 0x145b157e7
145b157a9 4531ff xor r15d, r15d
145b157ac 4983fe01 cmp r14, 1
145b157b0 742b je 0x145b157dd
145b157b2 4c89f1 mov rcx, r14
145b157b5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b157c0 4c89fa mov rdx, r15
145b157c3 4989c8 mov r8, rcx
145b157c6 49d1e8 shr r8, 1
145b157c9 4d01c7 add r15, r8
145b157cc 4a393cf8 cmp qword ptr [rax + r15*8], rdi
145b157d0 4c0f47fa cmova r15, rdx
145b157d4 4c29c1 sub rcx, r8
145b157d7 4883f901 cmp rcx, 1
145b157db 77e3 ja 0x145b157c0
145b157dd 4a393cf8 cmp qword ptr [rax + r15*8], rdi
145b157e1 744a je 0x145b1582d
145b157e3 4983d700 adc r15, 0
145b157e7 4c3bb610110000 cmp r14, qword ptr [rsi + 0x1110]
145b157ee 7514 jne 0x145b15804
145b157f0 488d8e10110000 lea rcx, [rsi + 0x1110]
145b157f7 e874ea4700 call 0x145f94270
145b157fc 90 nop
145b157fd 488b8618110000 mov rax, qword ptr [rsi + 0x1118]
145b15804 4a8d1cf8 lea rbx, [rax + r15*8]
145b15808 4d89f0 mov r8, r14
145b1580b 4d29f8 sub r8, r15
145b1580e 7610 jbe 0x145b15820
145b15810 488d4b08 lea rcx, [rbx + 8]
145b15814 49c1e003 shl r8, 3
145b15818 4889da mov rdx, rbx
145b1581b e8c1e44700 call 0x145f93ce1
145b15820 48893b mov qword ptr [rbx], rdi
145b15823 49ffc6 inc r14
145b15826 4c89b620110000 mov qword ptr [rsi + 0x1120], r14
145b1582d 488d4db0 lea rcx, [rbp - 0x50]
145b15831 4889f2 mov rdx, rsi
145b15834 e837100000 call 0x145b16870
145b15839 90 nop
145b1583a 488dbe20100000 lea rdi, [rsi + 0x1020]
145b15841 48837db0ff cmp qword ptr [rbp - 0x50], -1
145b15846 7451 je 0x145b15899
145b15848 488d5d50 lea rbx, [rbp + 0x50]
145b1584c 488d55b0 lea rdx, [rbp - 0x50]
145b15850 41b8a0000000 mov r8d, 0xa0
145b15856 4889d9 mov rcx, rbx
145b15859 e87de44700 call 0x145f93cdb
145b1585e 90 nop
145b1585f 488d8de0010000 lea rcx, [rbp + 0x1e0]
145b15866 4889fa mov rdx, rdi
145b15869 4989d8 mov r8, rbx
145b1586c e89f350300 call 0x145b48e10
145b15871 90 nop
145b15872 488d4db0 lea rcx, [rbp - 0x50]
145b15876 e8b5fafdff call 0x145af5330
145b1587b 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
145b15882 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
145b15889 488b85f0010000 mov rax, qword ptr [rbp + 0x1f0]
145b15890 48898510020000 mov qword ptr [rbp + 0x210], rax
145b15897 eb21 jmp 0x145b158ba
145b15899 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
145b158a4 48c7850802000008000000 mov qword ptr [rbp + 0x208], 8
145b158af 48c7851002000000000000 mov qword ptr [rbp + 0x210], 0
145b158ba c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b158c1 e8dabc4200 call 0x145f415a0
145b158c6 90 nop
145b158c7 8945b0 mov dword ptr [rbp - 0x50], eax
145b158ca 8955b4 mov dword ptr [rbp - 0x4c], edx
145b158cd c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b158d4 488d4d50 lea rcx, [rbp + 0x50]
145b158d8 488d55b0 lea rdx, [rbp - 0x50]
145b158dc 41b800803ed5 mov r8d, 0xd53e8000
145b158e2 41b9deb19d01 mov r9d, 0x19db1de
145b158e8 e863bc4200 call 0x145f41550
145b158ed 90 nop
145b158ee 807d5000 cmp byte ptr [rbp + 0x50], 0
145b158f2 7506 jne 0x145b158fa
145b158f4 4c8b4d58 mov r9, qword ptr [rbp + 0x58]
145b158f8 eb03 jmp 0x145b158fd
145b158fa 4531c9 xor r9d, r9d
145b158fd c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b15904 488d4d50 lea rcx, [rbp + 0x50]
145b15908 41b801000000 mov r8d, 1
145b1590e 4889fa mov rdx, rdi
145b15911 e82a400300 call 0x145b49940
145b15916 90 nop
145b15917 4c8b7d50 mov r15, qword ptr [rbp + 0x50]
145b1591b 4c8b6558 mov r12, qword ptr [rbp + 0x58]
145b1591f 488b5d60 mov rbx, qword ptr [rbp + 0x60]
145b15923 488b8500020000 mov rax, qword ptr [rbp + 0x200]
145b1592a 4c8bb510020000 mov r14, qword ptr [rbp + 0x210]
145b15931 4c29f0 sub rax, r14
145b15934 4839c3 cmp rbx, rax
145b15937 0f8790000000 ja 0x145b159cd
145b1593d 4885db test rbx, rbx
145b15940 741f je 0x145b15961
145b15942 4c8d04dd00000000 lea r8, [rbx*8]
145b1594a 4a8d0cf500000000 lea rcx, [r14*8]
145b15952 48038d08020000 add rcx, qword ptr [rbp + 0x208]
145b15959 4c89e2 mov rdx, r12
145b1595c e87ae34700 call 0x145f93cdb
145b15961 4901de add r14, rbx
145b15964 4c89b510020000 mov qword ptr [rbp + 0x210], r14
145b1596b 4d85ff test r15, r15
145b1596e 7415 je 0x145b15985
145b15970 49c1e703 shl r15, 3
145b15974 41b808000000 mov r8d, 8
145b1597a 4c89e1 mov rcx, r12
145b1597d 4c89fa mov rdx, r15
145b15980 e84bc84efa call 0x1400021d0
145b15985 c6852f02000001 mov byte ptr [rbp + 0x22f], 1
145b1598c 4889f9 mov rcx, rdi
145b1598f e84c4afbff call 0x145aca3e0
145b15994 90 nop
145b15995 c6852f02000000 mov byte ptr [rbp + 0x22f], 0
145b1599c 488d9500020000 lea rdx, [rbp + 0x200]
145b159a3 4889f1 mov rcx, rsi
145b159a6 e8e5e2ffff call 0x145b13c90
145b159ab 90 nop
145b159ac 488d8d18010000 lea rcx, [rbp + 0x118]
145b159b3 e86811f9ff call 0x145aa6b20
145b159b8 90 nop
145b159b9 4881c4b8020000 add rsp, 0x2b8
145b159c0 5b pop rbx
145b159c1 5f pop rdi
145b159c2 5e pop rsi
145b159c3 415c pop r12
145b159c5 415d pop r13
145b159c7 415e pop r14
145b159c9 415f pop r15
145b159cb 5d pop rbp
145b159cc c3 ret
145b159cd 4c89a5f8010000 mov qword ptr [rbp + 0x1f8], r12
145b159d4 4c89bd20020000 mov qword ptr [rbp + 0x220], r15
145b159db 48c744242008000000 mov qword ptr [rsp + 0x20], 8
145b159e4 488d8d00020000 lea rcx, [rbp + 0x200]
145b159eb 41b908000000 mov r9d, 8
145b159f1 4c89f2 mov rdx, r14
145b159f4 4989d8 mov r8, rbx
145b159f7 e8f4e64700 call 0x145f940f0
145b159fc 90 nop
145b159fd 4c8bb510020000 mov r14, qword ptr [rbp + 0x210]
145b15a04 4c8bbd20020000 mov r15, qword ptr [rbp + 0x220]
145b15a0b 4c8ba5f8010000 mov r12, qword ptr [rbp + 0x1f8]
145b15a12 e92bffffff jmp 0x145b15942
