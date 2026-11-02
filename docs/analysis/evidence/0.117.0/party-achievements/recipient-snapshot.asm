145b16870 4156 push r14
145b16872 56 push rsi
145b16873 57 push rdi
145b16874 53 push rbx
145b16875 4881ecb8010000 sub rsp, 0x1b8
145b1687c 4889d7 mov rdi, rdx
145b1687f 4889ce mov rsi, rcx
145b16882 488d4c2420 lea rcx, [rsp + 0x20]
145b16887 e854e4ffff call 0x145b14ce0
145b1688c 48837c2420ff cmp qword ptr [rsp + 0x20], -1
145b16892 0f8440020000 je 0x145b16ad8
145b16898 488d8c24f0000000 lea rcx, [rsp + 0xf0]
145b168a0 488d542420 lea rdx, [rsp + 0x20]
145b168a5 41b8c8000000 mov r8d, 0xc8
145b168ab e82bd44700 call 0x145f93cdb
145b168b0 4881bfb0170000ffffff00 cmp qword ptr [rdi + 0x17b0], 0xffffff
145b168bb 0f8401020000 je 0x145b16ac2
145b168c1 837f1002 cmp dword ptr [rdi + 0x10], 2
145b168c5 740d je 0x145b168d4
145b168c7 80bf900c000000 cmp byte ptr [rdi + 0xc90], 0
145b168ce 0f85ee010000 jne 0x145b16ac2
145b168d4 0fb68424af010000 movzx eax, byte ptr [rsp + 0x1af]
145b168dc fec8 dec al
145b168de 3c04 cmp al, 4
145b168e0 0f87dc010000 ja 0x145b16ac2
145b168e6 488bbc24f8000000 mov rdi, qword ptr [rsp + 0xf8]
145b168ee 488b942400010000 mov rdx, qword ptr [rsp + 0x100]
145b168f6 4889f9 mov rcx, rdi
145b168f9 e83242f6ff call 0x145a7ab30
145b168fe 4869c0f0000000 imul rax, rax, 0xf0
145b16905 488d1504477801 lea rdx, [rip + 0x1784704]
145b1690c 488b4c1008 mov rcx, qword ptr [rax + rdx + 8]
145b16911 488b541010 mov rdx, qword ptr [rax + rdx + 0x10]
145b16916 e81542f6ff call 0x145a7ab30
145b1691b 8b8c2490010000 mov ecx, dword ptr [rsp + 0x190]
145b16922 f3480f2ac9 cvtsi2ss xmm1, rcx
145b16927 f30f5e8c24a4010000 divss xmm1, dword ptr [rsp + 0x1a4]
145b16930 f3480f2cc9 cvttss2si rcx, xmm1
145b16935 4531c0 xor r8d, r8d
145b16938 0f57c0 xorps xmm0, xmm0
145b1693b 0f2ec8 ucomiss xmm1, xmm0
145b1693e 440f43c1 cmovae r8d, ecx
145b16942 f30f10842488010000 movss xmm0, dword ptr [rsp + 0x188]
145b1694b 0f2e0d42a86600 ucomiss xmm1, dword ptr [rip + 0x66a842]
145b16952 baffffffff mov edx, 0xffffffff
145b16957 410f46d0 cmovbe edx, r8d
145b1695b 0fb78c24ad010000 movzx ecx, word ptr [rsp + 0x1ad]
145b16963 448b842498010000 mov r8d, dword ptr [rsp + 0x198]
145b1696b 448b8c24a0010000 mov r9d, dword ptr [rsp + 0x1a0]
145b16973 f30f108c24a8010000 movss xmm1, dword ptr [rsp + 0x1a8]
145b1697c 0f2e0dbd377c01 ucomiss xmm1, dword ptr [rip + 0x17c37bd]
145b16983 0f108c2408010000 movups xmm1, xmmword ptr [rsp + 0x108]
145b1698b 0f294c2420 movaps xmmword ptr [rsp + 0x20], xmm1
145b16990 4c8b942418010000 mov r10, qword ptr [rsp + 0x118]
145b16998 4c89542430 mov qword ptr [rsp + 0x30], r10
145b1699d 0f108c2420010000 movups xmm1, xmmword ptr [rsp + 0x120]
145b169a5 0f114c2438 movups xmmword ptr [rsp + 0x38], xmm1
145b169aa 4c8b942430010000 mov r10, qword ptr [rsp + 0x130]
145b169b2 4c89542448 mov qword ptr [rsp + 0x48], r10
145b169b7 0f108c2438010000 movups xmm1, xmmword ptr [rsp + 0x138]
145b169bf 0f294c2450 movaps xmmword ptr [rsp + 0x50], xmm1
145b169c4 4c8b942448010000 mov r10, qword ptr [rsp + 0x148]
145b169cc 4c89542460 mov qword ptr [rsp + 0x60], r10
145b169d1 4c8b942480010000 mov r10, qword ptr [rsp + 0x180]
145b169d9 4c89942498000000 mov qword ptr [rsp + 0x98], r10
145b169e1 0f108c2450010000 movups xmm1, xmmword ptr [rsp + 0x150]
145b169e9 0f10942460010000 movups xmm2, xmmword ptr [rsp + 0x160]
145b169f1 0f109c2470010000 movups xmm3, xmmword ptr [rsp + 0x170]
145b169f9 0f119c2488000000 movups xmmword ptr [rsp + 0x88], xmm3
145b16a01 0f11542478 movups xmmword ptr [rsp + 0x78], xmm2
145b16a06 0f114c2468 movups xmmword ptr [rsp + 0x68], xmm1
145b16a0b 0f284c2420 movaps xmm1, xmmword ptr [rsp + 0x20]
145b16a10 4c8b542430 mov r10, qword ptr [rsp + 0x30]
145b16a15 4c8b5c2438 mov r11, qword ptr [rsp + 0x38]
145b16a1a 488b5c2440 mov rbx, qword ptr [rsp + 0x40]
145b16a1f 4c8b742448 mov r14, qword ptr [rsp + 0x48]
145b16a24 0f28542450 movaps xmm2, xmmword ptr [rsp + 0x50]
145b16a29 0f115630 movups xmmword ptr [rsi + 0x30], xmm2
145b16a2d 48895e20 mov qword ptr [rsi + 0x20], rbx
145b16a31 4c897628 mov qword ptr [rsi + 0x28], r14
145b16a35 4c895610 mov qword ptr [rsi + 0x10], r10
145b16a39 4c895e18 mov qword ptr [rsi + 0x18], r11
145b16a3d 0f110e movups xmmword ptr [rsi], xmm1
145b16a40 0f288c2490000000 movaps xmm1, xmmword ptr [rsp + 0x90]
145b16a48 0f114e70 movups xmmword ptr [rsi + 0x70], xmm1
145b16a4c 0f288c2480000000 movaps xmm1, xmmword ptr [rsp + 0x80]
145b16a54 0f114e60 movups xmmword ptr [rsi + 0x60], xmm1
145b16a58 0f284c2470 movaps xmm1, xmmword ptr [rsp + 0x70]
145b16a5d 0f114e50 movups xmmword ptr [rsi + 0x50], xmm1
145b16a61 0f284c2460 movaps xmm1, xmmword ptr [rsp + 0x60]
145b16a66 0f114e40 movups xmmword ptr [rsi + 0x40], xmm1
145b16a6a 48898680000000 mov qword ptr [rsi + 0x80], rax
145b16a71 f30f118688000000 movss dword ptr [rsi + 0x88], xmm0
145b16a79 89968c000000 mov dword ptr [rsi + 0x8c], edx
145b16a7f 44898690000000 mov dword ptr [rsi + 0x90], r8d
145b16a86 44898e94000000 mov dword ptr [rsi + 0x94], r9d
145b16a8d 66898e98000000 mov word ptr [rsi + 0x98], cx
145b16a94 0f93869a000000 setae byte ptr [rsi + 0x9a]
145b16a9b 488b9424f0000000 mov rdx, qword ptr [rsp + 0xf0]
145b16aa3 4885d2 test rdx, rdx
145b16aa6 7437 je 0x145b16adf
145b16aa8 41b801000000 mov r8d, 1
145b16aae 4889f9 mov rcx, rdi
145b16ab1 4881c4b8010000 add rsp, 0x1b8
145b16ab8 5b pop rbx
145b16ab9 5f pop rdi
145b16aba 5e pop rsi
145b16abb 415e pop r14
145b16abd e90eb74efa jmp 0x1400021d0
145b16ac2 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
145b16ac9 488d8c24f0000000 lea rcx, [rsp + 0xf0]
145b16ad1 e84a00f9ff call 0x145aa6b20
145b16ad6 eb07 jmp 0x145b16adf
145b16ad8 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
145b16adf 4881c4b8010000 add rsp, 0x1b8
145b16ae6 5b pop rbx
145b16ae7 5f pop rdi
145b16ae8 5e pop rsi
145b16ae9 415e pop r14
145b16aeb c3 ret
