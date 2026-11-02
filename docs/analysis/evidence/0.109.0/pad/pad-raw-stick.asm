144586b90: 56 push rsi
144586b91: 4883ec30 sub rsp, 0x30
144586b95: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
144586b9a: 4889ce mov rsi, rcx
144586b9d: 4883c660 add rsi, 0x60
144586ba1: 4889f1 mov rcx, rsi
144586ba4: 31d2 xor edx, edx
144586ba6: e835e00c00 call 0x144654be0
144586bab: 0f28f0 movaps xmm6, xmm0
144586bae: a801 test al, 1
144586bb0: 7503 jne 0x144586bb5
144586bb2: 0f57f6 xorps xmm6, xmm6
144586bb5: 4889f1 mov rcx, rsi
144586bb8: ba00010000 mov edx, 0x100
144586bbd: e81ee00c00 call 0x144654be0
144586bc2: 0f28c8 movaps xmm1, xmm0
144586bc5: a801 test al, 1
144586bc7: 7503 jne 0x144586bcc
144586bc9: 0f57c9 xorps xmm1, xmm1
144586bcc: 0f28c6 movaps xmm0, xmm6
144586bcf: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
144586bd4: 4883c430 add rsp, 0x30
144586bd8: 5e pop rsi
144586bd9: c3 ret
