145b205a0 4156 push r14
145b205a2 56 push rsi
145b205a3 57 push rdi
145b205a4 53 push rbx
145b205a5 4881ecb8010000 sub rsp, 0x1b8
145b205ac 4889d7 mov rdi, rdx
145b205af 4889ce mov rsi, rcx
145b205b2 488d4c2420 lea rcx, [rsp + 0x20]
145b205b7 e844e4ffff call 0x145b1ea00
145b205bc 48837c2420ff cmp qword ptr [rsp + 0x20], -1
145b205c2 0f8440020000 je 0x145b20808
145b205c8 488d8c24f0000000 lea rcx, [rsp + 0xf0]
145b205d0 488d542420 lea rdx, [rsp + 0x20]
145b205d5 41b8c8000000 mov r8d, 0xc8
145b205db e84ba84800 call 0x145faae2b
145b205e0 4881bfe0170000ffffff00 cmp qword ptr [rdi + 0x17e0], 0xffffff
145b205eb 0f8401020000 je 0x145b207f2
145b205f1 837f1002 cmp dword ptr [rdi + 0x10], 2
145b205f5 740d je 0x145b20604
145b205f7 80bfa80c000000 cmp byte ptr [rdi + 0xca8], 0
145b205fe 0f85ee010000 jne 0x145b207f2
145b20604 0fb68424af010000 movzx eax, byte ptr [rsp + 0x1af]
145b2060c fec8 dec al
145b2060e 3c04 cmp al, 4
145b20610 0f87dc010000 ja 0x145b207f2
145b20616 488bbc24f8000000 mov rdi, qword ptr [rsp + 0xf8]
145b2061e 488b942400010000 mov rdx, qword ptr [rsp + 0x100]
145b20626 4889f9 mov rcx, rdi
145b20629 e86248f6ff call 0x145a84e90
145b2062e 4869c0f0000000 imul rax, rax, 0xf0
145b20635 488d158c327901 lea rdx, [rip + 0x179328c]
145b2063c 488b4c1008 mov rcx, qword ptr [rax + rdx + 8]
145b20641 488b541010 mov rdx, qword ptr [rax + rdx + 0x10]
145b20646 e84548f6ff call 0x145a84e90
145b2064b 8b8c2490010000 mov ecx, dword ptr [rsp + 0x190]
145b20652 f3480f2ac9 cvtsi2ss xmm1, rcx
145b20657 f30f5e8c24a4010000 divss xmm1, dword ptr [rsp + 0x1a4]
145b20660 f3480f2cc9 cvttss2si rcx, xmm1
145b20665 4531c0 xor r8d, r8d
145b20668 0f57c0 xorps xmm0, xmm0
145b2066b 0f2ec8 ucomiss xmm1, xmm0
145b2066e 440f43c1 cmovae r8d, ecx
145b20672 f30f10842488010000 movss xmm0, dword ptr [rsp + 0x188]
145b2067b 0f2e0d62be6700 ucomiss xmm1, dword ptr [rip + 0x67be62]
145b20682 baffffffff mov edx, 0xffffffff
145b20687 410f46d0 cmovbe edx, r8d
145b2068b 0fb78c24ad010000 movzx ecx, word ptr [rsp + 0x1ad]
145b20693 448b842498010000 mov r8d, dword ptr [rsp + 0x198]
145b2069b 448b8c24a0010000 mov r9d, dword ptr [rsp + 0x1a0]
145b206a3 f30f108c24a8010000 movss xmm1, dword ptr [rsp + 0x1a8]
145b206ac 0f2e0d65e67c01 ucomiss xmm1, dword ptr [rip + 0x17ce665]
145b206b3 0f108c2408010000 movups xmm1, xmmword ptr [rsp + 0x108]
145b206bb 0f294c2420 movaps xmmword ptr [rsp + 0x20], xmm1
145b206c0 4c8b942418010000 mov r10, qword ptr [rsp + 0x118]
145b206c8 4c89542430 mov qword ptr [rsp + 0x30], r10
145b206cd 0f108c2420010000 movups xmm1, xmmword ptr [rsp + 0x120]
145b206d5 0f114c2438 movups xmmword ptr [rsp + 0x38], xmm1
145b206da 4c8b942430010000 mov r10, qword ptr [rsp + 0x130]
145b206e2 4c89542448 mov qword ptr [rsp + 0x48], r10
145b206e7 0f108c2438010000 movups xmm1, xmmword ptr [rsp + 0x138]
145b206ef 0f294c2450 movaps xmmword ptr [rsp + 0x50], xmm1
145b206f4 4c8b942448010000 mov r10, qword ptr [rsp + 0x148]
145b206fc 4c89542460 mov qword ptr [rsp + 0x60], r10
145b20701 4c8b942480010000 mov r10, qword ptr [rsp + 0x180]
145b20709 4c89942498000000 mov qword ptr [rsp + 0x98], r10
145b20711 0f108c2450010000 movups xmm1, xmmword ptr [rsp + 0x150]
145b20719 0f10942460010000 movups xmm2, xmmword ptr [rsp + 0x160]
145b20721 0f109c2470010000 movups xmm3, xmmword ptr [rsp + 0x170]
145b20729 0f119c2488000000 movups xmmword ptr [rsp + 0x88], xmm3
145b20731 0f11542478 movups xmmword ptr [rsp + 0x78], xmm2
145b20736 0f114c2468 movups xmmword ptr [rsp + 0x68], xmm1
145b2073b 0f284c2420 movaps xmm1, xmmword ptr [rsp + 0x20]
145b20740 4c8b542430 mov r10, qword ptr [rsp + 0x30]
145b20745 4c8b5c2438 mov r11, qword ptr [rsp + 0x38]
145b2074a 488b5c2440 mov rbx, qword ptr [rsp + 0x40]
145b2074f 4c8b742448 mov r14, qword ptr [rsp + 0x48]
145b20754 0f28542450 movaps xmm2, xmmword ptr [rsp + 0x50]
145b20759 0f115630 movups xmmword ptr [rsi + 0x30], xmm2
145b2075d 48895e20 mov qword ptr [rsi + 0x20], rbx
145b20761 4c897628 mov qword ptr [rsi + 0x28], r14
145b20765 4c895610 mov qword ptr [rsi + 0x10], r10
145b20769 4c895e18 mov qword ptr [rsi + 0x18], r11
145b2076d 0f110e movups xmmword ptr [rsi], xmm1
145b20770 0f288c2490000000 movaps xmm1, xmmword ptr [rsp + 0x90]
145b20778 0f114e70 movups xmmword ptr [rsi + 0x70], xmm1
145b2077c 0f288c2480000000 movaps xmm1, xmmword ptr [rsp + 0x80]
145b20784 0f114e60 movups xmmword ptr [rsi + 0x60], xmm1
145b20788 0f284c2470 movaps xmm1, xmmword ptr [rsp + 0x70]
145b2078d 0f114e50 movups xmmword ptr [rsi + 0x50], xmm1
145b20791 0f284c2460 movaps xmm1, xmmword ptr [rsp + 0x60]
145b20796 0f114e40 movups xmmword ptr [rsi + 0x40], xmm1
145b2079a 48898680000000 mov qword ptr [rsi + 0x80], rax
145b207a1 f30f118688000000 movss dword ptr [rsi + 0x88], xmm0
145b207a9 89968c000000 mov dword ptr [rsi + 0x8c], edx
145b207af 44898690000000 mov dword ptr [rsi + 0x90], r8d
145b207b6 44898e94000000 mov dword ptr [rsi + 0x94], r9d
145b207bd 66898e98000000 mov word ptr [rsi + 0x98], cx
145b207c4 0f93869a000000 setae byte ptr [rsi + 0x9a]
145b207cb 488b9424f0000000 mov rdx, qword ptr [rsp + 0xf0]
145b207d3 4885d2 test rdx, rdx
145b207d6 7437 je 0x145b2080f
145b207d8 41b801000000 mov r8d, 1
145b207de 4889f9 mov rcx, rdi
145b207e1 4881c4b8010000 add rsp, 0x1b8
145b207e8 5b pop rbx
145b207e9 5f pop rdi
145b207ea 5e pop rsi
145b207eb 415e pop r14
145b207ed e9de194efa jmp 0x1400021d0
145b207f2 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
145b207f9 488d8c24f0000000 lea rcx, [rsp + 0xf0]
145b20801 e85ad5f7ff call 0x145a9dd60
145b20806 eb07 jmp 0x145b2080f
145b20808 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
145b2080f 4881c4b8010000 add rsp, 0x1b8
145b20816 5b pop rbx
145b20817 5f pop rdi
145b20818 5e pop rsi
145b20819 415e pop r14
145b2081b c3 ret 
