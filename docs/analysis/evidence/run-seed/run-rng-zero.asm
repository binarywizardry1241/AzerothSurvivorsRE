0x145a5f7c0: 4157                     push r15
0x145a5f7c2: 4156                     push r14
0x145a5f7c4: 56                       push rsi
0x145a5f7c5: 57                       push rdi
0x145a5f7c6: 53                       push rbx
0x145a5f7c7: 4889c8                   mov rax, rcx
0x145a5f7ca: 48b9157c4a7fb979379e     movabs rcx, 0x9e3779b97f4a7c15
0x145a5f7d4: 4801d1                   add rcx, rdx
0x145a5f7d7: 4989c9                   mov r9, rcx
0x145a5f7da: 49c1e91e                 shr r9, 0x1e
0x145a5f7de: 4931c9                   xor r9, rcx
0x145a5f7e1: 48bfb9e5e41c6d4758bf     movabs rdi, 0xbf58476d1ce4e5b9
0x145a5f7eb: 4c0fafcf                 imul r9, rdi
0x145a5f7ef: 4d89c8                   mov r8, r9
0x145a5f7f2: 49c1e81b                 shr r8, 0x1b
0x145a5f7f6: 4d31c8                   xor r8, r9
0x145a5f7f9: 48bbeb113113bb49d094     movabs rbx, 0x94d049bb133111eb
0x145a5f803: 4c0fafc3                 imul r8, rbx
0x145a5f807: 4c89c1                   mov rcx, r8
0x145a5f80a: 48c1e91f                 shr rcx, 0x1f
0x145a5f80e: 49b92af894fe72f36e3c     movabs r9, 0x3c6ef372fe94f82a
0x145a5f818: 4901d1                   add r9, rdx
0x145a5f81b: 4d89cb                   mov r11, r9
0x145a5f81e: 49c1eb1e                 shr r11, 0x1e
0x145a5f822: 4d31cb                   xor r11, r9
0x145a5f825: 4c0fafdf                 imul r11, rdi
0x145a5f829: 4d89da                   mov r10, r11
0x145a5f82c: 49c1ea1b                 shr r10, 0x1b
0x145a5f830: 4d31da                   xor r10, r11
0x145a5f833: 4c0fafd3                 imul r10, rbx
0x145a5f837: 4d89d1                   mov r9, r10
0x145a5f83a: 49c1e91f                 shr r9, 0x1f
0x145a5f83e: 49bb3f74df7d2c6da6da     movabs r11, 0xdaa66d2c7ddf743f
0x145a5f848: 4901d3                   add r11, rdx
0x145a5f84b: 4d89de                   mov r14, r11
0x145a5f84e: 49c1ee1e                 shr r14, 0x1e
0x145a5f852: 4d31de                   xor r14, r11
0x145a5f855: 4c0faff7                 imul r14, rdi
0x145a5f859: 4c89f6                   mov rsi, r14
0x145a5f85c: 48c1ee1b                 shr rsi, 0x1b
0x145a5f860: 4c31f6                   xor rsi, r14
0x145a5f863: 480faff3                 imul rsi, rbx
0x145a5f867: 4989f3                   mov r11, rsi
0x145a5f86a: 49c1eb1f                 shr r11, 0x1f
0x145a5f86e: 49be54f029fde5e6dd78     movabs r14, 0x78dde6e5fd29f054
0x145a5f878: 4901d6                   add r14, rdx
0x145a5f87b: 4c89f2                   mov rdx, r14
0x145a5f87e: 48c1ea1e                 shr rdx, 0x1e
0x145a5f882: 4c31f2                   xor rdx, r14
0x145a5f885: 480fafd7                 imul rdx, rdi
0x145a5f889: 4889d7                   mov rdi, rdx
0x145a5f88c: 48c1ef1b                 shr rdi, 0x1b
0x145a5f890: 4831d7                   xor rdi, rdx
0x145a5f893: 480faffb                 imul rdi, rbx
0x145a5f897: 4889fa                   mov rdx, rdi
0x145a5f89a: 48c1ea1f                 shr rdx, 0x1f
0x145a5f89e: 4831fa                   xor rdx, rdi
0x145a5f8a1: 48bbffffffffff000000     movabs rbx, 0xffffffffff
0x145a5f8ab: 4d89c6                   mov r14, r8
0x145a5f8ae: 4921de                   and r14, rbx
0x145a5f8b1: 4c39f1                   cmp rcx, r14
0x145a5f8b4: 0f8585000000             jne 0x145a5f93f
0x145a5f8ba: 49be0000000000ff0000     movabs r14, 0xff0000000000
0x145a5f8c4: 4d89c7                   mov r15, r8
0x145a5f8c7: 4d21f7                   and r15, r14
0x145a5f8ca: 7573                     jne 0x145a5f93f
0x145a5f8cc: 4d89c7                   mov r15, r8
0x145a5f8cf: 49c1ef30                 shr r15, 0x30
0x145a5f8d3: 756a                     jne 0x145a5f93f
0x145a5f8d5: 4d89d7                   mov r15, r10
0x145a5f8d8: 4921df                   and r15, rbx
0x145a5f8db: 4d39f9                   cmp r9, r15
0x145a5f8de: 755f                     jne 0x145a5f93f
0x145a5f8e0: 4d89d7                   mov r15, r10
0x145a5f8e3: 4d21f7                   and r15, r14
0x145a5f8e6: 7557                     jne 0x145a5f93f
0x145a5f8e8: 4d89d7                   mov r15, r10
0x145a5f8eb: 49c1ef30                 shr r15, 0x30
0x145a5f8ef: 754e                     jne 0x145a5f93f
0x145a5f8f1: 4989f7                   mov r15, rsi
0x145a5f8f4: 4921df                   and r15, rbx
0x145a5f8f7: 4d39fb                   cmp r11, r15
0x145a5f8fa: 7543                     jne 0x145a5f93f
0x145a5f8fc: 4921f6                   and r14, rsi
0x145a5f8ff: 753e                     jne 0x145a5f93f
0x145a5f901: 4989f6                   mov r14, rsi
0x145a5f904: 49c1ee30                 shr r14, 0x30
0x145a5f908: 7535                     jne 0x145a5f93f
0x145a5f90a: 4821d3                   and rbx, rdx
0x145a5f90d: 7530                     jne 0x145a5f93f
0x145a5f90f: 48c1ef28                 shr rdi, 0x28
0x145a5f913: 752a                     jne 0x145a5f93f
0x145a5f915: 48baec814c72a8b88bf8     movabs rdx, 0xf88bb8a8724c81ec
0x145a5f91f: 49bb4f450980185dc406     movabs r11, 0x6c45d188009454f
0x145a5f929: 49b9f465b9a16a9e786e     movabs r9, 0x6e789e6aa1b965f4
0x145a5f933: 48b9afcd1d7b39a820e2     movabs rcx, 0xe220a8397b1dcdaf
0x145a5f93d: eb09                     jmp 0x145a5f948
0x145a5f93f: 4c31c1                   xor rcx, r8
0x145a5f942: 4d31d1                   xor r9, r10
0x145a5f945: 4931f3                   xor r11, rsi
0x145a5f948: 488908                   mov qword ptr [rax], rcx
0x145a5f94b: 4c894808                 mov qword ptr [rax + 8], r9
0x145a5f94f: 4c895810                 mov qword ptr [rax + 0x10], r11
0x145a5f953: 48895018                 mov qword ptr [rax + 0x18], rdx
0x145a5f957: 5b                       pop rbx
0x145a5f958: 5f                       pop rdi
0x145a5f959: 5e                       pop rsi
0x145a5f95a: 415e                     pop r14
0x145a5f95c: 415f                     pop r15
0x145a5f95e: c3                       ret
