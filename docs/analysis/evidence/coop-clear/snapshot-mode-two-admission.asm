0000000145c2704d 837a1002                       cmp dword ptr [rdx + 0x10], 2
0000000145c27051 0f85a4000000                   jne 0x145c270fb
0000000145c27057 83ba700d000001                 cmp dword ptr [rdx + 0xd70], 1
0000000145c2705e 0f87cd000000                   ja 0x145c27131
0000000145c27064 4883ba48100000ff               cmp qword ptr [rdx + 0x1048], -1
0000000145c2706c 0f84bf000000                   je 0x145c27131
0000000145c27072 4989cc                         mov r12, rcx
