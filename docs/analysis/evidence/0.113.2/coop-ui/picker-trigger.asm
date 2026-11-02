1402d1200 push r15
1402d1202 push r14
1402d1204 push r13
1402d1206 push r12
1402d1208 push rsi
1402d1209 push rdi
1402d120a push rbp
1402d120b push rbx
1402d120c sub rsp, 0x168
1402d1213 movaps xmmword ptr [rsp + 0x150], xmm7
1402d121b movaps xmmword ptr [rsp + 0x140], xmm6
1402d1223 mov rdi, rdx
1402d1226 mov rsi, rcx
1402d1229 mov rbp, qword ptr [rcx]
1402d122c mov rax, qword ptr [rcx + 0x28]
1402d1230 mov qword ptr [rsp + 0xe0], rbp
1402d1238 movups xmm0, xmmword ptr [rcx + 8]
1402d123c movups xmmword ptr [rsp + 0xe8], xmm0
1402d1244 movups xmm0, xmmword ptr [rcx + 0x18]
1402d1248 movups xmmword ptr [rsp + 0xf8], xmm0
1402d1250 mov qword ptr [rsp + 0x108], rax
1402d1258 lea rcx, [rip + 0x5c2e344]
1402d125f mov edx, 5
1402d1264 call 0x145895670
1402d1269 mov r14, rdx
1402d126c test rdx, rdx
1402d126f jns 0x1402d1281
1402d1271 xor r12d, r12d
1402d1274 mov rcx, r12
1402d1277 mov rdx, r14
1402d127a call 0x145e9bd8b
1402d127f ud2
1402d1281 je 0x1402d12d8
1402d1283 mov rbx, rax
1402d1286 call 0x140002200
1402d128b mov r12d, 1
1402d1291 mov edx, 1
1402d1296 mov rcx, r14
1402d1299 call 0x1400021c0
1402d129e test rax, rax
1402d12a1 je 0x1402d1274
1402d12a3 mov r15, rax
1402d12a6 mov rcx, rax
1402d12a9 mov rdx, rbx
1402d12ac mov r8, r14
1402d12af call 0x145cf998b
1402d12b4 movzx r12d, byte ptr [rdi]
1402d12b8 cmp r12b, 1
1402d12bc jne 0x1402d12e8
1402d12be mov eax, dword ptr [rdi + 1]
1402d12c1 mov ecx, dword ptr [rdi + 4]
1402d12c4 mov dword ptr [rsp + 0x2f], ecx
1402d12c8 mov dword ptr [rsp + 0x2c], eax
1402d12cc mov rbx, qword ptr [rdi + 8]
1402d12d0 movzx eax, byte ptr [rdi + 0x10]
1402d12d4 mov cl, 1
1402d12d6 jmp 0x1402d12f8
1402d12d8 mov r15d, 1
1402d12de movzx r12d, byte ptr [rdi]
1402d12e2 cmp r12b, 1
1402d12e6 je 0x1402d12be
1402d12e8 mov rbx, qword ptr [rdi + 8]
1402d12ec lock inc qword ptr [rbx]
1402d12f0 jle 0x1402d1594
1402d12f6 xor ecx, ecx
1402d12f8 lea r13, [rsp + 0xe8]
1402d1300 movups xmm0, xmmword ptr [rip + 0x5c2c641]
1402d1307 movups xmmword ptr [rsp + 0x3c], xmm0
1402d130c mov dword ptr [rsp + 0x4c], 0x3f800000
1402d1314 mov qword ptr [rsp + 0x58], r14
1402d1319 mov qword ptr [rsp + 0x60], r15
1402d131e mov qword ptr [rsp + 0x68], r14
1402d1323 mov qword ptr [rsp + 0x70], 0
1402d132c mov qword ptr [rsp + 0x78], 4
1402d1335 mov qword ptr [rsp + 0x80], 0
1402d1341 mov byte ptr [rsp + 0x88], cl
1402d1348 mov ecx, dword ptr [rsp + 0x2c]
1402d134c mov edx, dword ptr [rsp + 0x2f]
1402d1350 mov dword ptr [rsp + 0x89], ecx
1402d1357 mov dword ptr [rsp + 0x8c], edx
1402d135e mov qword ptr [rsp + 0x90], rbx
1402d1366 mov qword ptr [rsp + 0x98], rax
1402d136e mov dword ptr [rsp + 0xa0], 0x41880000
1402d1379 mov word ptr [rsp + 0xa4], 0x190
1402d1383 mov byte ptr [rsp + 0xa6], 1
1402d138b movups xmm0, xmmword ptr [rsp + 0x3b]
1402d1390 movups xmmword ptr [rsp + 0xa7], xmm0
1402d1398 mov rax, qword ptr [rsp + 0x48]
1402d139d mov qword ptr [rsp + 0xb4], rax
1402d13a5 mov eax, dword ptr [rip + 0x5bfe52d]
1402d13ab mov dword ptr [rsp + 0xcc], eax
1402d13b2 movups xmm6, xmmword ptr [rip + 0x5bfe50f]
1402d13b9 movups xmmword ptr [rsp + 0xbc], xmm6
1402d13c1 movsd xmm7, qword ptr [rip + 0x5bd0d07]
1402d13c9 movsd qword ptr [rsp + 0xd0], xmm7
1402d13d2 mov qword ptr [rsp + 0x50], rbp
1402d13d7 lea rcx, [rsp + 0x110]
1402d13df lea r8, [rsp + 0x50]
1402d13e4 mov rdx, r13
1402d13e7 call 0x140278cc0
1402d13ec lea rcx, [rip + 0x5c30675]
1402d13f3 mov edx, 0x11
1402d13f8 call 0x145895670
1402d13fd mov r14, rdx
1402d1400 test rdx, rdx
1402d1403 jns 0x1402d1415
1402d1405 xor r13d, r13d
1402d1408 mov rcx, r13
1402d140b mov rdx, r14
1402d140e call 0x145e9bd8b
1402d1413 ud2
1402d1415 je 0x1402d1479
1402d1417 mov qword ptr [rsp + 0xd8], rax
1402d141f call 0x140002200
1402d1424 mov r13d, 1
1402d142a mov edx, 1
1402d142f mov rcx, r14
1402d1432 call 0x1400021c0
1402d1437 test rax, rax
1402d143a je 0x1402d1596
1402d1440 mov r15, rax
1402d1443 mov rcx, rax
1402d1446 mov rdx, qword ptr [rsp + 0xd8]
1402d144e mov r8, r14
1402d1451 call 0x145cf998b
1402d1456 lea r13, [rsp + 0xe8]
1402d145e test r12b, r12b
1402d1461 je 0x1402d1484
1402d1463 mov eax, dword ptr [rdi + 1]
1402d1466 mov ecx, dword ptr [rdi + 4]
1402d1469 mov dword ptr [rsp + 0x37], ecx
1402d146d mov dword ptr [rsp + 0x34], eax
1402d1471 movzx eax, byte ptr [rdi + 0x10]
1402d1475 mov cl, 1
1402d1477 jmp 0x1402d1490
1402d1479 mov r15d, 1
1402d147f test r12b, r12b
1402d1482 jne 0x1402d1463
1402d1484 lock inc qword ptr [rbx]
1402d1488 jle 0x1402d1594
1402d148e xor ecx, ecx
1402d1490 movups xmm0, xmmword ptr [rip + 0x5c2c4f5]
1402d1497 movups xmmword ptr [rsp + 0x3c], xmm0
1402d149c mov dword ptr [rsp + 0x4c], 0x3f800000
1402d14a4 mov qword ptr [rsp + 0x58], r14
1402d14a9 mov qword ptr [rsp + 0x60], r15
1402d14ae mov qword ptr [rsp + 0x68], r14
1402d14b3 mov qword ptr [rsp + 0x70], 0
1402d14bc mov qword ptr [rsp + 0x78], 4
1402d14c5 mov qword ptr [rsp + 0x80], 0
1402d14d1 mov byte ptr [rsp + 0x88], cl
1402d14d8 mov ecx, dword ptr [rsp + 0x34]
1402d14dc mov edx, dword ptr [rsp + 0x37]
1402d14e0 mov dword ptr [rsp + 0x89], ecx
1402d14e7 mov dword ptr [rsp + 0x8c], edx
1402d14ee mov qword ptr [rsp + 0x90], rbx
1402d14f6 mov qword ptr [rsp + 0x98], rax
1402d14fe mov dword ptr [rsp + 0xa0], 0x41400000
1402d1509 mov word ptr [rsp + 0xa4], 0x190
1402d1513 mov byte ptr [rsp + 0xa6], 1
1402d151b movups xmm0, xmmword ptr [rsp + 0x3b]
1402d1520 movups xmmword ptr [rsp + 0xa7], xmm0
1402d1528 mov rax, qword ptr [rsp + 0x48]
1402d152d mov qword ptr [rsp + 0xb4], rax
1402d1535 mov eax, dword ptr [rip + 0x5bfe39d]
1402d153b mov dword ptr [rsp + 0xcc], eax
1402d1542 movups xmmword ptr [rsp + 0xbc], xmm6
1402d154a movsd qword ptr [rsp + 0xd0], xmm7
1402d1553 mov qword ptr [rsp + 0x50], rbp
1402d1558 lea rcx, [rsp + 0x110]
1402d1560 lea r8, [rsp + 0x50]
1402d1565 mov rdx, r13
1402d1568 call 0x14026c310
1402d156d mov rax, rsi
1402d1570 movaps xmm6, xmmword ptr [rsp + 0x140]
1402d1578 movaps xmm7, xmmword ptr [rsp + 0x150]
1402d1580 add rsp, 0x168
1402d1587 pop rbx
1402d1588 pop rbp
1402d1589 pop rdi
1402d158a pop rsi
1402d158b pop r12
1402d158d pop r13
1402d158f pop r14
1402d1591 pop r15
1402d1593 ret
1402d1594 ud2
1402d1596 mov rcx, r13
1402d1599 mov rdx, r14
1402d159c call 0x145e9bd8b
1402d15a1 ud2
