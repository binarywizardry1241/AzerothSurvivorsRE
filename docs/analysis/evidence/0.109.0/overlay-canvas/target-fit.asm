140190c4a: mov rdx, qword ptr [rsp + 0x98]
140190c52: lea rax, [rdx + 0xc8]
140190c59: lea rcx, [rdx + 0xbc]
140190c60: cmp byte ptr [rdx + 0xb8], 0
140190c67: cmovne rax, rcx
140190c6b: mov ecx, dword ptr [rdx + 0xc4]
140190c71: xorps xmm0, xmm0
140190c74: cvtsi2ss xmm0, rcx
140190c79: mov ecx, dword ptr [rdx + 0xc0]
140190c7f: xorps xmm1, xmm1
140190c82: cvtsi2ss xmm1, rcx
140190c87: movss xmm2, dword ptr [rax]
140190c8b: divss xmm1, xmm2
140190c8f: divss xmm1, dword ptr [r11]
140190c94: divss xmm0, xmm2
140190c98: divss xmm0, dword ptr [r11 + 4]
140190c9e: movaps xmm2, xmm1
140190ca1: minss xmm2, xmm0
140190ca5: movaps xmm0, xmm2
140190ca8: cmpunordss xmm0, xmm2
140190cad: movaps xmm3, xmm0
140190cb0: andnps xmm3, xmm2
140190cb3: andps xmm0, xmm1
140190cb6: orps xmm0, xmm3
140190cb9: movss xmm1, dword ptr [r11 + 8]
140190cbf: movaps xmm2, xmm0
140190cc2: minss xmm2, xmm1
140190cc6: movaps xmm10, xmm2
140190cca: cmpunordss xmm10, xmm2
140190cd0: andps xmm0, xmm10
140190cd4: andnps xmm10, xmm2
140190cd8: orps xmm10, xmm0
140190cdc: maxss xmm10, xmm9
