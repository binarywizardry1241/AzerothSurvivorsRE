; Current0.117.0 [0x145ab5be0,0x145ab6144) SHA-256 1e8b9b694f67ea78ed9381fb76bc7649b2187f69993dd2934200d4b3420c0a04
145ab5be0  55                       push rbp
145ab5be1  4157                     push r15
145ab5be3  4156                     push r14
145ab5be5  4155                     push r13
145ab5be7  4154                     push r12
145ab5be9  56                       push rsi
145ab5bea  57                       push rdi
145ab5beb  53                       push rbx
145ab5bec  4883ec68                 sub rsp, 0x68
145ab5bf0  488d6c2460               lea rbp, [rsp + 0x60]
145ab5bf5  48c74500feffffff         mov qword ptr [rbp], 0xfffffffffffffffe
145ab5bfd  4189d4                   mov r12d, edx
145ab5c00  4889ce                   mov rsi, rcx
145ab5c03  81fa38080000             cmp edx, 0x838
145ab5c09  7f39                     jg 0x145ab5c44
145ab5c0b  4181fc72050000           cmp r12d, 0x572
145ab5c12  0f8fd1000000             jg 0x145ab5ce9
145ab5c18  418d4424e7               lea eax, [r12 - 0x19]
145ab5c1d  3d81000000               cmp eax, 0x81
145ab5c22  0f87e0020000             ja 0x145ab5f08
145ab5c28  488d0df5808101           lea rcx, [rip + 0x18180f5]
145ab5c2f  48630481                 movsxd rax, dword ptr [rcx + rax*4]
145ab5c33  4801c8                   add rax, rcx
145ab5c36  ffe0                     jmp rax
145ab5c38  4c8d2d79238101           lea r13, [rip + 0x1812379]
145ab5c3f  e9c1030000               jmp 0x145ab6005
145ab5c44  4181fc4c0e0000           cmp r12d, 0xe4c
145ab5c4b  7e2d                     jle 0x145ab5c7a
145ab5c4d  418d842430e8ffff         lea eax, [r12 - 0x17d0]
145ab5c55  83f830                   cmp eax, 0x30
145ab5c58  0f87e0000000             ja 0x145ab5d3e
145ab5c5e  488d0dc7828101           lea rcx, [rip + 0x18182c7]
145ab5c65  48630481                 movsxd rax, dword ptr [rcx + rax*4]
145ab5c69  4801c8                   add rax, rcx
145ab5c6c  ffe0                     jmp rax
145ab5c6e  4c8d2dab298101           lea r13, [rip + 0x18129ab]
145ab5c75  e98b030000               jmp 0x145ab6005
145ab5c7a  4181fcc7090000           cmp r12d, 0x9c7
145ab5c81  7e33                     jle 0x145ab5cb6
145ab5c83  4181fc820b0000           cmp r12d, 0xb82
145ab5c8a  0f8f8c000000             jg 0x145ab5d1c
145ab5c90  4181fcc8090000           cmp r12d, 0x9c8
145ab5c97  0f84c7000000             je 0x145ab5d64
145ab5c9d  4181fccc090000           cmp r12d, 0x9cc
145ab5ca4  0f855e020000             jne 0x145ab5f08
145ab5caa  4c8d2dcf288101           lea r13, [rip + 0x18128cf]
145ab5cb1  e94f030000               jmp 0x145ab6005
145ab5cb6  4181fc39080000           cmp r12d, 0x839
145ab5cbd  0f84c5000000             je 0x145ab5d88
145ab5cc3  4181fc39090000           cmp r12d, 0x939
145ab5cca  0f84ac000000             je 0x145ab5d7c
145ab5cd0  4181fc3a090000           cmp r12d, 0x93a
145ab5cd7  0f852b020000             jne 0x145ab5f08
145ab5cdd  4c8d2d4c288101           lea r13, [rip + 0x181284c]
145ab5ce4  e91c030000               jmp 0x145ab6005
145ab5ce9  4181fc73050000           cmp r12d, 0x573
145ab5cf0  0f8406020000             je 0x145ab5efc
145ab5cf6  4181fc74050000           cmp r12d, 0x574
145ab5cfd  0f84ed010000             je 0x145ab5ef0
145ab5d03  4181fc2c080000           cmp r12d, 0x82c
145ab5d0a  0f85f8010000             jne 0x145ab5f08
145ab5d10  4c8d2da1278101           lea r13, [rip + 0x18127a1]
145ab5d17  e9e9020000               jmp 0x145ab6005
145ab5d1c  4181fc830b0000           cmp r12d, 0xb83
145ab5d23  744b                     je 0x145ab5d70
145ab5d25  4181fc270c0000           cmp r12d, 0xc27
145ab5d2c  0f85d6010000             jne 0x145ab5f08
145ab5d32  4c8d2d97288101           lea r13, [rip + 0x1812897]
145ab5d39  e9c7020000               jmp 0x145ab6005
145ab5d3e  4181fc4d0e0000           cmp r12d, 0xe4d
145ab5d45  0f84b3020000             je 0x145ab5ffe
145ab5d4b  4181fcfa2f0000           cmp r12d, 0x2ffa
145ab5d52  0f85b0010000             jne 0x145ab5f08
145ab5d58  4c8d2d812c8101           lea r13, [rip + 0x1812c81]
145ab5d5f  e9a1020000               jmp 0x145ab6005
145ab5d64  4c8d2ded278101           lea r13, [rip + 0x18127ed]
145ab5d6b  e995020000               jmp 0x145ab6005
145ab5d70  4c8d2d31288101           lea r13, [rip + 0x1812831]
145ab5d77  e989020000               jmp 0x145ab6005
145ab5d7c  4c8d2d85278101           lea r13, [rip + 0x1812785]
145ab5d83  e97d020000               jmp 0x145ab6005
145ab5d88  4c8d2d51278101           lea r13, [rip + 0x1812751]
145ab5d8f  e971020000               jmp 0x145ab6005
145ab5d94  4c8d2d3d258101           lea r13, [rip + 0x181253d]
145ab5d9b  e965020000               jmp 0x145ab6005
145ab5da0  4c8d2df9258101           lea r13, [rip + 0x18125f9]
145ab5da7  e959020000               jmp 0x145ab6005
145ab5dac  4c8d2d75258101           lea r13, [rip + 0x1812575]
145ab5db3  e94d020000               jmp 0x145ab6005
145ab5db8  4c8d2d31268101           lea r13, [rip + 0x1812631]
145ab5dbf  e941020000               jmp 0x145ab6005
145ab5dc4  4c8d2d6d248101           lea r13, [rip + 0x181246d]
145ab5dcb  e935020000               jmp 0x145ab6005
145ab5dd0  4c8d2d09228101           lea r13, [rip + 0x1812209]
145ab5dd7  e929020000               jmp 0x145ab6005
145ab5ddc  4c8d2d9d228101           lea r13, [rip + 0x181229d]
145ab5de3  e91d020000               jmp 0x145ab6005
145ab5de8  4c8d2d69228101           lea r13, [rip + 0x1812269]
145ab5def  e911020000               jmp 0x145ab6005
145ab5df4  4c8d2d0d228101           lea r13, [rip + 0x181220d]
145ab5dfb  e905020000               jmp 0x145ab6005
145ab5e00  4c8d2d81248101           lea r13, [rip + 0x1812481]
145ab5e07  e9f9010000               jmp 0x145ab6005
145ab5e0c  4c8d2d1d228101           lea r13, [rip + 0x181221d]
145ab5e13  e9ed010000               jmp 0x145ab6005
145ab5e18  4c8d2d01238101           lea r13, [rip + 0x1812301]
145ab5e1f  e9e1010000               jmp 0x145ab6005
145ab5e24  4c8d2da5228101           lea r13, [rip + 0x18122a5]
145ab5e2b  e9d5010000               jmp 0x145ab6005
145ab5e30  4c8d2d61238101           lea r13, [rip + 0x1812361]
145ab5e37  e9c9010000               jmp 0x145ab6005
145ab5e3c  4c8d2d65228101           lea r13, [rip + 0x1812265]
145ab5e43  e9bd010000               jmp 0x145ab6005
145ab5e48  4c8d2d11248101           lea r13, [rip + 0x1812411]
145ab5e4f  e9b1010000               jmp 0x145ab6005
145ab5e54  4c8d2d55248101           lea r13, [rip + 0x1812455]
145ab5e5b  e9a5010000               jmp 0x145ab6005
145ab5e60  4c8d2d91228101           lea r13, [rip + 0x1812291]
145ab5e67  e999010000               jmp 0x145ab6005
145ab5e6c  4c8d2d4d238101           lea r13, [rip + 0x181234d]
145ab5e73  e98d010000               jmp 0x145ab6005
145ab5e78  4c8d2d69238101           lea r13, [rip + 0x1812369]
145ab5e7f  e981010000               jmp 0x145ab6005
145ab5e84  4c8d2dbd228101           lea r13, [rip + 0x18122bd]
145ab5e8b  e975010000               jmp 0x145ab6005
145ab5e90  4c8d2db9248101           lea r13, [rip + 0x18124b9]
145ab5e97  e969010000               jmp 0x145ab6005
145ab5e9c  4c8d2d75258101           lea r13, [rip + 0x1812575]
145ab5ea3  e95d010000               jmp 0x145ab6005
145ab5ea8  4c8d2d19258101           lea r13, [rip + 0x1812519]
145ab5eaf  e951010000               jmp 0x145ab6005
145ab5eb4  4c8d2d85258101           lea r13, [rip + 0x1812585]
145ab5ebb  e945010000               jmp 0x145ab6005
145ab5ec0  4c8d2da9228101           lea r13, [rip + 0x18122a9]
145ab5ec7  e939010000               jmp 0x145ab6005
145ab5ecc  4c8d2da5248101           lea r13, [rip + 0x18124a5]
145ab5ed3  e92d010000               jmp 0x145ab6005
145ab5ed8  4c8d2d31238101           lea r13, [rip + 0x1812331]
145ab5edf  e921010000               jmp 0x145ab6005
145ab5ee4  4c8d2d15248101           lea r13, [rip + 0x1812415]
145ab5eeb  e915010000               jmp 0x145ab6005
145ab5ef0  4c8d2d99258101           lea r13, [rip + 0x1812599]
145ab5ef7  e909010000               jmp 0x145ab6005
145ab5efc  4c8d2d65258101           lea r13, [rip + 0x1812565]
145ab5f03  e9fd000000               jmp 0x145ab6005
145ab5f08  48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
145ab5f0f  e91f020000               jmp 0x145ab6133
145ab5f14  4c8d2d4d2a8101           lea r13, [rip + 0x1812a4d]
145ab5f1b  e9e5000000               jmp 0x145ab6005
145ab5f20  4c8d2d192a8101           lea r13, [rip + 0x1812a19]
145ab5f27  e9d9000000               jmp 0x145ab6005
145ab5f2c  4c8d2d95298101           lea r13, [rip + 0x1812995]
145ab5f33  e9cd000000               jmp 0x145ab6005
145ab5f38  4c8d2d39298101           lea r13, [rip + 0x1812939]
145ab5f3f  e9c1000000               jmp 0x145ab6005
145ab5f44  4c8d2dc5278101           lea r13, [rip + 0x18127c5]
145ab5f4b  e9b5000000               jmp 0x145ab6005
145ab5f50  4c8d2dc1298101           lea r13, [rip + 0x18129c1]
145ab5f57  e9a9000000               jmp 0x145ab6005
145ab5f5c  4c8d2d5d278101           lea r13, [rip + 0x181275d]
145ab5f63  e99d000000               jmp 0x145ab6005
145ab5f68  4c8d2d31298101           lea r13, [rip + 0x1812931]
145ab5f6f  e991000000               jmp 0x145ab6005
145ab5f74  4c8d2d1d278101           lea r13, [rip + 0x181271d]
145ab5f7b  e985000000               jmp 0x145ab6005
145ab5f80  4c8d2dd9278101           lea r13, [rip + 0x18127d9]
145ab5f87  eb7c                     jmp 0x145ab6005
145ab5f89  4c8d2dc0288101           lea r13, [rip + 0x18128c0]
145ab5f90  eb73                     jmp 0x145ab6005
145ab5f92  4c8d2dd7268101           lea r13, [rip + 0x18126d7]
145ab5f99  eb6a                     jmp 0x145ab6005
145ab5f9b  4c8d2da6268101           lea r13, [rip + 0x18126a6]
145ab5fa2  eb61                     jmp 0x145ab6005
145ab5fa4  4c8d2d8d278101           lea r13, [rip + 0x181278d]
145ab5fab  eb58                     jmp 0x145ab6005
145ab5fad  4c8d2d74288101           lea r13, [rip + 0x1812874]
145ab5fb4  eb4f                     jmp 0x145ab6005
145ab5fb6  4c8d2d1b288101           lea r13, [rip + 0x181281b]
145ab5fbd  eb46                     jmp 0x145ab6005
145ab5fbf  4c8d2d22278101           lea r13, [rip + 0x1812722]
145ab5fc6  eb3d                     jmp 0x145ab6005
145ab5fc8  4c8d2db9278101           lea r13, [rip + 0x18127b9]
145ab5fcf  eb34                     jmp 0x145ab6005
145ab5fd1  4c8d2dd8278101           lea r13, [rip + 0x18127d8]
145ab5fd8  eb2b                     jmp 0x145ab6005
145ab5fda  4c8d2d0f298101           lea r13, [rip + 0x181290f]
145ab5fe1  eb22                     jmp 0x145ab6005
145ab5fe3  4c8d2d16288101           lea r13, [rip + 0x1812816]
145ab5fea  eb19                     jmp 0x145ab6005
145ab5fec  4c8d2d9d298101           lea r13, [rip + 0x181299d]
145ab5ff3  eb10                     jmp 0x145ab6005
145ab5ff5  4c8d2dbc298101           lea r13, [rip + 0x18129bc]
145ab5ffc  eb07                     jmp 0x145ab6005
145ab5ffe  4c8d2df3258101           lea r13, [rip + 0x18125f3]
145ab6005  418b4518                 mov eax, dword ptr [r13 + 0x18]
145ab6009  ffc8                     dec eax
145ab600b  40b711                   mov dil, 0x11
145ab600e  83f817                   cmp eax, 0x17
145ab6011  730d                     jae 0x145ab6020
145ab6013  89c0                     mov eax, eax
145ab6015  488d0d84738101           lea rcx, [rip + 0x1817384]
145ab601c  0fb63c08                 movzx edi, byte ptr [rax + rcx]
145ab6020  498d4510                 lea rax, [r13 + 0x10]
145ab6024  488945c8                 mov qword ptr [rbp - 0x38], rax
145ab6028  488d05b1244c00           lea rax, [rip + 0x4c24b1]
145ab602f  488945d0                 mov qword ptr [rbp - 0x30], rax
145ab6033  488d152c388101           lea rdx, [rip + 0x181382c]
145ab603a  488d4dd8                 lea rcx, [rbp - 0x28]
145ab603e  4c8d45c8                 lea r8, [rbp - 0x38]
145ab6042  e8e9094b00               call 0x145f66a30
145ab6047  488b4de0                 mov rcx, qword ptr [rbp - 0x20]
145ab604b  488b55e8                 mov rdx, qword ptr [rbp - 0x18]
145ab604f  4d8b7500                 mov r14, qword ptr [r13]
145ab6053  4d8b7d08                 mov r15, qword ptr [r13 + 8]
145ab6057  48894df8                 mov qword ptr [rbp - 8], rcx
145ab605b  e8a03b0700               call 0x145b29c00
145ab6060  90                       nop
145ab6061  4889d3                   mov rbx, rdx
145ab6064  4885c0                   test rax, rax
145ab6067  4c0f45f0                 cmovne r14, rax
145ab606b  490f44df                 cmove rbx, r15
145ab606f  4885db                   test rbx, rbx
145ab6072  7911                     jns 0x145ab6085
145ab6074  4531e4                   xor r12d, r12d
145ab6077  4c89e1                   mov rcx, r12
145ab607a  4889da                   mov rdx, rbx
145ab607d  e8394c6800               call 0x14613acbb
145ab6082  90                       nop
145ab6083  0f0b                     ud2
145ab6085  7438                     je 0x145ab60bf
145ab6087  4c8965f0                 mov qword ptr [rbp - 0x10], r12
145ab608b  e870c154fa               call 0x140002200
145ab6090  41bc01000000             mov r12d, 1
145ab6096  ba01000000               mov edx, 1
145ab609b  4889d9                   mov rcx, rbx
145ab609e  e81dc154fa               call 0x1400021c0
145ab60a3  4885c0                   test rax, rax
145ab60a6  74cf                     je 0x145ab6077
145ab60a8  4989c7                   mov r15, rax
145ab60ab  4889c1                   mov rcx, rax
145ab60ae  4c89f2                   mov rdx, r14
145ab60b1  4989d8                   mov r8, rbx
145ab60b4  e822dc4d00               call 0x145f93cdb
145ab60b9  4c8b65f0                 mov r12, qword ptr [rbp - 0x10]
145ab60bd  eb06                     jmp 0x145ab60c5
145ab60bf  41bf01000000             mov r15d, 1
145ab60c5  418b4524                 mov eax, dword ptr [r13 + 0x24]
145ab60c9  48891e                   mov qword ptr [rsi], rbx
145ab60cc  4c897e08                 mov qword ptr [rsi + 8], r15
145ab60d0  48895e10                 mov qword ptr [rsi + 0x10], rbx
145ab60d4  48c7461800000000         mov qword ptr [rsi + 0x18], 0
145ab60dc  48c7462004000000         mov qword ptr [rsi + 0x20], 4
145ab60e4  48c7464800000000         mov qword ptr [rsi + 0x48], 0
145ab60ec  0f57c0                   xorps xmm0, xmm0
145ab60ef  0f114628                 movups xmmword ptr [rsi + 0x28], xmm0
145ab60f3  48c7463800000000         mov qword ptr [rsi + 0x38], 0
145ab60fb  44896650                 mov dword ptr [rsi + 0x50], r12d
145ab60ff  f3410f6f4514             movdqu xmm0, xmmword ptr [r13 + 0x14]
145ab6105  660f70c078               pshufd xmm0, xmm0, 0x78
145ab610a  f30f7f4654               movdqu xmmword ptr [rsi + 0x54], xmm0
145ab610f  894664                   mov dword ptr [rsi + 0x64], eax
145ab6112  40887e68                 mov byte ptr [rsi + 0x68], dil
145ab6116  c6466900                 mov byte ptr [rsi + 0x69], 0
145ab611a  488b55d8                 mov rdx, qword ptr [rbp - 0x28]
145ab611e  4885d2                   test rdx, rdx
145ab6121  7410                     je 0x145ab6133
145ab6123  41b801000000             mov r8d, 1
145ab6129  488b4df8                 mov rcx, qword ptr [rbp - 8]
145ab612d  e89ec054fa               call 0x1400021d0
145ab6132  90                       nop
145ab6133  4883c468                 add rsp, 0x68
145ab6137  5b                       pop rbx
145ab6138  5f                       pop rdi
145ab6139  5e                       pop rsi
145ab613a  415c                     pop r12
145ab613c  415d                     pop r13
145ab613e  415e                     pop r14
145ab6140  415f                     pop r15
145ab6142  5d                       pop rbp
145ab6143  c3                       ret
