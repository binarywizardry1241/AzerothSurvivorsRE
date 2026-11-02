140213f51 0f101d88eacd05 movups xmm3, xmmword ptr [rip + 0x5cdea88]
140213f58 0f295c2470 movaps xmmword ptr [rsp + 0x70], xmm3
140213f5d 48c784248000000000000000 mov qword ptr [rsp + 0x80], 0
140213f69 0f102588eacd05 movups xmm4, xmmword ptr [rip + 0x5cdea88]
140213f70 0f11a42488000000 movups xmmword ptr [rsp + 0x88], xmm4
140213f78 48c784249800000000000000 mov qword ptr [rsp + 0x98], 0
140213f84 0f102585eacd05 movups xmm4, xmmword ptr [rip + 0x5cdea85]
140213f8b 0f29a424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm4
140213f93 48c78424b000000000000000 mov qword ptr [rsp + 0xb0], 0
140213f9f 0f102d82eacd05 movups xmm5, xmmword ptr [rip + 0x5cdea82]
140213fa6 0f11ac24b8000000 movups xmmword ptr [rsp + 0xb8], xmm5
140213fae 48c78424c800000000000000 mov qword ptr [rsp + 0xc8], 0
140213fba 0f299c2420020000 movaps xmmword ptr [rsp + 0x220], xmm3
140213fc2 0f29a42450020000 movaps xmmword ptr [rsp + 0x250], xmm4
140213fca 488b842480000000 mov rax, qword ptr [rsp + 0x80]
140213fd2 4889842430020000 mov qword ptr [rsp + 0x230], rax
140213fda 488b842488000000 mov rax, qword ptr [rsp + 0x88]
140213fe2 4889842438020000 mov qword ptr [rsp + 0x238], rax
140213fea 488b842490000000 mov rax, qword ptr [rsp + 0x90]
140213ff2 4889842440020000 mov qword ptr [rsp + 0x240], rax
140213ffa 488b842498000000 mov rax, qword ptr [rsp + 0x98]
140214002 4889842448020000 mov qword ptr [rsp + 0x248], rax
14021400a 488b8424b0000000 mov rax, qword ptr [rsp + 0xb0]
140214012 4889842460020000 mov qword ptr [rsp + 0x260], rax
14021401a 488b8424b8000000 mov rax, qword ptr [rsp + 0xb8]
140214022 4889842468020000 mov qword ptr [rsp + 0x268], rax
14021402a 0f289c24c0000000 movaps xmm3, xmmword ptr [rsp + 0xc0]
140214032 0f299c2470020000 movaps xmmword ptr [rsp + 0x270], xmm3
14021403a 48c784248002000000000000 mov qword ptr [rsp + 0x280], 0
140214046 c784248802000001000000 mov dword ptr [rsp + 0x288], 1
140214051 f30f118c248c020000 movss dword ptr [rsp + 0x28c], xmm1
14021405a 48c784249002000000000000 mov qword ptr [rsp + 0x290], 0
140214066 c784249802000001000000 mov dword ptr [rsp + 0x298], 1
140214071 f30f1194249c020000 movss dword ptr [rsp + 0x29c], xmm2
14021407a 0f280defddcd05 movaps xmm1, xmmword ptr [rip + 0x5cdddef]
140214081 0f298c24a0020000 movaps xmmword ptr [rsp + 0x2a0], xmm1
140214089 48b8010000000000f841 movabs rax, 0x41f8000000000001
140214093 48898424b0020000 mov qword ptr [rsp + 0x2b0], rax
14021409b 0f57c9 xorps xmm1, xmm1
14021409e 0f118c24c8020000 movups xmmword ptr [rsp + 0x2c8], xmm1
1402140a6 0f118c24b8020000 movups xmmword ptr [rsp + 0x2b8], xmm1
1402140ae 0f100df3e9cd05 movups xmm1, xmmword ptr [rip + 0x5cde9f3]
1402140b5 0f118c24e8020000 movups xmmword ptr [rsp + 0x2e8], xmm1
1402140bd 0f100dd4e9cd05 movups xmm1, xmmword ptr [rip + 0x5cde9d4]
1402140c4 0f118c24d8020000 movups xmmword ptr [rsp + 0x2d8], xmm1
1402140cc 0f100df5e9cd05 movups xmm1, xmmword ptr [rip + 0x5cde9f5]
1402140d3 0f118c2408030000 movups xmmword ptr [rsp + 0x308], xmm1
1402140db 0f100dd6e9cd05 movups xmm1, xmmword ptr [rip + 0x5cde9d6]
1402140e2 0f118c24f8020000 movups xmmword ptr [rsp + 0x2f8], xmm1
1402140ea 0f100df7e9cd05 movups xmm1, xmmword ptr [rip + 0x5cde9f7]
1402140f1 0f118c2428030000 movups xmmword ptr [rsp + 0x328], xmm1
1402140f9 0f100dd8e9cd05 movups xmm1, xmmword ptr [rip + 0x5cde9d8]
140214100 0f118c2418030000 movups xmmword ptr [rsp + 0x318], xmm1
140214108 0f100d61eacd05 movups xmm1, xmmword ptr [rip + 0x5cdea61]
14021410f 0f118c2448030000 movups xmmword ptr [rsp + 0x348], xmm1
140214117 0f100d42eacd05 movups xmm1, xmmword ptr [rip + 0x5cdea42]
14021411e 0f118c2438030000 movups xmmword ptr [rsp + 0x338], xmm1
140214126 0f280d03dfc805 movaps xmm1, xmmword ptr [rip + 0x5c8df03]
14021412d 0f118c2458030000 movups xmmword ptr [rsp + 0x358], xmm1
140214135 c784246803000001000000 mov dword ptr [rsp + 0x368], 1
140214140 48c784246c03000000000000 mov qword ptr [rsp + 0x36c], 0
14021414c c684247403000001 mov byte ptr [rsp + 0x374], 1
140214154 48c784247803000000000000 mov qword ptr [rsp + 0x378], 0
140214160 c78424800300000000803f mov dword ptr [rsp + 0x380], 0x3f800000
14021416b 66c78424840300000000 mov word ptr [rsp + 0x384], 0
140214175 66c784248a0300000000 mov word ptr [rsp + 0x38a], 0
14021417f c784248603000000000100 mov dword ptr [rsp + 0x386], 0x10000
14021418a 66c78424900300000000 mov word ptr [rsp + 0x390], 0
140214194 c784248c03000000000100 mov dword ptr [rsp + 0x38c], 0x10000
14021419f 66c78424920300000001 mov word ptr [rsp + 0x392], 0x100
1402141a9 66c784249c0300000000 mov word ptr [rsp + 0x39c], 0
1402141b3 48c784249403000000000000 mov qword ptr [rsp + 0x394], 0
1402141bf 0f100dbae9cd05 movups xmm1, xmmword ptr [rip + 0x5cde9ba]
1402141c6 0f298c24a0030000 movaps xmmword ptr [rsp + 0x3a0], xmm1
1402141ce f30f118424b0030000 movss dword ptr [rsp + 0x3b0], xmm0
1402141d7 f30f118424b4030000 movss dword ptr [rsp + 0x3b4], xmm0
1402141e0 f30f10059cdec805 movss xmm0, dword ptr [rip + 0x5c8de9c]
1402141e8 0f138424b8030000 movlps qword ptr [rsp + 0x3b8], xmm0
1402141f0 c78424c0030000dc0f0000 mov dword ptr [rsp + 0x3c0], 0xfdc
1402141fb 66c78424c40300000200 mov word ptr [rsp + 0x3c4], 2
140214205 4c8d0d94e9cd05 lea r9, [rip + 0x5cde994]
14021420c 488d742470 lea rsi, [rsp + 0x70]
140214211 488d9424d0000000 lea rdx, [rsp + 0xd0]
140214219 4c8d842420020000 lea r8, [rsp + 0x220]
140214221 4889f1 mov rcx, rsi
140214224 e847780600 call 0x14027ba70
140214229 488d44242f lea rax, [rsp + 0x2f]
14021422e 4889842420020000 mov qword ptr [rsp + 0x220], rax
140214236 488b442440 mov rax, qword ptr [rsp + 0x40]
14021423b 4889842428020000 mov qword ptr [rsp + 0x228], rax
140214243 4889bc2430020000 mov qword ptr [rsp + 0x230], rdi
14021424b 488d942420020000 lea rdx, [rsp + 0x220]
140214253 4889f1 mov rcx, rsi
140214256 e895e10900 call 0x1402b23f0
