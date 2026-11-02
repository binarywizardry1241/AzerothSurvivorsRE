; Current0.117.0 [0x145ab6656,0x145ab6678) SHA-256 3eb825dd786bc3906fbc6600f64a28530a618894a28288f234c42420f206819e
145ab6656  4889ce                   mov rsi, rcx
145ab6659  8d826fa0feff             lea eax, [rdx - 0x15f91]
145ab665f  83f871                   cmp eax, 0x71
145ab6662  0f87fc030000             ja 0x145ab6a64
145ab6668  488d0d81798101           lea rcx, [rip + 0x1817981]
145ab666f  48630481                 movsxd rax, dword ptr [rcx + rax*4]
145ab6673  4801c8                   add rax, rcx
145ab6676  ffe0                     jmp rax
; Current0.117.0 [0x145ab6a64,0x145ab6a89) SHA-256 4c6e98180fd93d09fec46ffce90e677680cc884b92398d1f9d553700569853fe
145ab6a64  8d42ff                   lea eax, [rdx - 1]
145ab6a67  3d9f860100               cmp eax, 0x1869f
145ab6a6c  730a                     jae 0x145ab6a78
145ab6a6e  4889f1                   mov rcx, rsi
145ab6a71  e86af1ffff               call 0x145ab5be0
145ab6a76  ebd5                     jmp 0x145ab6a4d
145ab6a78  81faa0860100             cmp edx, 0x186a0
145ab6a7e  7309                     jae 0x145ab6a89
145ab6a80  48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
145ab6a87  ebc4                     jmp 0x145ab6a4d
