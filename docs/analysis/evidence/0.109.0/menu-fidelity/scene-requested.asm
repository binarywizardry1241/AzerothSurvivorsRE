140811b40: push      rsi
140811b41: sub       rsp, 0x20
140811b45: mov       eax, dword ptr [rip + 0x78326bd]
140811b4b: test      eax, eax
140811b4d: jne       0x140811b9a
140811b4f: mov       cl, 1
140811b51: xor       eax, eax
140811b53: lock cmpxchg byte ptr [rip + 0x783267d], cl
140811b5b: jne       0x140811bb4
140811b5d: mov       rsi, qword ptr [rip + 0x7878e84]
140811b64: mov       rax, qword ptr [rsi]
140811b67: shl       rax, 1
140811b6a: test      rax, rax
140811b6d: jne       0x140811bc2
140811b6f: movzx     eax, byte ptr [rip + 0x7832663]
140811b76: mov       eax, dword ptr [rip + 0x7832660]
140811b7c: mov       rcx, qword ptr [rsi]
140811b7f: shl       rcx, 1
140811b82: test      rcx, rcx
140811b85: jne       0x140811bf2
140811b87: xor       ecx, ecx
140811b89: xchg      byte ptr [rip + 0x7832649], cl
140811b8f: cmp       cl, 2
140811b92: je        0x140811bdc
140811b94: add       rsp, 0x20
140811b98: pop       rsi
140811b99: ret
140811b9a: lea       rcx, [rip + 0x7832637]
140811ba1: call      0x145c273e2
140811ba6: mov       cl, 1
140811ba8: xor       eax, eax
140811baa: lock cmpxchg byte ptr [rip + 0x7832626], cl
140811bb2: je        0x140811b5d
140811bb4: lea       rcx, [rip + 0x783261d]
140811bbb: call      0x145d97960
140811bc0: jmp       0x140811b5d
140811bc2: call      0x145d986f0
140811bc7: mov       ecx, eax
140811bc9: movzx     eax, byte ptr [rip + 0x7832609]
140811bd0: mov       eax, dword ptr [rip + 0x7832606]
140811bd6: test      cl, cl
140811bd8: jne       0x140811b7c
140811bda: jmp       0x140811b87
140811bdc: lea       rcx, [rip + 0x78325f5]
140811be3: mov       esi, eax
140811be5: call      0x145d97a20
140811bea: mov       eax, esi
140811bec: add       rsp, 0x20
140811bf0: pop       rsi
140811bf1: ret
140811bf2: mov       esi, eax
140811bf4: call      0x145d986f0
140811bf9: test      al, al
140811bfb: jne       0x140811c04
140811bfd: mov       byte ptr [rip + 0x78325d5], 1
140811c04: mov       eax, esi
140811c06: jmp       0x140811b87
