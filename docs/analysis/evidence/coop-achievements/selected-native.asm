; cooperative-constructor-suffix 0x145b4443d..0x145b4553c sha256=86b5044b425ebaa1cb1cc1c4606d43a0fc464095fcc4e54da456cd332682062b
0000000145b4443d: 488d0d4c22a801                 lea rcx, [rip + 0x1a8224c]
0000000145b44444: be0f000000                     mov esi, 0xf
0000000145b44449: ba0f000000                     mov edx, 0xf
0000000145b4444e: 48898d300e0000                 mov qword ptr [rbp + 0xe30], rcx
0000000145b44455: e8a657feff                     call 0x145b29c00
0000000145b4445a: 488995400e0000                 mov qword ptr [rbp + 0xe40], rdx
0000000145b44461: 4885c0                         test rax, rax
0000000145b44464: 488b8d300e0000                 mov rcx, qword ptr [rbp + 0xe30]
0000000145b4446b: 480f45c8                       cmovne rcx, rax
0000000145b4446f: 48898d300e0000                 mov qword ptr [rbp + 0xe30], rcx
0000000145b44476: 488b85400e0000                 mov rax, qword ptr [rbp + 0xe40]
0000000145b4447d: 480f44c6                       cmove rax, rsi
0000000145b44481: 488985400e0000                 mov qword ptr [rbp + 0xe40], rax
0000000145b44488: 488d0d1022a801                 lea rcx, [rip + 0x1a82210]
0000000145b4448f: be22000000                     mov esi, 0x22
0000000145b44494: ba22000000                     mov edx, 0x22
0000000145b44499: 48898d380e0000                 mov qword ptr [rbp + 0xe38], rcx
0000000145b444a0: e85b57feff                     call 0x145b29c00
0000000145b444a5: 488995100e0000                 mov qword ptr [rbp + 0xe10], rdx
0000000145b444ac: 4885c0                         test rax, rax
0000000145b444af: 488b8d380e0000                 mov rcx, qword ptr [rbp + 0xe38]
0000000145b444b6: 480f45c8                       cmovne rcx, rax
0000000145b444ba: 48898d380e0000                 mov qword ptr [rbp + 0xe38], rcx
0000000145b444c1: 488b85100e0000                 mov rax, qword ptr [rbp + 0xe10]
0000000145b444c8: 480f44c6                       cmove rax, rsi
0000000145b444cc: 488985100e0000                 mov qword ptr [rbp + 0xe10], rax
0000000145b444d3: 488d0d1022a801                 lea rcx, [rip + 0x1a82210]
0000000145b444da: be0e000000                     mov esi, 0xe
0000000145b444df: ba0e000000                     mov edx, 0xe
0000000145b444e4: 48898d000e0000                 mov qword ptr [rbp + 0xe00], rcx
0000000145b444eb: e81057feff                     call 0x145b29c00
0000000145b444f0: 488995200e0000                 mov qword ptr [rbp + 0xe20], rdx
0000000145b444f7: 4885c0                         test rax, rax
0000000145b444fa: 488b8d000e0000                 mov rcx, qword ptr [rbp + 0xe00]
0000000145b44501: 480f45c8                       cmovne rcx, rax
0000000145b44505: 48898d000e0000                 mov qword ptr [rbp + 0xe00], rcx
0000000145b4450c: 488b85200e0000                 mov rax, qword ptr [rbp + 0xe20]
0000000145b44513: 480f44c6                       cmove rax, rsi
0000000145b44517: 488985200e0000                 mov qword ptr [rbp + 0xe20], rax
0000000145b4451e: 488d0dd321a801                 lea rcx, [rip + 0x1a821d3]
0000000145b44525: be43000000                     mov esi, 0x43
0000000145b4452a: ba43000000                     mov edx, 0x43
0000000145b4452f: 48898df80d0000                 mov qword ptr [rbp + 0xdf8], rcx
0000000145b44536: e8c556feff                     call 0x145b29c00
0000000145b4453b: 488995b00d0000                 mov qword ptr [rbp + 0xdb0], rdx
0000000145b44542: 4885c0                         test rax, rax
0000000145b44545: 488b8df80d0000                 mov rcx, qword ptr [rbp + 0xdf8]
0000000145b4454c: 480f45c8                       cmovne rcx, rax
0000000145b44550: 48898df80d0000                 mov qword ptr [rbp + 0xdf8], rcx
0000000145b44557: 488b85b00d0000                 mov rax, qword ptr [rbp + 0xdb0]
0000000145b4455e: 480f44c6                       cmove rax, rsi
0000000145b44562: 488985b00d0000                 mov qword ptr [rbp + 0xdb0], rax
0000000145b44569: 488d0df321a801                 lea rcx, [rip + 0x1a821f3]
0000000145b44570: be16000000                     mov esi, 0x16
0000000145b44575: ba16000000                     mov edx, 0x16
0000000145b4457a: 48898db80d0000                 mov qword ptr [rbp + 0xdb8], rcx
0000000145b44581: e87a56feff                     call 0x145b29c00
0000000145b44586: 488995e00d0000                 mov qword ptr [rbp + 0xde0], rdx
0000000145b4458d: 4885c0                         test rax, rax
0000000145b44590: 488b8db80d0000                 mov rcx, qword ptr [rbp + 0xdb8]
0000000145b44597: 480f45c8                       cmovne rcx, rax
0000000145b4459b: 48898db80d0000                 mov qword ptr [rbp + 0xdb8], rcx
0000000145b445a2: 488b85e00d0000                 mov rax, qword ptr [rbp + 0xde0]
0000000145b445a9: 480f44c6                       cmove rax, rsi
0000000145b445ad: 488985e00d0000                 mov qword ptr [rbp + 0xde0], rax
0000000145b445b4: 488d0dbe21a801                 lea rcx, [rip + 0x1a821be]
0000000145b445bb: be73000000                     mov esi, 0x73
0000000145b445c0: ba73000000                     mov edx, 0x73
0000000145b445c5: 48898da00d0000                 mov qword ptr [rbp + 0xda0], rcx
0000000145b445cc: e82f56feff                     call 0x145b29c00
0000000145b445d1: 488995a80d0000                 mov qword ptr [rbp + 0xda8], rdx
0000000145b445d8: 4885c0                         test rax, rax
0000000145b445db: 488b8da00d0000                 mov rcx, qword ptr [rbp + 0xda0]
0000000145b445e2: 480f45c8                       cmovne rcx, rax
0000000145b445e6: 48898da00d0000                 mov qword ptr [rbp + 0xda0], rcx
0000000145b445ed: 488b85a80d0000                 mov rax, qword ptr [rbp + 0xda8]
0000000145b445f4: 480f44c6                       cmove rax, rsi
0000000145b445f8: 488985a80d0000                 mov qword ptr [rbp + 0xda8], rax
0000000145b445ff: 488d0d2122a801                 lea rcx, [rip + 0x1a82221]
0000000145b44606: be10000000                     mov esi, 0x10
0000000145b4460b: ba10000000                     mov edx, 0x10
0000000145b44610: 48898d880d0000                 mov qword ptr [rbp + 0xd88], rcx
0000000145b44617: e8e455feff                     call 0x145b29c00
0000000145b4461c: 488995900d0000                 mov qword ptr [rbp + 0xd90], rdx
0000000145b44623: 4885c0                         test rax, rax
0000000145b44626: 488b8d880d0000                 mov rcx, qword ptr [rbp + 0xd88]
0000000145b4462d: 480f45c8                       cmovne rcx, rax
0000000145b44631: 48898d880d0000                 mov qword ptr [rbp + 0xd88], rcx
0000000145b44638: 488b85900d0000                 mov rax, qword ptr [rbp + 0xd90]
0000000145b4463f: 480f44c6                       cmove rax, rsi
0000000145b44643: 488985900d0000                 mov qword ptr [rbp + 0xd90], rax
0000000145b4464a: 488d0de621a801                 lea rcx, [rip + 0x1a821e6]
0000000145b44651: be4f000000                     mov esi, 0x4f
0000000145b44656: ba4f000000                     mov edx, 0x4f
0000000145b4465b: 48898d980d0000                 mov qword ptr [rbp + 0xd98], rcx
0000000145b44662: e89955feff                     call 0x145b29c00
0000000145b44667: 488995b00c0000                 mov qword ptr [rbp + 0xcb0], rdx
0000000145b4466e: 4885c0                         test rax, rax
0000000145b44671: 488b8d980d0000                 mov rcx, qword ptr [rbp + 0xd98]
0000000145b44678: 480f45c8                       cmovne rcx, rax
0000000145b4467c: 48898d980d0000                 mov qword ptr [rbp + 0xd98], rcx
0000000145b44683: 488b85b00c0000                 mov rax, qword ptr [rbp + 0xcb0]
0000000145b4468a: 480f44c6                       cmove rax, rsi
0000000145b4468e: 488985b00c0000                 mov qword ptr [rbp + 0xcb0], rax
0000000145b44695: 488d0d1022a801                 lea rcx, [rip + 0x1a82210]
0000000145b4469c: be15000000                     mov esi, 0x15
0000000145b446a1: ba15000000                     mov edx, 0x15
0000000145b446a6: 48898db80c0000                 mov qword ptr [rbp + 0xcb8], rcx
0000000145b446ad: e84e55feff                     call 0x145b29c00
0000000145b446b2: 488995c00c0000                 mov qword ptr [rbp + 0xcc0], rdx
0000000145b446b9: 4885c0                         test rax, rax
0000000145b446bc: 488b8db80c0000                 mov rcx, qword ptr [rbp + 0xcb8]
0000000145b446c3: 480f45c8                       cmovne rcx, rax
0000000145b446c7: 48898db80c0000                 mov qword ptr [rbp + 0xcb8], rcx
0000000145b446ce: 488b85c00c0000                 mov rax, qword ptr [rbp + 0xcc0]
0000000145b446d5: 480f44c6                       cmove rax, rsi
0000000145b446d9: 488985c00c0000                 mov qword ptr [rbp + 0xcc0], rax
0000000145b446e0: 488d0dda21a801                 lea rcx, [rip + 0x1a821da]
0000000145b446e7: be4b000000                     mov esi, 0x4b
0000000145b446ec: ba4b000000                     mov edx, 0x4b
0000000145b446f1: 48898dc80c0000                 mov qword ptr [rbp + 0xcc8], rcx
0000000145b446f8: e80355feff                     call 0x145b29c00
0000000145b446fd: 488995d00c0000                 mov qword ptr [rbp + 0xcd0], rdx
0000000145b44704: 4885c0                         test rax, rax
0000000145b44707: 488b8dc80c0000                 mov rcx, qword ptr [rbp + 0xcc8]
0000000145b4470e: 480f45c8                       cmovne rcx, rax
0000000145b44712: 48898dc80c0000                 mov qword ptr [rbp + 0xcc8], rcx
0000000145b44719: 488b85d00c0000                 mov rax, qword ptr [rbp + 0xcd0]
0000000145b44720: 480f44c6                       cmove rax, rsi
0000000145b44724: 488985d00c0000                 mov qword ptr [rbp + 0xcd0], rax
0000000145b4472b: 488d0dfd21a801                 lea rcx, [rip + 0x1a821fd]
0000000145b44732: be20000000                     mov esi, 0x20
0000000145b44737: ba20000000                     mov edx, 0x20
0000000145b4473c: 48898dd80c0000                 mov qword ptr [rbp + 0xcd8], rcx
0000000145b44743: e8b854feff                     call 0x145b29c00
0000000145b44748: 488995e00c0000                 mov qword ptr [rbp + 0xce0], rdx
0000000145b4474f: 4885c0                         test rax, rax
0000000145b44752: 488b8dd80c0000                 mov rcx, qword ptr [rbp + 0xcd8]
0000000145b44759: 480f45c8                       cmovne rcx, rax
0000000145b4475d: 48898dd80c0000                 mov qword ptr [rbp + 0xcd8], rcx
0000000145b44764: 488b85e00c0000                 mov rax, qword ptr [rbp + 0xce0]
0000000145b4476b: 480f44c6                       cmove rax, rsi
0000000145b4476f: 488985e00c0000                 mov qword ptr [rbp + 0xce0], rax
0000000145b44776: 488d0dd221a801                 lea rcx, [rip + 0x1a821d2]
0000000145b4477d: be34000000                     mov esi, 0x34
0000000145b44782: ba34000000                     mov edx, 0x34
0000000145b44787: 48898de80c0000                 mov qword ptr [rbp + 0xce8], rcx
0000000145b4478e: e86d54feff                     call 0x145b29c00
0000000145b44793: 488995f00c0000                 mov qword ptr [rbp + 0xcf0], rdx
0000000145b4479a: 4885c0                         test rax, rax
0000000145b4479d: 488b8de80c0000                 mov rcx, qword ptr [rbp + 0xce8]
0000000145b447a4: 480f45c8                       cmovne rcx, rax
0000000145b447a8: 48898de80c0000                 mov qword ptr [rbp + 0xce8], rcx
0000000145b447af: 488b85f00c0000                 mov rax, qword ptr [rbp + 0xcf0]
0000000145b447b6: 480f44c6                       cmove rax, rsi
0000000145b447ba: 488985f00c0000                 mov qword ptr [rbp + 0xcf0], rax
0000000145b447c1: 488d0de721a801                 lea rcx, [rip + 0x1a821e7]
0000000145b447c8: be0c000000                     mov esi, 0xc
0000000145b447cd: ba0c000000                     mov edx, 0xc
0000000145b447d2: 48898df80c0000                 mov qword ptr [rbp + 0xcf8], rcx
0000000145b447d9: e82254feff                     call 0x145b29c00
0000000145b447de: 488995000d0000                 mov qword ptr [rbp + 0xd00], rdx
0000000145b447e5: 4885c0                         test rax, rax
0000000145b447e8: 488b8df80c0000                 mov rcx, qword ptr [rbp + 0xcf8]
0000000145b447ef: 480f45c8                       cmovne rcx, rax
0000000145b447f3: 48898df80c0000                 mov qword ptr [rbp + 0xcf8], rcx
0000000145b447fa: 488b85000d0000                 mov rax, qword ptr [rbp + 0xd00]
0000000145b44801: 480f44c6                       cmove rax, rsi
0000000145b44805: 488985000d0000                 mov qword ptr [rbp + 0xd00], rax
0000000145b4480c: 488d0da821a801                 lea rcx, [rip + 0x1a821a8]
0000000145b44813: be31000000                     mov esi, 0x31
0000000145b44818: ba31000000                     mov edx, 0x31
0000000145b4481d: 48898d080d0000                 mov qword ptr [rbp + 0xd08], rcx
0000000145b44824: e8d753feff                     call 0x145b29c00
0000000145b44829: 488995100d0000                 mov qword ptr [rbp + 0xd10], rdx
0000000145b44830: 4885c0                         test rax, rax
0000000145b44833: 488b8d080d0000                 mov rcx, qword ptr [rbp + 0xd08]
0000000145b4483a: 480f45c8                       cmovne rcx, rax
0000000145b4483e: 48898d080d0000                 mov qword ptr [rbp + 0xd08], rcx
0000000145b44845: 488b85100d0000                 mov rax, qword ptr [rbp + 0xd10]
0000000145b4484c: 480f44c6                       cmove rax, rsi
0000000145b44850: 488985100d0000                 mov qword ptr [rbp + 0xd10], rax
0000000145b44857: 488d0dd321a801                 lea rcx, [rip + 0x1a821d3]
0000000145b4485e: be0d000000                     mov esi, 0xd
0000000145b44863: ba0d000000                     mov edx, 0xd
0000000145b44868: 48898d180d0000                 mov qword ptr [rbp + 0xd18], rcx
0000000145b4486f: e88c53feff                     call 0x145b29c00
0000000145b44874: 488995200d0000                 mov qword ptr [rbp + 0xd20], rdx
0000000145b4487b: 4885c0                         test rax, rax
0000000145b4487e: 488b8d180d0000                 mov rcx, qword ptr [rbp + 0xd18]
0000000145b44885: 480f45c8                       cmovne rcx, rax
0000000145b44889: 48898d180d0000                 mov qword ptr [rbp + 0xd18], rcx
0000000145b44890: 488b85200d0000                 mov rax, qword ptr [rbp + 0xd20]
0000000145b44897: 480f44c6                       cmove rax, rsi
0000000145b4489b: 488985200d0000                 mov qword ptr [rbp + 0xd20], rax
0000000145b448a2: 488d0d9521a801                 lea rcx, [rip + 0x1a82195]
0000000145b448a9: be30000000                     mov esi, 0x30
0000000145b448ae: ba30000000                     mov edx, 0x30
0000000145b448b3: 48898d280d0000                 mov qword ptr [rbp + 0xd28], rcx
0000000145b448ba: e84153feff                     call 0x145b29c00
0000000145b448bf: 488995300d0000                 mov qword ptr [rbp + 0xd30], rdx
0000000145b448c6: 4885c0                         test rax, rax
0000000145b448c9: 488b8d280d0000                 mov rcx, qword ptr [rbp + 0xd28]
0000000145b448d0: 480f45c8                       cmovne rcx, rax
0000000145b448d4: 48898d280d0000                 mov qword ptr [rbp + 0xd28], rcx
0000000145b448db: 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145b448e2: 480f44c6                       cmove rax, rsi
0000000145b448e6: 488985300d0000                 mov qword ptr [rbp + 0xd30], rax
0000000145b448ed: 488d0da621a801                 lea rcx, [rip + 0x1a821a6]
0000000145b448f4: be0f000000                     mov esi, 0xf
0000000145b448f9: ba0f000000                     mov edx, 0xf
0000000145b448fe: 48898d380d0000                 mov qword ptr [rbp + 0xd38], rcx
0000000145b44905: e8f652feff                     call 0x145b29c00
0000000145b4490a: 488995400d0000                 mov qword ptr [rbp + 0xd40], rdx
0000000145b44911: 4885c0                         test rax, rax
0000000145b44914: 488b8d380d0000                 mov rcx, qword ptr [rbp + 0xd38]
0000000145b4491b: 480f45c8                       cmovne rcx, rax
0000000145b4491f: 48898d380d0000                 mov qword ptr [rbp + 0xd38], rcx
0000000145b44926: 488b85400d0000                 mov rax, qword ptr [rbp + 0xd40]
0000000145b4492d: 480f44c6                       cmove rax, rsi
0000000145b44931: 488985400d0000                 mov qword ptr [rbp + 0xd40], rax
0000000145b44938: 488d0d6a21a801                 lea rcx, [rip + 0x1a8216a]
0000000145b4493f: be6e000000                     mov esi, 0x6e
0000000145b44944: ba6e000000                     mov edx, 0x6e
0000000145b44949: 48898d480d0000                 mov qword ptr [rbp + 0xd48], rcx
0000000145b44950: e8ab52feff                     call 0x145b29c00
0000000145b44955: 488995500d0000                 mov qword ptr [rbp + 0xd50], rdx
0000000145b4495c: 4885c0                         test rax, rax
0000000145b4495f: 488b8d480d0000                 mov rcx, qword ptr [rbp + 0xd48]
0000000145b44966: 480f45c8                       cmovne rcx, rax
0000000145b4496a: 48898d480d0000                 mov qword ptr [rbp + 0xd48], rcx
0000000145b44971: 488b85500d0000                 mov rax, qword ptr [rbp + 0xd50]
0000000145b44978: 480f44c6                       cmove rax, rsi
0000000145b4497c: 488985500d0000                 mov qword ptr [rbp + 0xd50], rax
0000000145b44983: 488d0dbc21a801                 lea rcx, [rip + 0x1a821bc]
0000000145b4498a: be10000000                     mov esi, 0x10
0000000145b4498f: ba10000000                     mov edx, 0x10
0000000145b44994: 48898d580d0000                 mov qword ptr [rbp + 0xd58], rcx
0000000145b4499b: e86052feff                     call 0x145b29c00
0000000145b449a0: 488995600d0000                 mov qword ptr [rbp + 0xd60], rdx
0000000145b449a7: 4885c0                         test rax, rax
0000000145b449aa: 488b8d580d0000                 mov rcx, qword ptr [rbp + 0xd58]
0000000145b449b1: 480f45c8                       cmovne rcx, rax
0000000145b449b5: 48898d580d0000                 mov qword ptr [rbp + 0xd58], rcx
0000000145b449bc: 488b85600d0000                 mov rax, qword ptr [rbp + 0xd60]
0000000145b449c3: 480f44c6                       cmove rax, rsi
0000000145b449c7: 488985600d0000                 mov qword ptr [rbp + 0xd60], rax
0000000145b449ce: 488d0d8121a801                 lea rcx, [rip + 0x1a82181]
0000000145b449d5: be9d000000                     mov esi, 0x9d
0000000145b449da: ba9d000000                     mov edx, 0x9d
0000000145b449df: 48898d680d0000                 mov qword ptr [rbp + 0xd68], rcx
0000000145b449e6: e81552feff                     call 0x145b29c00
0000000145b449eb: 488995700d0000                 mov qword ptr [rbp + 0xd70], rdx
0000000145b449f2: 4885c0                         test rax, rax
0000000145b449f5: 488b8d680d0000                 mov rcx, qword ptr [rbp + 0xd68]
0000000145b449fc: 480f45c8                       cmovne rcx, rax
0000000145b44a00: 48898d680d0000                 mov qword ptr [rbp + 0xd68], rcx
0000000145b44a07: 488b85700d0000                 mov rax, qword ptr [rbp + 0xd70]
0000000145b44a0e: 480f44c6                       cmove rax, rsi
0000000145b44a12: 488985700d0000                 mov qword ptr [rbp + 0xd70], rax
0000000145b44a19: 488d0d0622a801                 lea rcx, [rip + 0x1a82206]
0000000145b44a20: be0d000000                     mov esi, 0xd
0000000145b44a25: ba0d000000                     mov edx, 0xd
0000000145b44a2a: 48898d780d0000                 mov qword ptr [rbp + 0xd78], rcx
0000000145b44a31: e8ca51feff                     call 0x145b29c00
0000000145b44a36: 488995800d0000                 mov qword ptr [rbp + 0xd80], rdx
0000000145b44a3d: 4885c0                         test rax, rax
0000000145b44a40: 488b8d780d0000                 mov rcx, qword ptr [rbp + 0xd78]
0000000145b44a47: 480f45c8                       cmovne rcx, rax
0000000145b44a4b: 48898d780d0000                 mov qword ptr [rbp + 0xd78], rcx
0000000145b44a52: 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145b44a59: 480f44c6                       cmove rax, rsi
0000000145b44a5d: 488985800d0000                 mov qword ptr [rbp + 0xd80], rax
0000000145b44a64: 488d0dc821a801                 lea rcx, [rip + 0x1a821c8]
0000000145b44a6b: be26000000                     mov esi, 0x26
0000000145b44a70: ba26000000                     mov edx, 0x26
0000000145b44a75: 48898dd80b0000                 mov qword ptr [rbp + 0xbd8], rcx
0000000145b44a7c: e87f51feff                     call 0x145b29c00
0000000145b44a81: 488995e00b0000                 mov qword ptr [rbp + 0xbe0], rdx
0000000145b44a88: 4885c0                         test rax, rax
0000000145b44a8b: 488b8dd80b0000                 mov rcx, qword ptr [rbp + 0xbd8]
0000000145b44a92: 480f45c8                       cmovne rcx, rax
0000000145b44a96: 48898dd80b0000                 mov qword ptr [rbp + 0xbd8], rcx
0000000145b44a9d: 488b85e00b0000                 mov rax, qword ptr [rbp + 0xbe0]
0000000145b44aa4: 480f44c6                       cmove rax, rsi
0000000145b44aa8: 488985e00b0000                 mov qword ptr [rbp + 0xbe0], rax
0000000145b44aaf: 488d0df521a801                 lea rcx, [rip + 0x1a821f5]
0000000145b44ab6: be11000000                     mov esi, 0x11
0000000145b44abb: ba11000000                     mov edx, 0x11
0000000145b44ac0: 48898de80b0000                 mov qword ptr [rbp + 0xbe8], rcx
0000000145b44ac7: e83451feff                     call 0x145b29c00
0000000145b44acc: 488995f00b0000                 mov qword ptr [rbp + 0xbf0], rdx
0000000145b44ad3: 4885c0                         test rax, rax
0000000145b44ad6: 488b8de80b0000                 mov rcx, qword ptr [rbp + 0xbe8]
0000000145b44add: 480f45c8                       cmovne rcx, rax
0000000145b44ae1: 48898de80b0000                 mov qword ptr [rbp + 0xbe8], rcx
0000000145b44ae8: 488b85f00b0000                 mov rax, qword ptr [rbp + 0xbf0]
0000000145b44aef: 480f44c6                       cmove rax, rsi
0000000145b44af3: 488985f00b0000                 mov qword ptr [rbp + 0xbf0], rax
0000000145b44afa: 488d35bb21a801                 lea rsi, [rip + 0x1a821bb]
0000000145b44b01: bf89000000                     mov edi, 0x89
0000000145b44b06: ba89000000                     mov edx, 0x89
0000000145b44b0b: 4889f1                         mov rcx, rsi
0000000145b44b0e: e8ed50feff                     call 0x145b29c00
0000000145b44b13: 488995f80b0000                 mov qword ptr [rbp + 0xbf8], rdx
0000000145b44b1a: 4885c0                         test rax, rax
0000000145b44b1d: 480f45f0                       cmovne rsi, rax
0000000145b44b21: 488b85f80b0000                 mov rax, qword ptr [rbp + 0xbf8]
0000000145b44b28: 480f44c7                       cmove rax, rdi
0000000145b44b2c: 488985f80b0000                 mov qword ptr [rbp + 0xbf8], rax
0000000145b44b33: 488d0d4122a801                 lea rcx, [rip + 0x1a82241]
0000000145b44b3a: bf1c000000                     mov edi, 0x1c
0000000145b44b3f: ba1c000000                     mov edx, 0x1c
0000000145b44b44: 48898d080c0000                 mov qword ptr [rbp + 0xc08], rcx
0000000145b44b4b: e8b050feff                     call 0x145b29c00
0000000145b44b50: 488995000c0000                 mov qword ptr [rbp + 0xc00], rdx
0000000145b44b57: 4885c0                         test rax, rax
0000000145b44b5a: 488b8d080c0000                 mov rcx, qword ptr [rbp + 0xc08]
0000000145b44b61: 480f45c8                       cmovne rcx, rax
0000000145b44b65: 48898d080c0000                 mov qword ptr [rbp + 0xc08], rcx
0000000145b44b6c: 488b85000c0000                 mov rax, qword ptr [rbp + 0xc00]
0000000145b44b73: 480f44c7                       cmove rax, rdi
0000000145b44b77: 488985000c0000                 mov qword ptr [rbp + 0xc00], rax
0000000145b44b7e: 4c8d3d1222a801                 lea r15, [rip + 0x1a82212]
0000000145b44b85: bf4b000000                     mov edi, 0x4b
0000000145b44b8a: ba4b000000                     mov edx, 0x4b
0000000145b44b8f: 4c89f9                         mov rcx, r15
0000000145b44b92: e86950feff                     call 0x145b29c00
0000000145b44b97: 488995100c0000                 mov qword ptr [rbp + 0xc10], rdx
0000000145b44b9e: 4885c0                         test rax, rax
0000000145b44ba1: 4c0f45f8                       cmovne r15, rax
0000000145b44ba5: 488b85100c0000                 mov rax, qword ptr [rbp + 0xc10]
0000000145b44bac: 480f44c7                       cmove rax, rdi
0000000145b44bb0: 488985100c0000                 mov qword ptr [rbp + 0xc10], rax
0000000145b44bb7: 4c8d2d4b22a801                 lea r13, [rip + 0x1a8224b]
0000000145b44bbe: ba14000000                     mov edx, 0x14
0000000145b44bc3: 4c89e9                         mov rcx, r13
0000000145b44bc6: e83550feff                     call 0x145b29c00
0000000145b44bcb: 90                             nop
0000000145b44bcc: 4989c6                         mov r14, rax
0000000145b44bcf: 4889d3                         mov rbx, rdx
0000000145b44bd2: 488d3d4422a801                 lea rdi, [rip + 0x1a82244]
0000000145b44bd9: 41bc38000000                   mov r12d, 0x38
0000000145b44bdf: ba38000000                     mov edx, 0x38
0000000145b44be4: 4889f9                         mov rcx, rdi
0000000145b44be7: e81450feff                     call 0x145b29c00
0000000145b44bec: 90                             nop
0000000145b44bed: 4d85f6                         test r14, r14
0000000145b44bf0: b914000000                     mov ecx, 0x14
0000000145b44bf5: 480f44d9                       cmove rbx, rcx
0000000145b44bf9: 4d0f45ee                       cmovne r13, r14
0000000145b44bfd: 4885c0                         test rax, rax
0000000145b44c00: 480f45f8                       cmovne rdi, rax
0000000145b44c04: 490f44d4                       cmove rdx, r12
0000000145b44c08: 48c745c800000000               mov qword ptr [rbp - 0x38], 0
0000000145b44c10: 48c745d00e000000               mov qword ptr [rbp - 0x30], 0xe
0000000145b44c18: 488d05a21aa801                 lea rax, [rip + 0x1a81aa2]
0000000145b44c1f: 488945d8                       mov qword ptr [rbp - 0x28], rax
0000000145b44c23: 48c745e00d000000               mov qword ptr [rbp - 0x20], 0xd
0000000145b44c2b: 488b85300e0000                 mov rax, qword ptr [rbp + 0xe30]
0000000145b44c32: 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145b44c36: 488b85400e0000                 mov rax, qword ptr [rbp + 0xe40]
0000000145b44c3d: 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145b44c41: 488b85380e0000                 mov rax, qword ptr [rbp + 0xe38]
0000000145b44c48: 488945f8                       mov qword ptr [rbp - 8], rax
0000000145b44c4c: 488b85100e0000                 mov rax, qword ptr [rbp + 0xe10]
0000000145b44c53: 48894500                       mov qword ptr [rbp], rax
0000000145b44c57: 488d05701aa801                 lea rax, [rip + 0x1a81a70]
0000000145b44c5e: 48894508                       mov qword ptr [rbp + 8], rax
0000000145b44c62: 48c745101c000000               mov qword ptr [rbp + 0x10], 0x1c
0000000145b44c6a: c745180a000000                 mov dword ptr [rbp + 0x18], 0xa
0000000145b44c71: c6452015                       mov byte ptr [rbp + 0x20], 0x15
0000000145b44c75: 488d05bf1aa801                 lea rax, [rip + 0x1a81abf]
0000000145b44c7c: 48894558                       mov qword ptr [rbp + 0x58], rax
0000000145b44c80: 48c7456010000000               mov qword ptr [rbp + 0x60], 0x10
0000000145b44c88: 488b85000e0000                 mov rax, qword ptr [rbp + 0xe00]
0000000145b44c8f: 48894568                       mov qword ptr [rbp + 0x68], rax
0000000145b44c93: 488b85200e0000                 mov rax, qword ptr [rbp + 0xe20]
0000000145b44c9a: 48894570                       mov qword ptr [rbp + 0x70], rax
0000000145b44c9e: 488b85f80d0000                 mov rax, qword ptr [rbp + 0xdf8]
0000000145b44ca5: 48894578                       mov qword ptr [rbp + 0x78], rax
0000000145b44ca9: 488b85b00d0000                 mov rax, qword ptr [rbp + 0xdb0]
0000000145b44cb0: 48898580000000                 mov qword ptr [rbp + 0x80], rax
0000000145b44cb7: 488d058d1aa801                 lea rax, [rip + 0x1a81a8d]
0000000145b44cbe: 48898588000000                 mov qword ptr [rbp + 0x88], rax
0000000145b44cc5: 48c7859000000018000000         mov qword ptr [rbp + 0x90], 0x18
0000000145b44cd0: c7859800000019000000           mov dword ptr [rbp + 0x98], 0x19
0000000145b44cda: c685a000000008                 mov byte ptr [rbp + 0xa0], 8
0000000145b44ce1: c685a100000000                 mov byte ptr [rbp + 0xa1], 0
0000000145b44ce8: c685a200000000                 mov byte ptr [rbp + 0xa2], 0
0000000145b44cef: 48c785a800000000000000         mov qword ptr [rbp + 0xa8], 0
0000000145b44cfa: 48c785b800000005000000         mov qword ptr [rbp + 0xb8], 5
0000000145b44d05: 488d05f01aa801                 lea rax, [rip + 0x1a81af0]
0000000145b44d0c: 488985d8000000                 mov qword ptr [rbp + 0xd8], rax
0000000145b44d13: 48c785e000000013000000         mov qword ptr [rbp + 0xe0], 0x13
0000000145b44d1e: 488b85b80d0000                 mov rax, qword ptr [rbp + 0xdb8]
0000000145b44d25: 488985e8000000                 mov qword ptr [rbp + 0xe8], rax
0000000145b44d2c: 488b85e00d0000                 mov rax, qword ptr [rbp + 0xde0]
0000000145b44d33: 488985f0000000                 mov qword ptr [rbp + 0xf0], rax
0000000145b44d3a: 488b85a00d0000                 mov rax, qword ptr [rbp + 0xda0]
0000000145b44d41: 488985f8000000                 mov qword ptr [rbp + 0xf8], rax
0000000145b44d48: 488b85a80d0000                 mov rax, qword ptr [rbp + 0xda8]
0000000145b44d4f: 48898500010000                 mov qword ptr [rbp + 0x100], rax
0000000145b44d56: 488d05b21aa801                 lea rax, [rip + 0x1a81ab2]
0000000145b44d5d: 48898508010000                 mov qword ptr [rbp + 0x108], rax
0000000145b44d64: 48c7851001000018000000         mov qword ptr [rbp + 0x110], 0x18
0000000145b44d6f: c7851801000032000000           mov dword ptr [rbp + 0x118], 0x32
0000000145b44d79: c6852001000009                 mov byte ptr [rbp + 0x120], 9
0000000145b44d80: c6852101000000                 mov byte ptr [rbp + 0x121], 0
0000000145b44d87: c78524010000d6050000           mov dword ptr [rbp + 0x124], 0x5d6
0000000145b44d91: 488d05601aa801                 lea rax, [rip + 0x1a81a60]
0000000145b44d98: 48898528010000                 mov qword ptr [rbp + 0x128], rax
0000000145b44d9f: 48c7853001000001000000         mov qword ptr [rbp + 0x130], 1
0000000145b44daa: 48c7853801000001000000         mov qword ptr [rbp + 0x138], 1
0000000145b44db5: 488d05301aa801                 lea rax, [rip + 0x1a81a30]
0000000145b44dbc: 48898540010000                 mov qword ptr [rbp + 0x140], rax
0000000145b44dc3: 48c785480100000b000000         mov qword ptr [rbp + 0x148], 0xb
0000000145b44dce: c685500100000b                 mov byte ptr [rbp + 0x150], 0xb
0000000145b44dd5: 488d05aa1aa801                 lea rax, [rip + 0x1a81aaa]
0000000145b44ddc: 48898558010000                 mov qword ptr [rbp + 0x158], rax
0000000145b44de3: 48c7856001000009000000         mov qword ptr [rbp + 0x160], 9
0000000145b44dee: 488b85880d0000                 mov rax, qword ptr [rbp + 0xd88]
0000000145b44df5: 48898568010000                 mov qword ptr [rbp + 0x168], rax
0000000145b44dfc: 488b85900d0000                 mov rax, qword ptr [rbp + 0xd90]
0000000145b44e03: 48898570010000                 mov qword ptr [rbp + 0x170], rax
0000000145b44e0a: 488b85980d0000                 mov rax, qword ptr [rbp + 0xd98]
0000000145b44e11: 48898578010000                 mov qword ptr [rbp + 0x178], rax
0000000145b44e18: 488b85b00c0000                 mov rax, qword ptr [rbp + 0xcb0]
0000000145b44e1f: 48898580010000                 mov qword ptr [rbp + 0x180], rax
0000000145b44e26: 488d05621aa801                 lea rax, [rip + 0x1a81a62]
0000000145b44e2d: 48898588010000                 mov qword ptr [rbp + 0x188], rax
0000000145b44e34: 48c785900100001d000000         mov qword ptr [rbp + 0x190], 0x1d
0000000145b44e3f: c7859801000032000000           mov dword ptr [rbp + 0x198], 0x32
0000000145b44e49: c685a001000008                 mov byte ptr [rbp + 0x1a0], 8
0000000145b44e50: c685a101000000                 mov byte ptr [rbp + 0x1a1], 0
0000000145b44e57: c685a201000001                 mov byte ptr [rbp + 0x1a2], 1
0000000145b44e5e: 48c785a801000000000000         mov qword ptr [rbp + 0x1a8], 0
0000000145b44e69: 48c785b801000003000000         mov qword ptr [rbp + 0x1b8], 3
0000000145b44e74: 488d05911aa801                 lea rax, [rip + 0x1a81a91]
0000000145b44e7b: 488985d8010000                 mov qword ptr [rbp + 0x1d8], rax
0000000145b44e82: 48c785e001000010000000         mov qword ptr [rbp + 0x1e0], 0x10
0000000145b44e8d: 488b85b80c0000                 mov rax, qword ptr [rbp + 0xcb8]
0000000145b44e94: 488985e8010000                 mov qword ptr [rbp + 0x1e8], rax
0000000145b44e9b: 488b85c00c0000                 mov rax, qword ptr [rbp + 0xcc0]
0000000145b44ea2: 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145b44ea9: 488b85c80c0000                 mov rax, qword ptr [rbp + 0xcc8]
0000000145b44eb0: 488985f8010000                 mov qword ptr [rbp + 0x1f8], rax
0000000145b44eb7: 488b85d00c0000                 mov rax, qword ptr [rbp + 0xcd0]
0000000145b44ebe: 48898500020000                 mov qword ptr [rbp + 0x200], rax
0000000145b44ec5: 488d05501aa801                 lea rax, [rip + 0x1a81a50]
0000000145b44ecc: 48898508020000                 mov qword ptr [rbp + 0x208], rax
0000000145b44ed3: 48c7851002000013000000         mov qword ptr [rbp + 0x210], 0x13
0000000145b44ede: c7851802000019000000           mov dword ptr [rbp + 0x218], 0x19
0000000145b44ee8: c6852002000009                 mov byte ptr [rbp + 0x220], 9
0000000145b44eef: c6852102000000                 mov byte ptr [rbp + 0x221], 0
0000000145b44ef6: c78524020000b6020000           mov dword ptr [rbp + 0x224], 0x2b6
0000000145b44f00: 48c7852802000004000000         mov qword ptr [rbp + 0x228], 4
0000000145b44f0b: 48c7853002000000000000         mov qword ptr [rbp + 0x230], 0
0000000145b44f16: 48c7853802000004000000         mov qword ptr [rbp + 0x238], 4
0000000145b44f21: 488d05631aa801                 lea rax, [rip + 0x1a81a63]
0000000145b44f28: 48898558020000                 mov qword ptr [rbp + 0x258], rax
0000000145b44f2f: 48c7856002000009000000         mov qword ptr [rbp + 0x260], 9
0000000145b44f3a: 488b85d80c0000                 mov rax, qword ptr [rbp + 0xcd8]
0000000145b44f41: 48898568020000                 mov qword ptr [rbp + 0x268], rax
0000000145b44f48: 488b85e00c0000                 mov rax, qword ptr [rbp + 0xce0]
0000000145b44f4f: 48898570020000                 mov qword ptr [rbp + 0x270], rax
0000000145b44f56: 488b85e80c0000                 mov rax, qword ptr [rbp + 0xce8]
0000000145b44f5d: 48898578020000                 mov qword ptr [rbp + 0x278], rax
0000000145b44f64: 488b85f00c0000                 mov rax, qword ptr [rbp + 0xcf0]
0000000145b44f6b: 48898580020000                 mov qword ptr [rbp + 0x280], rax
0000000145b44f72: 488d051b1aa801                 lea rax, [rip + 0x1a81a1b]
0000000145b44f79: 48898588020000                 mov qword ptr [rbp + 0x288], rax
0000000145b44f80: 48c785900200001b000000         mov qword ptr [rbp + 0x290], 0x1b
0000000145b44f8b: c7859802000019000000           mov dword ptr [rbp + 0x298], 0x19
0000000145b44f95: c685a002000008                 mov byte ptr [rbp + 0x2a0], 8
0000000145b44f9c: c685a102000001                 mov byte ptr [rbp + 0x2a1], 1
0000000145b44fa3: c685a202000000                 mov byte ptr [rbp + 0x2a2], 0
0000000145b44faa: 488d05d219a801                 lea rax, [rip + 0x1a819d2]
0000000145b44fb1: 488985a8020000                 mov qword ptr [rbp + 0x2a8], rax
0000000145b44fb8: 48c785b002000008000000         mov qword ptr [rbp + 0x2b0], 8
0000000145b44fc3: 48c785b802000003000000         mov qword ptr [rbp + 0x2b8], 3
0000000145b44fce: 488d05431aa801                 lea rax, [rip + 0x1a81a43]
0000000145b44fd5: 488985d8020000                 mov qword ptr [rbp + 0x2d8], rax
0000000145b44fdc: 48c785e002000009000000         mov qword ptr [rbp + 0x2e0], 9
0000000145b44fe7: 488b85f80c0000                 mov rax, qword ptr [rbp + 0xcf8]
0000000145b44fee: 488985e8020000                 mov qword ptr [rbp + 0x2e8], rax
0000000145b44ff5: 488b85000d0000                 mov rax, qword ptr [rbp + 0xd00]
0000000145b44ffc: 488985f0020000                 mov qword ptr [rbp + 0x2f0], rax
0000000145b45003: 488b85080d0000                 mov rax, qword ptr [rbp + 0xd08]
0000000145b4500a: 488985f8020000                 mov qword ptr [rbp + 0x2f8], rax
0000000145b45011: 488b85100d0000                 mov rax, qword ptr [rbp + 0xd10]
0000000145b45018: 48898500030000                 mov qword ptr [rbp + 0x300], rax
0000000145b4501f: 488d05fb19a801                 lea rax, [rip + 0x1a819fb]
0000000145b45026: 48898508030000                 mov qword ptr [rbp + 0x308], rax
0000000145b4502d: 48c7851003000010000000         mov qword ptr [rbp + 0x310], 0x10
0000000145b45038: c785180300000a000000           mov dword ptr [rbp + 0x318], 0xa
0000000145b45042: c6852003000014                 mov byte ptr [rbp + 0x320], 0x14
0000000145b45049: 488d05a819a801                 lea rax, [rip + 0x1a819a8]
0000000145b45050: 48898528030000                 mov qword ptr [rbp + 0x328], rax
0000000145b45057: 48c7853003000002000000         mov qword ptr [rbp + 0x330], 2
0000000145b45062: 488d050b1aa801                 lea rax, [rip + 0x1a81a0b]
0000000145b45069: 48898558030000                 mov qword ptr [rbp + 0x358], rax
0000000145b45070: 48c785600300000d000000         mov qword ptr [rbp + 0x360], 0xd
0000000145b4507b: 488b85180d0000                 mov rax, qword ptr [rbp + 0xd18]
0000000145b45082: 48898568030000                 mov qword ptr [rbp + 0x368], rax
0000000145b45089: 488b85200d0000                 mov rax, qword ptr [rbp + 0xd20]
0000000145b45090: 48898570030000                 mov qword ptr [rbp + 0x370], rax
0000000145b45097: 488b85280d0000                 mov rax, qword ptr [rbp + 0xd28]
0000000145b4509e: 48898578030000                 mov qword ptr [rbp + 0x378], rax
0000000145b450a5: 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145b450ac: 48898580030000                 mov qword ptr [rbp + 0x380], rax
0000000145b450b3: 488d05c719a801                 lea rax, [rip + 0x1a819c7]
0000000145b450ba: 48898588030000                 mov qword ptr [rbp + 0x388], rax
0000000145b450c1: 48c7859003000019000000         mov qword ptr [rbp + 0x390], 0x19
0000000145b450cc: c7859803000019000000           mov dword ptr [rbp + 0x398], 0x19
0000000145b450d6: c685a003000008                 mov byte ptr [rbp + 0x3a0], 8
0000000145b450dd: c685a103000000                 mov byte ptr [rbp + 0x3a1], 0
0000000145b450e4: c685a203000000                 mov byte ptr [rbp + 0x3a2], 0
0000000145b450eb: 488d057c19a801                 lea rax, [rip + 0x1a8197c]
0000000145b450f2: 488985a8030000                 mov qword ptr [rbp + 0x3a8], rax
0000000145b450f9: 48c785b003000006000000         mov qword ptr [rbp + 0x3b0], 6
0000000145b45104: 48c785b803000000000000         mov qword ptr [rbp + 0x3b8], 0
0000000145b4510f: c685d003000003                 mov byte ptr [rbp + 0x3d0], 3
0000000145b45116: 488d050b1aa801                 lea rax, [rip + 0x1a81a0b]
0000000145b4511d: 488985d8030000                 mov qword ptr [rbp + 0x3d8], rax
0000000145b45124: 48c785e00300000d000000         mov qword ptr [rbp + 0x3e0], 0xd
0000000145b4512f: 488b85380d0000                 mov rax, qword ptr [rbp + 0xd38]
0000000145b45136: 488985e8030000                 mov qword ptr [rbp + 0x3e8], rax
0000000145b4513d: 488b85400d0000                 mov rax, qword ptr [rbp + 0xd40]
0000000145b45144: 488985f0030000                 mov qword ptr [rbp + 0x3f0], rax
0000000145b4514b: 488b85480d0000                 mov rax, qword ptr [rbp + 0xd48]
0000000145b45152: 488985f8030000                 mov qword ptr [rbp + 0x3f8], rax
0000000145b45159: 488b85500d0000                 mov rax, qword ptr [rbp + 0xd50]
0000000145b45160: 48898500040000                 mov qword ptr [rbp + 0x400], rax
0000000145b45167: 488d05c719a801                 lea rax, [rip + 0x1a819c7]
0000000145b4516e: 48898508040000                 mov qword ptr [rbp + 0x408], rax
0000000145b45175: 48c7851004000011000000         mov qword ptr [rbp + 0x410], 0x11
0000000145b45180: c7851804000032000000           mov dword ptr [rbp + 0x418], 0x32
0000000145b4518a: c6852004000009                 mov byte ptr [rbp + 0x420], 9
0000000145b45191: c6852104000000                 mov byte ptr [rbp + 0x421], 0
0000000145b45198: c78524040000e2030000           mov dword ptr [rbp + 0x424], 0x3e2
0000000145b451a2: 488d057b19a801                 lea rax, [rip + 0x1a8197b]
0000000145b451a9: 48898528040000                 mov qword ptr [rbp + 0x428], rax
0000000145b451b0: 48c7853004000001000000         mov qword ptr [rbp + 0x430], 1
0000000145b451bb: 48c7853804000001000000         mov qword ptr [rbp + 0x438], 1
0000000145b451c6: 488d054a19a801                 lea rax, [rip + 0x1a8194a]
0000000145b451cd: 48898540040000                 mov qword ptr [rbp + 0x440], rax
0000000145b451d4: 48c785480400000a000000         mov qword ptr [rbp + 0x448], 0xa
0000000145b451df: c6855004000001                 mov byte ptr [rbp + 0x450], 1
0000000145b451e6: 488d05171aa801                 lea rax, [rip + 0x1a81a17]
0000000145b451ed: 48898558040000                 mov qword ptr [rbp + 0x458], rax
0000000145b451f4: 48c785600400000e000000         mov qword ptr [rbp + 0x460], 0xe
0000000145b451ff: 488b85580d0000                 mov rax, qword ptr [rbp + 0xd58]
0000000145b45206: 48898568040000                 mov qword ptr [rbp + 0x468], rax
0000000145b4520d: 488b85600d0000                 mov rax, qword ptr [rbp + 0xd60]
0000000145b45214: 48898570040000                 mov qword ptr [rbp + 0x470], rax
0000000145b4521b: 488b85680d0000                 mov rax, qword ptr [rbp + 0xd68]
0000000145b45222: 48898578040000                 mov qword ptr [rbp + 0x478], rax
0000000145b45229: 488b85700d0000                 mov rax, qword ptr [rbp + 0xd70]
0000000145b45230: 48898580040000                 mov qword ptr [rbp + 0x480], rax
0000000145b45237: 488d05d419a801                 lea rax, [rip + 0x1a819d4]
0000000145b4523e: 48898588040000                 mov qword ptr [rbp + 0x488], rax
0000000145b45245: 48c7859004000014000000         mov qword ptr [rbp + 0x490], 0x14
0000000145b45250: c7859804000032000000           mov dword ptr [rbp + 0x498], 0x32
0000000145b4525a: c685a004000009                 mov byte ptr [rbp + 0x4a0], 9
0000000145b45261: c685a104000000                 mov byte ptr [rbp + 0x4a1], 0
0000000145b45268: c785a404000072050000           mov dword ptr [rbp + 0x4a4], 0x572
0000000145b45272: 488d058719a801                 lea rax, [rip + 0x1a81987]
0000000145b45279: 488985a8040000                 mov qword ptr [rbp + 0x4a8], rax
0000000145b45280: 48c785b004000001000000         mov qword ptr [rbp + 0x4b0], 1
0000000145b4528b: 48c785b804000002000000         mov qword ptr [rbp + 0x4b8], 2
0000000145b45296: 488d055619a801                 lea rax, [rip + 0x1a81956]
0000000145b4529d: 488985c0040000                 mov qword ptr [rbp + 0x4c0], rax
0000000145b452a4: 48c785c80400000c000000         mov qword ptr [rbp + 0x4c8], 0xc
0000000145b452af: c685d004000002                 mov byte ptr [rbp + 0x4d0], 2
0000000145b452b6: 488d05c319a801                 lea rax, [rip + 0x1a819c3]
0000000145b452bd: 488985d8040000                 mov qword ptr [rbp + 0x4d8], rax
0000000145b452c4: 48c785e004000012000000         mov qword ptr [rbp + 0x4e0], 0x12
0000000145b452cf: 488b85780d0000                 mov rax, qword ptr [rbp + 0xd78]
0000000145b452d6: 488985e8040000                 mov qword ptr [rbp + 0x4e8], rax
0000000145b452dd: 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145b452e4: 488985f0040000                 mov qword ptr [rbp + 0x4f0], rax
0000000145b452eb: 488b85d80b0000                 mov rax, qword ptr [rbp + 0xbd8]
0000000145b452f2: 488985f8040000                 mov qword ptr [rbp + 0x4f8], rax
0000000145b452f9: 488b85e00b0000                 mov rax, qword ptr [rbp + 0xbe0]
0000000145b45300: 48898500050000                 mov qword ptr [rbp + 0x500], rax
0000000145b45307: 488d058419a801                 lea rax, [rip + 0x1a81984]
0000000145b4530e: 48898508050000                 mov qword ptr [rbp + 0x508], rax
0000000145b45315: 48c7851005000019000000         mov qword ptr [rbp + 0x510], 0x19
0000000145b45320: c7851805000019000000           mov dword ptr [rbp + 0x518], 0x19
0000000145b4532a: c6852005000014                 mov byte ptr [rbp + 0x520], 0x14
0000000145b45331: 488d052819a801                 lea rax, [rip + 0x1a81928]
0000000145b45338: 48898528050000                 mov qword ptr [rbp + 0x528], rax
0000000145b4533f: 48c7853005000002000000         mov qword ptr [rbp + 0x530], 2
0000000145b4534a: 488d05071aa801                 lea rax, [rip + 0x1a81a07]
0000000145b45351: 48898558050000                 mov qword ptr [rbp + 0x558], rax
0000000145b45358: 48c785600500000c000000         mov qword ptr [rbp + 0x560], 0xc
0000000145b45363: 488b85e80b0000                 mov rax, qword ptr [rbp + 0xbe8]
0000000145b4536a: 48898568050000                 mov qword ptr [rbp + 0x568], rax
0000000145b45371: 488b85f00b0000                 mov rax, qword ptr [rbp + 0xbf0]
0000000145b45378: 48898570050000                 mov qword ptr [rbp + 0x570], rax
0000000145b4537f: 4889b578050000                 mov qword ptr [rbp + 0x578], rsi
0000000145b45386: 488b85f80b0000                 mov rax, qword ptr [rbp + 0xbf8]
0000000145b4538d: 48898580050000                 mov qword ptr [rbp + 0x580], rax
0000000145b45394: 488d05c919a801                 lea rax, [rip + 0x1a819c9]
0000000145b4539b: 48898588050000                 mov qword ptr [rbp + 0x588], rax
0000000145b453a2: 48c7859005000017000000         mov qword ptr [rbp + 0x590], 0x17
0000000145b453ad: c7859805000032000000           mov dword ptr [rbp + 0x598], 0x32
0000000145b453b7: c685a005000009                 mov byte ptr [rbp + 0x5a0], 9
0000000145b453be: c685a105000000                 mov byte ptr [rbp + 0x5a1], 0
0000000145b453c5: c785a405000046040000           mov dword ptr [rbp + 0x5a4], 0x446
0000000145b453cf: 488d057a19a801                 lea rax, [rip + 0x1a8197a]
0000000145b453d6: 488985a8050000                 mov qword ptr [rbp + 0x5a8], rax
0000000145b453dd: 48c785b005000002000000         mov qword ptr [rbp + 0x5b0], 2
0000000145b453e8: 48c785b805000002000000         mov qword ptr [rbp + 0x5b8], 2
0000000145b453f3: 488d054b19a801                 lea rax, [rip + 0x1a8194b]
0000000145b453fa: 488985c0050000                 mov qword ptr [rbp + 0x5c0], rax
0000000145b45401: 48c785c80500000b000000         mov qword ptr [rbp + 0x5c8], 0xb
0000000145b4540c: c685d005000007                 mov byte ptr [rbp + 0x5d0], 7
0000000145b45413: 488d05c819a801                 lea rax, [rip + 0x1a819c8]
0000000145b4541a: 488985d8050000                 mov qword ptr [rbp + 0x5d8], rax
0000000145b45421: 48c785e00500000c000000         mov qword ptr [rbp + 0x5e0], 0xc
0000000145b4542c: 488b85080c0000                 mov rax, qword ptr [rbp + 0xc08]
0000000145b45433: 488985e8050000                 mov qword ptr [rbp + 0x5e8], rax
0000000145b4543a: 488b85000c0000                 mov rax, qword ptr [rbp + 0xc00]
0000000145b45441: 488985f0050000                 mov qword ptr [rbp + 0x5f0], rax
0000000145b45448: 4c89bdf8050000                 mov qword ptr [rbp + 0x5f8], r15
0000000145b4544f: 488b85100c0000                 mov rax, qword ptr [rbp + 0xc10]
0000000145b45456: 48898500060000                 mov qword ptr [rbp + 0x600], rax
0000000145b4545d: 488d058a19a801                 lea rax, [rip + 0x1a8198a]
0000000145b45464: 48898508060000                 mov qword ptr [rbp + 0x608], rax
0000000145b4546b: 48c785100600001b000000         mov qword ptr [rbp + 0x610], 0x1b
0000000145b45476: c7851806000032000000           mov dword ptr [rbp + 0x618], 0x32
0000000145b45480: c6852006000009                 mov byte ptr [rbp + 0x620], 9
0000000145b45487: c6852106000001                 mov byte ptr [rbp + 0x621], 1
0000000145b4548e: c78524060000aa040000           mov dword ptr [rbp + 0x624], 0x4aa
0000000145b45498: 48c7852806000004000000         mov qword ptr [rbp + 0x628], 4
0000000145b454a3: 48c7853006000000000000         mov qword ptr [rbp + 0x630], 0
0000000145b454ae: 48c7853806000003000000         mov qword ptr [rbp + 0x638], 3
0000000145b454b9: 488d059519a801                 lea rax, [rip + 0x1a81995]
0000000145b454c0: 48898558060000                 mov qword ptr [rbp + 0x658], rax
0000000145b454c7: 48c7856006000008000000         mov qword ptr [rbp + 0x660], 8
0000000145b454d2: 4c89ad68060000                 mov qword ptr [rbp + 0x668], r13
0000000145b454d9: 48899d70060000                 mov qword ptr [rbp + 0x670], rbx
0000000145b454e0: 4889bd78060000                 mov qword ptr [rbp + 0x678], rdi
0000000145b454e7: 48899580060000                 mov qword ptr [rbp + 0x680], rdx
0000000145b454ee: 488d056819a801                 lea rax, [rip + 0x1a81968]
0000000145b454f5: 48898588060000                 mov qword ptr [rbp + 0x688], rax
0000000145b454fc: 48c7859006000018000000         mov qword ptr [rbp + 0x690], 0x18
0000000145b45507: c7859806000032000000           mov dword ptr [rbp + 0x698], 0x32
0000000145b45511: c685a006000014                 mov byte ptr [rbp + 0x6a0], 0x14
0000000145b45518: 48c785a806000008000000         mov qword ptr [rbp + 0x6a8], 8
0000000145b45523: 48c785b006000000000000         mov qword ptr [rbp + 0x6b0], 0
0000000145b4552e: 488b45c8                       mov rax, qword ptr [rbp - 0x38]
0000000145b45532: 483945d0                       cmp qword ptr [rbp - 0x30], rax
0000000145b45536: 0f85ed030000                   jne 0x145b45929
; cooperative-constructor-copy 0x145b45929..0x145b45bee sha256=105b2cc6d838bc03224cb93ee1fb40a72f9b266e619ce167c7f8d9dbc17e2eb6
0000000145b45929: 488d4801                       lea rcx, [rax + 1]
0000000145b4592d: 48894dc8                       mov qword ptr [rbp - 0x38], rcx
0000000145b45931: 48c1e007                       shl rax, 7
0000000145b45935: 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145b45939: 0fb67c0148                     movzx edi, byte ptr [rcx + rax + 0x48]
0000000145b4593e: 4080ffff                       cmp dil, 0xff
0000000145b45942: 0f84f4fbffff                   je 0x145b4553c
0000000145b45948: 488d55d8                       lea rdx, [rbp - 0x28]
0000000145b4594c: 488d0c02                       lea rcx, [rdx + rax]
0000000145b45950: 4c8b2c02                       mov r13, qword ptr [rdx + rax]
0000000145b45954: 4c8b440208                     mov r8, qword ptr [rdx + rax + 8]
0000000145b45959: 4c8b640210                     mov r12, qword ptr [rdx + rax + 0x10]
0000000145b4595e: 4c8b4c0218                     mov r9, qword ptr [rdx + rax + 0x18]
0000000145b45963: 4c898d400e0000                 mov qword ptr [rbp + 0xe40], r9
0000000145b4596a: 4c8b7c0220                     mov r15, qword ptr [rdx + rax + 0x20]
0000000145b4596f: 4c8b740228                     mov r14, qword ptr [rdx + rax + 0x28]
0000000145b45974: 4c8b4c0230                     mov r9, qword ptr [rdx + rax + 0x30]
0000000145b45979: 4c898d100e0000                 mov qword ptr [rbp + 0xe10], r9
0000000145b45980: 4c8b4c0238                     mov r9, qword ptr [rdx + rax + 0x38]
0000000145b45985: 4c898d000e0000                 mov qword ptr [rbp + 0xe00], r9
0000000145b4598c: 8b5c0240                       mov ebx, dword ptr [rdx + rax + 0x40]
0000000145b45990: 488b4178                       mov rax, qword ptr [rcx + 0x78]
0000000145b45994: 488985af0b0000                 mov qword ptr [rbp + 0xbaf], rax
0000000145b4599b: 0f104149                       movups xmm0, xmmword ptr [rcx + 0x49]
0000000145b4599f: 0f104959                       movups xmm1, xmmword ptr [rcx + 0x59]
0000000145b459a3: 0f105169                       movups xmm2, xmmword ptr [rcx + 0x69]
0000000145b459a7: 0f2995a00b0000                 movaps xmmword ptr [rbp + 0xba0], xmm2
0000000145b459ae: 0f298d900b0000                 movaps xmmword ptr [rbp + 0xb90], xmm1
0000000145b459b5: 0f2985800b0000                 movaps xmmword ptr [rbp + 0xb80], xmm0
0000000145b459bc: 4c8985300e0000                 mov qword ptr [rbp + 0xe30], r8
0000000145b459c3: 4d85c0                         test r8, r8
0000000145b459c6: 0f8837020000                   js 0x145b45c03
0000000145b459cc: 7443                           je 0x145b45a11
0000000145b459ce: e82dc84bfa                     call 0x140002200
0000000145b459d3: be01000000                     mov esi, 1
0000000145b459d8: ba01000000                     mov edx, 1
0000000145b459dd: 488b8d300e0000                 mov rcx, qword ptr [rbp + 0xe30]
0000000145b459e4: e8d7c74bfa                     call 0x1400021c0
0000000145b459e9: 488985380e0000                 mov qword ptr [rbp + 0xe38], rax
0000000145b459f0: 4885c0                         test rax, rax
0000000145b459f3: 0f8426030000                   je 0x145b45d1f
0000000145b459f9: 488b8d380e0000                 mov rcx, qword ptr [rbp + 0xe38]
0000000145b45a00: 4c89ea                         mov rdx, r13
0000000145b45a03: 4c8b85300e0000                 mov r8, qword ptr [rbp + 0xe30]
0000000145b45a0a: e8cce24400                     call 0x145f93cdb
0000000145b45a0f: eb0c                           jmp 0x145b45a1d
0000000145b45a11: b801000000                     mov eax, 1
0000000145b45a16: 488985380e0000                 mov qword ptr [rbp + 0xe38], rax
0000000145b45a1d: 4883bd400e000000               cmp qword ptr [rbp + 0xe40], 0
0000000145b45a25: 0f8804020000                   js 0x145b45c2f
0000000145b45a2b: 7444                           je 0x145b45a71
0000000145b45a2d: e8cec74bfa                     call 0x140002200
0000000145b45a32: 41bd01000000                   mov r13d, 1
0000000145b45a38: ba01000000                     mov edx, 1
0000000145b45a3d: 488b8d400e0000                 mov rcx, qword ptr [rbp + 0xe40]
0000000145b45a44: e877c74bfa                     call 0x1400021c0
0000000145b45a49: 488985200e0000                 mov qword ptr [rbp + 0xe20], rax
0000000145b45a50: 4885c0                         test rax, rax
0000000145b45a53: 0f84d9020000                   je 0x145b45d32
0000000145b45a59: 488b8d200e0000                 mov rcx, qword ptr [rbp + 0xe20]
0000000145b45a60: 4c89e2                         mov rdx, r12
0000000145b45a63: 4c8b85400e0000                 mov r8, qword ptr [rbp + 0xe40]
0000000145b45a6a: e86ce24400                     call 0x145f93cdb
0000000145b45a6f: eb0c                           jmp 0x145b45a7d
0000000145b45a71: b801000000                     mov eax, 1
0000000145b45a76: 488985200e0000                 mov qword ptr [rbp + 0xe20], rax
0000000145b45a7d: 4d85f6                         test r14, r14
0000000145b45a80: 0f88c5010000                   js 0x145b45c4b
0000000145b45a86: 743c                           je 0x145b45ac4
0000000145b45a88: e873c74bfa                     call 0x140002200
0000000145b45a8d: 41bc01000000                   mov r12d, 1
0000000145b45a93: ba01000000                     mov edx, 1
0000000145b45a98: 4c89f1                         mov rcx, r14
0000000145b45a9b: e820c74bfa                     call 0x1400021c0
0000000145b45aa0: 488985f80d0000                 mov qword ptr [rbp + 0xdf8], rax
0000000145b45aa7: 4885c0                         test rax, rax
0000000145b45aaa: 0f8495020000                   je 0x145b45d45
0000000145b45ab0: 488b8df80d0000                 mov rcx, qword ptr [rbp + 0xdf8]
0000000145b45ab7: 4c89fa                         mov rdx, r15
0000000145b45aba: 4d89f0                         mov r8, r14
0000000145b45abd: e819e24400                     call 0x145f93cdb
0000000145b45ac2: eb0c                           jmp 0x145b45ad0
0000000145b45ac4: b801000000                     mov eax, 1
0000000145b45ac9: 488985f80d0000                 mov qword ptr [rbp + 0xdf8], rax
0000000145b45ad0: 488b85af0b0000                 mov rax, qword ptr [rbp + 0xbaf]
0000000145b45ad7: 488d8d610c0000                 lea rcx, [rbp + 0xc61]
0000000145b45ade: 4889412f                       mov qword ptr [rcx + 0x2f], rax
0000000145b45ae2: 0f2885800b0000                 movaps xmm0, xmmword ptr [rbp + 0xb80]
0000000145b45ae9: 0f288d900b0000                 movaps xmm1, xmmword ptr [rbp + 0xb90]
0000000145b45af0: 0f2895a00b0000                 movaps xmm2, xmmword ptr [rbp + 0xba0]
0000000145b45af7: 0f115120                       movups xmmword ptr [rcx + 0x20], xmm2
0000000145b45afb: 0f114910                       movups xmmword ptr [rcx + 0x10], xmm1
0000000145b45aff: 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145b45b02: 488b8d300e0000                 mov rcx, qword ptr [rbp + 0xe30]
0000000145b45b09: 48898d180c0000                 mov qword ptr [rbp + 0xc18], rcx
0000000145b45b10: 488b85380e0000                 mov rax, qword ptr [rbp + 0xe38]
0000000145b45b17: 488985200c0000                 mov qword ptr [rbp + 0xc20], rax
0000000145b45b1e: 48898d280c0000                 mov qword ptr [rbp + 0xc28], rcx
0000000145b45b25: 488b8d400e0000                 mov rcx, qword ptr [rbp + 0xe40]
0000000145b45b2c: 48898d300c0000                 mov qword ptr [rbp + 0xc30], rcx
0000000145b45b33: 488b85200e0000                 mov rax, qword ptr [rbp + 0xe20]
0000000145b45b3a: 488985380c0000                 mov qword ptr [rbp + 0xc38], rax
0000000145b45b41: 48898d400c0000                 mov qword ptr [rbp + 0xc40], rcx
0000000145b45b48: 4c89b5480c0000                 mov qword ptr [rbp + 0xc48], r14
0000000145b45b4f: 488b85f80d0000                 mov rax, qword ptr [rbp + 0xdf8]
0000000145b45b56: 488985500c0000                 mov qword ptr [rbp + 0xc50], rax
0000000145b45b5d: 4c89b5580c0000                 mov qword ptr [rbp + 0xc58], r14
0000000145b45b64: 899da80c0000                   mov dword ptr [rbp + 0xca8], ebx
0000000145b45b6a: c685ac0c000005                 mov byte ptr [rbp + 0xcac], 5
0000000145b45b71: 488b85100e0000                 mov rax, qword ptr [rbp + 0xe10]
0000000145b45b78: 488985980c0000                 mov qword ptr [rbp + 0xc98], rax
0000000145b45b7f: 488b85000e0000                 mov rax, qword ptr [rbp + 0xe00]
0000000145b45b86: 488985a00c0000                 mov qword ptr [rbp + 0xca0], rax
0000000145b45b8d: 4088bd600c0000                 mov byte ptr [rbp + 0xc60], dil
0000000145b45b94: 488bb5d80d0000                 mov rsi, qword ptr [rbp + 0xdd8]
0000000145b45b9b: 483bb5c80d0000                 cmp rsi, qword ptr [rbp + 0xdc8]
0000000145b45ba2: 750d                           jne 0x145b45bb1
0000000145b45ba4: 488d8dc80d0000                 lea rcx, [rbp + 0xdc8]
0000000145b45bab: e8c0294b00                     call 0x145ff8570
0000000145b45bb0: 90                             nop
0000000145b45bb1: 4869ce98000000                 imul rcx, rsi, 0x98
0000000145b45bb8: 48038dd00d0000                 add rcx, qword ptr [rbp + 0xdd0]
0000000145b45bbf: 41b898000000                   mov r8d, 0x98
0000000145b45bc5: 488d95180c0000                 lea rdx, [rbp + 0xc18]
0000000145b45bcc: e80ae14400                     call 0x145f93cdb
0000000145b45bd1: 48ffc6                         inc rsi
0000000145b45bd4: 4889b5d80d0000                 mov qword ptr [rbp + 0xdd8], rsi
0000000145b45bdb: 488b45c8                       mov rax, qword ptr [rbp - 0x38]
0000000145b45bdf: 483945d0                       cmp qword ptr [rbp - 0x30], rax
0000000145b45be3: 0f8540fdffff                   jne 0x145b45929
0000000145b45be9: e94ef9ffff                     jmp 0x145b4553c
; party-composition 0x145b39980..0x145b39c91 sha256=5ee36a40fc4fb97434c68b11df09a51ce99cbc20c6d1e8ef28739cb8d32c523b
0000000145b39980: 4156                           push r14
0000000145b39982: 56                             push rsi
0000000145b39983: 57                             push rdi
0000000145b39984: 55                             push rbp
0000000145b39985: 53                             push rbx
0000000145b39986: 4883ec20                       sub rsp, 0x20
0000000145b3998a: 488b01                         mov rax, qword ptr [rcx]
0000000145b3998d: 4989c1                         mov r9, rax
0000000145b39990: 4983e903                       sub r9, 3
0000000145b39994: 41ba03000000                   mov r10d, 3
0000000145b3999a: 4d0f43d1                       cmovae r10, r9
0000000145b3999e: 4c8d0d1b74a901                 lea r9, [rip + 0x1a9741b]
0000000145b399a5: 4f631491                       movsxd r10, dword ptr [r9 + r10*4]
0000000145b399a9: 4d01ca                         add r10, r9
0000000145b399ac: 41ffe2                         jmp r10
0000000145b399af: 4d85c0                         test r8, r8
0000000145b399b2: 0f95c0                         setne al
0000000145b399b5: e928010000                     jmp 0x145b39ae2
0000000145b399ba: 4983f805                       cmp r8, 5
0000000145b399be: 0f851c010000                   jne 0x145b39ae0
0000000145b399c4: 0fb64204                       movzx eax, byte ptr [rdx + 4]
0000000145b399c8: 38420c                         cmp byte ptr [rdx + 0xc], al
0000000145b399cb: 0f850f010000                   jne 0x145b39ae0
0000000145b399d1: 384214                         cmp byte ptr [rdx + 0x14], al
0000000145b399d4: 0f8506010000                   jne 0x145b39ae0
0000000145b399da: 38421c                         cmp byte ptr [rdx + 0x1c], al
0000000145b399dd: 0f85fd000000                   jne 0x145b39ae0
0000000145b399e3: 384224                         cmp byte ptr [rdx + 0x24], al
0000000145b399e6: 0f94c0                         sete al
0000000145b399e9: e9f4000000                     jmp 0x145b39ae2
0000000145b399ee: 4983f805                       cmp r8, 5
0000000145b399f2: 0f85e8000000                   jne 0x145b39ae0
0000000145b399f8: 0fb65918                       movzx ebx, byte ptr [rcx + 0x18]
0000000145b399fc: 4885c0                         test rax, rax
0000000145b399ff: 0f84da010000                   je 0x145b39bdf
0000000145b39a05: 488b7108                       mov rsi, qword ptr [rcx + 8]
0000000145b39a09: 488b7910                       mov rdi, qword ptr [rcx + 0x10]
0000000145b39a0d: 83f801                         cmp eax, 1
0000000145b39a10: 0f8423010000                   je 0x145b39b39
0000000145b39a16: 83f802                         cmp eax, 2
0000000145b39a19: 0f85c1000000                   jne 0x145b39ae0
0000000145b39a1f: 385a04                         cmp byte ptr [rdx + 4], bl
0000000145b39a22: 0f85b8000000                   jne 0x145b39ae0
0000000145b39a28: 8b2a                           mov ebp, dword ptr [rdx]
0000000145b39a2a: 85ed                           test ebp, ebp
0000000145b39a2c: 0f84ae000000                   je 0x145b39ae0
0000000145b39a32: 4989d6                         mov r14, rdx
0000000145b39a35: 4889f1                         mov rcx, rsi
0000000145b39a38: 4889fa                         mov rdx, rdi
0000000145b39a3b: e8d017f4ff                     call 0x145a7b210
0000000145b39a40: 3b6840                         cmp ebp, dword ptr [rax + 0x40]
0000000145b39a43: 0f8597000000                   jne 0x145b39ae0
0000000145b39a49: 41385e0c                       cmp byte ptr [r14 + 0xc], bl
0000000145b39a4d: 0f858d000000                   jne 0x145b39ae0
0000000145b39a53: 418b6e08                       mov ebp, dword ptr [r14 + 8]
0000000145b39a57: 85ed                           test ebp, ebp
0000000145b39a59: 0f8481000000                   je 0x145b39ae0
0000000145b39a5f: 4889f1                         mov rcx, rsi
0000000145b39a62: 4889fa                         mov rdx, rdi
0000000145b39a65: e8a617f4ff                     call 0x145a7b210
0000000145b39a6a: 3b6840                         cmp ebp, dword ptr [rax + 0x40]
0000000145b39a6d: 7571                           jne 0x145b39ae0
0000000145b39a6f: 41385e14                       cmp byte ptr [r14 + 0x14], bl
0000000145b39a73: 756b                           jne 0x145b39ae0
0000000145b39a75: 418b6e10                       mov ebp, dword ptr [r14 + 0x10]
0000000145b39a79: 85ed                           test ebp, ebp
0000000145b39a7b: 7463                           je 0x145b39ae0
0000000145b39a7d: 4889f1                         mov rcx, rsi
0000000145b39a80: 4889fa                         mov rdx, rdi
0000000145b39a83: e88817f4ff                     call 0x145a7b210
0000000145b39a88: 3b6840                         cmp ebp, dword ptr [rax + 0x40]
0000000145b39a8b: 7553                           jne 0x145b39ae0
0000000145b39a8d: 41385e1c                       cmp byte ptr [r14 + 0x1c], bl
0000000145b39a91: 754d                           jne 0x145b39ae0
0000000145b39a93: 418b6e18                       mov ebp, dword ptr [r14 + 0x18]
0000000145b39a97: 85ed                           test ebp, ebp
0000000145b39a99: 7445                           je 0x145b39ae0
0000000145b39a9b: 4889f1                         mov rcx, rsi
0000000145b39a9e: 4889fa                         mov rdx, rdi
0000000145b39aa1: e86a17f4ff                     call 0x145a7b210
0000000145b39aa6: 3b6840                         cmp ebp, dword ptr [rax + 0x40]
0000000145b39aa9: 7535                           jne 0x145b39ae0
0000000145b39aab: 41385e24                       cmp byte ptr [r14 + 0x24], bl
0000000145b39aaf: 752f                           jne 0x145b39ae0
0000000145b39ab1: 418b5e20                       mov ebx, dword ptr [r14 + 0x20]
0000000145b39ab5: 85db                           test ebx, ebx
0000000145b39ab7: 7427                           je 0x145b39ae0
0000000145b39ab9: 4889f1                         mov rcx, rsi
0000000145b39abc: 4889fa                         mov rdx, rdi
0000000145b39abf: e84c17f4ff                     call 0x145a7b210
0000000145b39ac4: 3b5840                         cmp ebx, dword ptr [rax + 0x40]
0000000145b39ac7: 0f94c0                         sete al
0000000145b39aca: eb16                           jmp 0x145b39ae2
0000000145b39acc: 4983f805                       cmp r8, 5
0000000145b39ad0: 750e                           jne 0x145b39ae0
0000000145b39ad2: 440fb64a04                     movzx r9d, byte ptr [rdx + 4]
0000000145b39ad7: 0fb64a0c                       movzx ecx, byte ptr [rdx + 0xc]
0000000145b39adb: 4138c9                         cmp r9b, cl
0000000145b39ade: 750f                           jne 0x145b39aef
0000000145b39ae0: 31c0                           xor eax, eax
0000000145b39ae2: 2401                           and al, 1
0000000145b39ae4: 4883c420                       add rsp, 0x20
0000000145b39ae8: 5b                             pop rbx
0000000145b39ae9: 5d                             pop rbp
0000000145b39aea: 5f                             pop rdi
0000000145b39aeb: 5e                             pop rsi
0000000145b39aec: 415e                           pop r14
0000000145b39aee: c3                             ret
0000000145b39aef: 440fb64214                     movzx r8d, byte ptr [rdx + 0x14]
0000000145b39af4: 31c0                           xor eax, eax
0000000145b39af6: 4538c1                         cmp r9b, r8b
0000000145b39af9: 74e7                           je 0x145b39ae2
0000000145b39afb: 4438c1                         cmp cl, r8b
0000000145b39afe: 74e2                           je 0x145b39ae2
0000000145b39b00: 440fb6521c                     movzx r10d, byte ptr [rdx + 0x1c]
0000000145b39b05: 31c0                           xor eax, eax
0000000145b39b07: 4538d0                         cmp r8b, r10b
0000000145b39b0a: 74d6                           je 0x145b39ae2
0000000145b39b0c: 4538d1                         cmp r9b, r10b
0000000145b39b0f: 74d1                           je 0x145b39ae2
0000000145b39b11: 4438d1                         cmp cl, r10b
0000000145b39b14: 74cc                           je 0x145b39ae2
0000000145b39b16: 0fb64224                       movzx eax, byte ptr [rdx + 0x24]
0000000145b39b1a: 4138c1                         cmp r9b, al
0000000145b39b1d: 0f95c2                         setne dl
0000000145b39b20: 38c1                           cmp cl, al
0000000145b39b22: 0f95c1                         setne cl
0000000145b39b25: 20d1                           and cl, dl
0000000145b39b27: 4138c0                         cmp r8b, al
0000000145b39b2a: 0f95c2                         setne dl
0000000145b39b2d: 4138c2                         cmp r10b, al
0000000145b39b30: 0f95c0                         setne al
0000000145b39b33: 20d0                           and al, dl
0000000145b39b35: 20c8                           and al, cl
0000000145b39b37: eba9                           jmp 0x145b39ae2
0000000145b39b39: 0fb64204                       movzx eax, byte ptr [rdx + 4]
0000000145b39b3d: 4883ff0b                       cmp rdi, 0xb
0000000145b39b41: 0f84c7000000                   je 0x145b39c0e
0000000145b39b47: 4883ff0a                       cmp rdi, 0xa
0000000145b39b4b: 7593                           jne 0x145b39ae0
0000000145b39b4d: 38d8                           cmp al, bl
0000000145b39b4f: 758f                           jne 0x145b39ae0
0000000145b39b51: 440fb64205                     movzx r8d, byte ptr [rdx + 5]
0000000145b39b56: 49b9626c61646573746f           movabs r9, 0x6f74736564616c62
0000000145b39b60: 4c330e                         xor r9, qword ptr [rsi]
0000000145b39b63: 440fb75608                     movzx r10d, word ptr [rsi + 8]
0000000145b39b68: 4981f2726d0000                 xor r10, 0x6d72
0000000145b39b6f: 4c89c8                         mov rax, r9
0000000145b39b72: 4c09d0                         or rax, r10
0000000145b39b75: 0f94c1                         sete cl
0000000145b39b78: 41d2e8                         shr r8b, cl
0000000145b39b7b: 31c0                           xor eax, eax
0000000145b39b7d: 4d09ca                         or r10, r9
0000000145b39b80: 0f855cffffff                   jne 0x145b39ae2
0000000145b39b86: 41f6c001                       test r8b, 1
0000000145b39b8a: 0f8452ffffff                   je 0x145b39ae2
0000000145b39b90: 385a0c                         cmp byte ptr [rdx + 0xc], bl
0000000145b39b93: 0f8547ffffff                   jne 0x145b39ae0
0000000145b39b99: f6420d02                       test byte ptr [rdx + 0xd], 2
0000000145b39b9d: 0f843dffffff                   je 0x145b39ae0
0000000145b39ba3: 385a14                         cmp byte ptr [rdx + 0x14], bl
0000000145b39ba6: 0f8534ffffff                   jne 0x145b39ae0
0000000145b39bac: f6421502                       test byte ptr [rdx + 0x15], 2
0000000145b39bb0: 0f842affffff                   je 0x145b39ae0
0000000145b39bb6: 385a1c                         cmp byte ptr [rdx + 0x1c], bl
0000000145b39bb9: 0f8521ffffff                   jne 0x145b39ae0
0000000145b39bbf: f6421d02                       test byte ptr [rdx + 0x1d], 2
0000000145b39bc3: 0f8417ffffff                   je 0x145b39ae0
0000000145b39bc9: 385a24                         cmp byte ptr [rdx + 0x24], bl
0000000145b39bcc: 0f850effffff                   jne 0x145b39ae0
0000000145b39bd2: 0fb64225                       movzx eax, byte ptr [rdx + 0x25]
0000000145b39bd6: 2402                           and al, 2
0000000145b39bd8: d0e8                           shr al, 1
0000000145b39bda: e903ffffff                     jmp 0x145b39ae2
0000000145b39bdf: 385a04                         cmp byte ptr [rdx + 4], bl
0000000145b39be2: 0f85f8feffff                   jne 0x145b39ae0
0000000145b39be8: 385a0c                         cmp byte ptr [rdx + 0xc], bl
0000000145b39beb: 0f85effeffff                   jne 0x145b39ae0
0000000145b39bf1: 385a14                         cmp byte ptr [rdx + 0x14], bl
0000000145b39bf4: 0f85e6feffff                   jne 0x145b39ae0
0000000145b39bfa: 385a1c                         cmp byte ptr [rdx + 0x1c], bl
0000000145b39bfd: 0f85ddfeffff                   jne 0x145b39ae0
0000000145b39c03: 385a24                         cmp byte ptr [rdx + 0x24], bl
0000000145b39c06: 0f94c0                         sete al
0000000145b39c09: e9d4feffff                     jmp 0x145b39ae2
0000000145b39c0e: 38d8                           cmp al, bl
0000000145b39c10: 0f85cafeffff                   jne 0x145b39ae0
0000000145b39c16: 48b97472616e7175696c           movabs rcx, 0x6c6975716e617274
0000000145b39c20: 48330e                         xor rcx, qword ptr [rsi]
0000000145b39c23: 49b86e7175696c697479           movabs r8, 0x7974696c6975716e
0000000145b39c2d: 4c334603                       xor r8, qword ptr [rsi + 3]
0000000145b39c31: 31c0                           xor eax, eax
0000000145b39c33: 4909c8                         or r8, rcx
0000000145b39c36: 0f85a6feffff                   jne 0x145b39ae2
0000000145b39c3c: f6420501                       test byte ptr [rdx + 5], 1
0000000145b39c40: 0f849cfeffff                   je 0x145b39ae2
0000000145b39c46: 385a0c                         cmp byte ptr [rdx + 0xc], bl
0000000145b39c49: 0f8591feffff                   jne 0x145b39ae0
0000000145b39c4f: f6420d01                       test byte ptr [rdx + 0xd], 1
0000000145b39c53: 0f8487feffff                   je 0x145b39ae0
0000000145b39c59: 385a14                         cmp byte ptr [rdx + 0x14], bl
0000000145b39c5c: 0f857efeffff                   jne 0x145b39ae0
0000000145b39c62: f6421501                       test byte ptr [rdx + 0x15], 1
0000000145b39c66: 0f8474feffff                   je 0x145b39ae0
0000000145b39c6c: 385a1c                         cmp byte ptr [rdx + 0x1c], bl
0000000145b39c6f: 0f856bfeffff                   jne 0x145b39ae0
0000000145b39c75: f6421d01                       test byte ptr [rdx + 0x1d], 1
0000000145b39c79: 0f8461feffff                   je 0x145b39ae0
0000000145b39c7f: 385a24                         cmp byte ptr [rdx + 0x24], bl
0000000145b39c82: 0f8558feffff                   jne 0x145b39ae0
0000000145b39c88: 0fb64225                       movzx eax, byte ptr [rdx + 0x25]
0000000145b39c8c: e951feffff                     jmp 0x145b39ae2
; ability-key-lookup 0x145a7b210..0x145a7b2a7 sha256=aafecf077fdefe9482247c75fc186a54cb3d738a85b56e63e503e2d498fc4b7f
0000000145a7b210: 4156                           push r14
0000000145a7b212: 56                             push rsi
0000000145a7b213: 57                             push rdi
0000000145a7b214: 53                             push rbx
0000000145a7b215: 4883ec48                       sub rsp, 0x48
0000000145a7b219: 4889d6                         mov rsi, rdx
0000000145a7b21c: 4889cf                         mov rdi, rcx
0000000145a7b21f: 48894c2428                     mov qword ptr [rsp + 0x28], rcx
0000000145a7b224: 4889542430                     mov qword ptr [rsp + 0x30], rdx
0000000145a7b229: 4531f6                         xor r14d, r14d
0000000145a7b22c: 488d1d55368201                 lea rbx, [rip + 0x1823655]
0000000145a7b233: eb18                           jmp 0x145a7b24d
0000000145a7b235: 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145a7b240: 4983c678                       add r14, 0x78
0000000145a7b244: 4981fef8340000                 cmp r14, 0x34f8
0000000145a7b24b: 742a                           je 0x145a7b277
0000000145a7b24d: 4939741e08                     cmp qword ptr [r14 + rbx + 8], rsi
0000000145a7b252: 75ec                           jne 0x145a7b240
0000000145a7b254: 498b0c1e                       mov rcx, qword ptr [r14 + rbx]
0000000145a7b258: 4889fa                         mov rdx, rdi
0000000145a7b25b: 4989f0                         mov r8, rsi
0000000145a7b25e: e8848a5100                     call 0x145f93ce7
0000000145a7b263: 85c0                           test eax, eax
0000000145a7b265: 75d9                           jne 0x145a7b240
0000000145a7b267: 4c01f3                         add rbx, r14
0000000145a7b26a: 4889d8                         mov rax, rbx
0000000145a7b26d: 4883c448                       add rsp, 0x48
0000000145a7b271: 5b                             pop rbx
0000000145a7b272: 5f                             pop rdi
0000000145a7b273: 5e                             pop rsi
0000000145a7b274: 415e                           pop r14
0000000145a7b276: c3                             ret
0000000145a7b277: 488d442428                     lea rax, [rsp + 0x28]
0000000145a7b27c: 4889442438                     mov qword ptr [rsp + 0x38], rax
0000000145a7b281: 488d05386e58fa                 lea rax, [rip - 0x5a791c8]
0000000145a7b288: 4889442440                     mov qword ptr [rsp + 0x40], rax
0000000145a7b28d: 488d0ddc278201                 lea rcx, [rip + 0x18227dc]
0000000145a7b294: 4c8d05e5278201                 lea r8, [rip + 0x18227e5]
0000000145a7b29b: 488d542438                     lea rdx, [rsp + 0x38]
0000000145a7b2a0: e88bff6b00                     call 0x14613b230
0000000145a7b2a5: 0f0b                           ud2
; category-name 0x145b338f0..0x145b3397f sha256=9352f8672900018d2e80bb0b403b1537543ebd7aa1f17a08266ff9f01d146078
0000000145b338f0: 56                             push rsi
0000000145b338f1: 57                             push rdi
0000000145b338f2: 4883ec28                       sub rsp, 0x28
0000000145b338f6: 0fb6c1                         movzx eax, cl
0000000145b338f9: 488d0da8d4a901                 lea rcx, [rip + 0x1a9d4a8]
0000000145b33900: 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145b33904: 4801c8                         add rax, rcx
0000000145b33907: ffe0                           jmp rax
0000000145b33909: 488d358836a901                 lea rsi, [rip + 0x1a93688]
0000000145b33910: eb49                           jmp 0x145b3395b
0000000145b33912: 488d359a36a901                 lea rsi, [rip + 0x1a9369a]
0000000145b33919: bf08000000                     mov edi, 8
0000000145b3391e: ba08000000                     mov edx, 8
0000000145b33923: eb40                           jmp 0x145b33965
0000000145b33925: 488d357836a901                 lea rsi, [rip + 0x1a93678]
0000000145b3392c: bf0a000000                     mov edi, 0xa
0000000145b33931: ba0a000000                     mov edx, 0xa
0000000145b33936: eb2d                           jmp 0x145b33965
0000000145b33938: 488d356f36a901                 lea rsi, [rip + 0x1a9366f]
0000000145b3393f: eb1a                           jmp 0x145b3395b
0000000145b33941: 488d355536a901                 lea rsi, [rip + 0x1a93655]
0000000145b33948: bf07000000                     mov edi, 7
0000000145b3394d: ba07000000                     mov edx, 7
0000000145b33952: eb11                           jmp 0x145b33965
0000000145b33954: 488d356036a901                 lea rsi, [rip + 0x1a93660]
0000000145b3395b: bf05000000                     mov edi, 5
0000000145b33960: ba05000000                     mov edx, 5
0000000145b33965: 4889f1                         mov rcx, rsi
0000000145b33968: e89362ffff                     call 0x145b29c00
0000000145b3396d: 4885c0                         test rax, rax
0000000145b33970: 480f44d7                       cmove rdx, rdi
0000000145b33974: 480f44c6                       cmove rax, rsi
0000000145b33978: 4883c428                       add rsp, 0x28
0000000145b3397c: 5f                             pop rdi
0000000145b3397d: 5e                             pop rsi
0000000145b3397e: c3                             ret
; unlock-initializer 0x145b4a810..0x145b4a9ef sha256=e992bc0d166eb8b88f17744d37a78627bdca5e1bcbf529448427830ef0ef880f
0000000145b4a810: 4157                           push r15
0000000145b4a812: 4156                           push r14
0000000145b4a814: 4155                           push r13
0000000145b4a816: 4154                           push r12
0000000145b4a818: 56                             push rsi
0000000145b4a819: 57                             push rdi
0000000145b4a81a: 53                             push rbx
0000000145b4a81b: 4881ec20010000                 sub rsp, 0x120
0000000145b4a822: 4c89c7                         mov rdi, r8
0000000145b4a825: 4889d3                         mov rbx, rdx
0000000145b4a828: 4889ce                         mov rsi, rcx
0000000145b4a82b: 4889542420                     mov qword ptr [rsp + 0x20], rdx
0000000145b4a830: 4c89442428                     mov qword ptr [rsp + 0x28], r8
0000000145b4a835: 4c8d250409a801                 lea r12, [rip + 0x1a80904]
0000000145b4a83c: 41bd0c000000                   mov r13d, 0xc
0000000145b4a842: ba0c000000                     mov edx, 0xc
0000000145b4a847: 4c89e1                         mov rcx, r12
0000000145b4a84a: e8b1f3fdff                     call 0x145b29c00
0000000145b4a84f: 4989c6                         mov r14, rax
0000000145b4a852: 4989d7                         mov r15, rdx
0000000145b4a855: 4885c0                         test rax, rax
0000000145b4a858: 4d0f44f4                       cmove r14, r12
0000000145b4a85c: 4d0f44fd                       cmove r15, r13
0000000145b4a860: 4c8d2599877701                 lea r12, [rip + 0x1778799]
0000000145b4a867: 41bd0f000000                   mov r13d, 0xf
0000000145b4a86d: ba0f000000                     mov edx, 0xf
0000000145b4a872: 4c89e1                         mov rcx, r12
0000000145b4a875: e886f3fdff                     call 0x145b29c00
0000000145b4a87a: 4885c0                         test rax, rax
0000000145b4a87d: 490f44c4                       cmove rax, r12
0000000145b4a881: 490f44d5                       cmove rdx, r13
0000000145b4a885: 488d0d04d3a701                 lea rcx, [rip + 0x1a7d304]
0000000145b4a88c: 48894c2438                     mov qword ptr [rsp + 0x38], rcx
0000000145b4a891: 488d0d10d9a701                 lea rcx, [rip + 0x1a7d910]
0000000145b4a898: 48894c2440                     mov qword ptr [rsp + 0x40], rcx
0000000145b4a89d: 488d4c2420                     lea rcx, [rsp + 0x20]
0000000145b4a8a2: 48894c2448                     mov qword ptr [rsp + 0x48], rcx
0000000145b4a8a7: 48894c2450                     mov qword ptr [rsp + 0x50], rcx
0000000145b4a8ac: 48c744245800000000             mov qword ptr [rsp + 0x58], 0
0000000145b4a8b5: 48c744246002000000             mov qword ptr [rsp + 0x60], 2
0000000145b4a8be: 4c8d0553c1a701                 lea r8, [rip + 0x1a7c153]
0000000145b4a8c5: 4c89442468                     mov qword ptr [rsp + 0x68], r8
0000000145b4a8ca: 48c744247009000000             mov qword ptr [rsp + 0x70], 9
0000000145b4a8d3: 4c89742478                     mov qword ptr [rsp + 0x78], r14
0000000145b4a8d8: 4c89bc2480000000               mov qword ptr [rsp + 0x80], r15
0000000145b4a8e0: 4c8d056508a801                 lea r8, [rip + 0x1a80865]
0000000145b4a8e7: 4c89842488000000               mov qword ptr [rsp + 0x88], r8
0000000145b4a8ef: 48c78424900000001a000000       mov qword ptr [rsp + 0x90], 0x1a
0000000145b4a8fb: 4c8d0572c1a701                 lea r8, [rip + 0x1a7c172]
0000000145b4a902: 4c89842498000000               mov qword ptr [rsp + 0x98], r8
0000000145b4a90a: 48c78424a00000000d000000       mov qword ptr [rsp + 0xa0], 0xd
0000000145b4a916: 48898424a8000000               mov qword ptr [rsp + 0xa8], rax
0000000145b4a91e: 48899424b0000000               mov qword ptr [rsp + 0xb0], rdx
0000000145b4a926: 488d0554c1a701                 lea rax, [rip + 0x1a7c154]
0000000145b4a92d: 48898424b8000000               mov qword ptr [rsp + 0xb8], rax
0000000145b4a935: 48c78424c000000019000000       mov qword ptr [rsp + 0xc0], 0x19
0000000145b4a941: 488d05e8eea701                 lea rax, [rip + 0x1a7eee8]
0000000145b4a948: 48898424c8000000               mov qword ptr [rsp + 0xc8], rax
0000000145b4a950: 488d0519f4a701                 lea rax, [rip + 0x1a7f419]
0000000145b4a957: 48898424d0000000               mov qword ptr [rsp + 0xd0], rax
0000000145b4a95f: 48899c24d8000000               mov qword ptr [rsp + 0xd8], rbx
0000000145b4a967: 4889bc24e0000000               mov qword ptr [rsp + 0xe0], rdi
0000000145b4a96f: 488d054a04a801                 lea rax, [rip + 0x1a8044a]
0000000145b4a976: 48898424e8000000               mov qword ptr [rsp + 0xe8], rax
0000000145b4a97e: 488d05bb07a801                 lea rax, [rip + 0x1a807bb]
0000000145b4a985: 48898424f0000000               mov qword ptr [rsp + 0xf0], rax
0000000145b4a98d: 48898c24f8000000               mov qword ptr [rsp + 0xf8], rcx
0000000145b4a995: 48c744243001000000             mov qword ptr [rsp + 0x30], 1
0000000145b4a99e: 488d0593f8a701                 lea rax, [rip + 0x1a7f893]
0000000145b4a9a5: 4889842400010000               mov qword ptr [rsp + 0x100], rax
0000000145b4a9ad: 488d054402a801                 lea rax, [rip + 0x1a80244]
0000000145b4a9b4: 4889842408010000               mov qword ptr [rsp + 0x108], rax
0000000145b4a9bc: 48899c2410010000               mov qword ptr [rsp + 0x110], rbx
0000000145b4a9c4: 4889bc2418010000               mov qword ptr [rsp + 0x118], rdi
0000000145b4a9cc: 488d542430                     lea rdx, [rsp + 0x30]
0000000145b4a9d1: 4889f1                         mov rcx, rsi
0000000145b4a9d4: e897fa0d00                     call 0x145c2a470
0000000145b4a9d9: 4889f0                         mov rax, rsi
0000000145b4a9dc: 4881c420010000                 add rsp, 0x120
0000000145b4a9e3: 5b                             pop rbx
0000000145b4a9e4: 5f                             pop rdi
0000000145b4a9e5: 5e                             pop rsi
0000000145b4a9e6: 415c                           pop r12
0000000145b4a9e8: 415d                           pop r13
0000000145b4a9ea: 415e                           pop r14
0000000145b4a9ec: 415f                           pop r15
0000000145b4a9ee: c3                             ret
; unlock-next 0x145c3e300..0x145c3e80e sha256=2a353c9a7e3b7962163dd8c869a011ec9a3761eadfeba7d94e34bef4dbecf4ba
0000000145c3e300: 55                             push rbp
0000000145c3e301: 4157                           push r15
0000000145c3e303: 4156                           push r14
0000000145c3e305: 4155                           push r13
0000000145c3e307: 4154                           push r12
0000000145c3e309: 56                             push rsi
0000000145c3e30a: 57                             push rdi
0000000145c3e30b: 53                             push rbx
0000000145c3e30c: 4883ec68                       sub rsp, 0x68
0000000145c3e310: 488d6c2460                     lea rbp, [rsp + 0x60]
0000000145c3e315: 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145c3e31d: 4889d7                         mov rdi, rdx
0000000145c3e320: 4889ce                         mov rsi, rcx
0000000145c3e323: 488b02                         mov rax, qword ptr [rdx]
0000000145c3e326: 4883f8ff                       cmp rax, -1
0000000145c3e32a: 0f84ec030000                   je 0x145c3e71c
0000000145c3e330: 4885c0                         test rax, rax
0000000145c3e333: 0f84bd010000                   je 0x145c3e4f6
0000000145c3e339: 83f802                         cmp eax, 2
0000000145c3e33c: 0f84a3020000                   je 0x145c3e5e5
0000000145c3e342: 488b4708                       mov rax, qword ptr [rdi + 8]
0000000145c3e346: 4885c0                         test rax, rax
0000000145c3e349: 0f84fa000000                   je 0x145c3e449
0000000145c3e34f: 4c8b7f10                       mov r15, qword ptr [rdi + 0x10]
0000000145c3e353: 4c39f8                         cmp rax, r15
0000000145c3e356: 0f84e5000000                   je 0x145c3e441
0000000145c3e35c: 4c8b6f18                       mov r13, qword ptr [rdi + 0x18]
0000000145c3e360: 498b5d08                       mov rbx, qword ptr [r13 + 8]
0000000145c3e364: 4883c078                       add rax, 0x78
0000000145c3e368: eb14                           jmp 0x145c3e37e
0000000145c3e36a: 660f1f440000                   nop word ptr [rax + rax]
0000000145c3e370: 498d442478                     lea rax, [r12 + 0x78]
0000000145c3e375: 4d39fc                         cmp r12, r15
0000000145c3e378: 0f84bb000000                   je 0x145c3e439
0000000145c3e37e: 4989c4                         mov r12, rax
0000000145c3e381: 483958e0                       cmp qword ptr [rax - 0x20], rbx
0000000145c3e385: 75e9                           jne 0x145c3e370
0000000145c3e387: 4d8b7500                       mov r14, qword ptr [r13]
0000000145c3e38b: 498b4c24d8                     mov rcx, qword ptr [r12 - 0x28]
0000000145c3e390: 4c89f2                         mov rdx, r14
0000000145c3e393: 4989d8                         mov r8, rbx
0000000145c3e396: e84c593500                     call 0x145f93ce7
0000000145c3e39b: 85c0                           test eax, eax
0000000145c3e39d: 75d1                           jne 0x145c3e370
0000000145c3e39f: 498b4c24e8                     mov rcx, qword ptr [r12 - 0x18]
0000000145c3e3a4: 4885c9                         test rcx, rcx
0000000145c3e3a7: 7428                           je 0x145c3e3d1
0000000145c3e3a9: 498b5424f0                     mov rdx, qword ptr [r12 - 0x10]
0000000145c3e3ae: e8fdccf0ff                     call 0x145b4b0b0
0000000145c3e3b3: 4885c0                         test rax, rax
0000000145c3e3b6: 7419                           je 0x145c3e3d1
0000000145c3e3b8: 48395858                       cmp qword ptr [rax + 0x58], rbx
0000000145c3e3bc: 7513                           jne 0x145c3e3d1
0000000145c3e3be: 488b4850                       mov rcx, qword ptr [rax + 0x50]
0000000145c3e3c2: 4c89f2                         mov rdx, r14
0000000145c3e3c5: 4989d8                         mov r8, rbx
0000000145c3e3c8: e81a593500                     call 0x145f93ce7
0000000145c3e3cd: 85c0                           test eax, eax
0000000145c3e3cf: 749f                           je 0x145c3e370
0000000145c3e3d1: 4c896708                       mov qword ptr [rdi + 8], r12
0000000145c3e3d5: 4c8d3d70969901                 lea r15, [rip + 0x1999670]
0000000145c3e3dc: ba07000000                     mov edx, 7
0000000145c3e3e1: 4c89f9                         mov rcx, r15
0000000145c3e3e4: e817b8eeff                     call 0x145b29c00
0000000145c3e3e9: 4889c7                         mov rdi, rax
0000000145c3e3ec: 4889d3                         mov rbx, rdx
0000000145c3e3ef: 498b4c2498                     mov rcx, qword ptr [r12 - 0x68]
0000000145c3e3f4: 48894df0                       mov qword ptr [rbp - 0x10], rcx
0000000145c3e3f8: 4d8b6c24a0                     mov r13, qword ptr [r12 - 0x60]
0000000145c3e3fd: 4c89ea                         mov rdx, r13
0000000145c3e400: e8fbb7eeff                     call 0x145b29c00
0000000145c3e405: 4989c6                         mov r14, rax
0000000145c3e408: 4889d8                         mov rax, rbx
0000000145c3e40b: 4885ff                         test rdi, rdi
0000000145c3e40e: 490f44ff                       cmove rdi, r15
0000000145c3e412: b907000000                     mov ecx, 7
0000000145c3e417: 480f44c1                       cmove rax, rcx
0000000145c3e41b: 4989d7                         mov r15, rdx
0000000145c3e41e: 4d85f6                         test r14, r14
0000000145c3e421: 498b5c24a8                     mov rbx, qword ptr [r12 - 0x58]
0000000145c3e426: 4d8b6424b0                     mov r12, qword ptr [r12 - 0x50]
0000000145c3e42b: 4d0f44fd                       cmove r15, r13
0000000145c3e42f: 4c0f4475f0                     cmove r14, qword ptr [rbp - 0x10]
0000000145c3e434: e9b9020000                     jmp 0x145c3e6f2
0000000145c3e439: 4883c088                       add rax, -0x78
0000000145c3e43d: 48894708                       mov qword ptr [rdi + 8], rax
0000000145c3e441: 48c7470800000000               mov qword ptr [rdi + 8], 0
0000000145c3e449: 4c8b7720                       mov r14, qword ptr [rdi + 0x20]
0000000145c3e44d: 4d85f6                         test r14, r14
0000000145c3e450: 0f8499000000                   je 0x145c3e4ef
0000000145c3e456: 4c8b7f28                       mov r15, qword ptr [rdi + 0x28]
0000000145c3e45a: 4c8b6730                       mov r12, qword ptr [rdi + 0x30]
0000000145c3e45e: 4d39e7                         cmp r15, r12
0000000145c3e461: 0f8488000000                   je 0x145c3e4ef
0000000145c3e467: 498b5e08                       mov rbx, qword ptr [r14 + 8]
0000000145c3e46b: 4b8d047f                       lea rax, [r15 + r15*2]
0000000145c3e46f: 48c1e004                       shl rax, 4
0000000145c3e473: 4c8d2c38                       lea r13, [rax + rdi]
0000000145c3e477: 4983c560                       add r13, 0x60
0000000145c3e47b: eb0f                           jmp 0x145c3e48c
0000000145c3e47d: 0f1f00                         nop dword ptr [rax]
0000000145c3e480: 49ffc7                         inc r15
0000000145c3e483: 4983c530                       add r13, 0x30
0000000145c3e487: 4d39fc                         cmp r12, r15
0000000145c3e48a: 745f                           je 0x145c3e4eb
0000000145c3e48c: 49395de0                       cmp qword ptr [r13 - 0x20], rbx
0000000145c3e490: 75ee                           jne 0x145c3e480
0000000145c3e492: 498b4dd8                       mov rcx, qword ptr [r13 - 0x28]
0000000145c3e496: 498b16                         mov rdx, qword ptr [r14]
0000000145c3e499: 4989d8                         mov r8, rbx
0000000145c3e49c: e846583500                     call 0x145f93ce7
0000000145c3e4a1: 85c0                           test eax, eax
0000000145c3e4a3: 75db                           jne 0x145c3e480
0000000145c3e4a5: 49ffc7                         inc r15
0000000145c3e4a8: 4c897f28                       mov qword ptr [rdi + 0x28], r15
0000000145c3e4ac: 4d8b75e8                       mov r14, qword ptr [r13 - 0x18]
0000000145c3e4b0: 4d8b7df0                       mov r15, qword ptr [r13 - 0x10]
0000000145c3e4b4: 498b5df8                       mov rbx, qword ptr [r13 - 8]
0000000145c3e4b8: 4d8b6500                       mov r12, qword ptr [r13]
0000000145c3e4bc: 4c8d2d89959901                 lea r13, [rip + 0x1999589]
0000000145c3e4c3: ba07000000                     mov edx, 7
0000000145c3e4c8: 4c89e9                         mov rcx, r13
0000000145c3e4cb: e830b7eeff                     call 0x145b29c00
0000000145c3e4d0: 4889c7                         mov rdi, rax
0000000145c3e4d3: 4889d0                         mov rax, rdx
0000000145c3e4d6: 4885ff                         test rdi, rdi
0000000145c3e4d9: b907000000                     mov ecx, 7
0000000145c3e4de: 480f44c1                       cmove rax, rcx
0000000145c3e4e2: 490f44fd                       cmove rdi, r13
0000000145c3e4e6: e907020000                     jmp 0x145c3e6f2
0000000145c3e4eb: 4c896728                       mov qword ptr [rdi + 0x28], r12
0000000145c3e4ef: 48c70700000000                 mov qword ptr [rdi], 0
0000000145c3e4f6: 4c8baf98000000                 mov r13, qword ptr [rdi + 0x98]
0000000145c3e4fd: 4d85ed                         test r13, r13
0000000145c3e500: 0f84d8000000                   je 0x145c3e5de
0000000145c3e506: 4c8bbfa0000000                 mov r15, qword ptr [rdi + 0xa0]
0000000145c3e50d: 4d39fd                         cmp r13, r15
0000000145c3e510: 0f84c8000000                   je 0x145c3e5de
0000000145c3e516: 488b9fa8000000                 mov rbx, qword ptr [rdi + 0xa8]
0000000145c3e51d: 4c8bb7b0000000                 mov r14, qword ptr [rdi + 0xb0]
0000000145c3e524: eb17                           jmp 0x145c3e53d
0000000145c3e526: 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145c3e530: 4983c540                       add r13, 0x40
0000000145c3e534: 4d39fd                         cmp r13, r15
0000000145c3e537: 0f849a000000                   je 0x145c3e5d7
0000000145c3e53d: 498b4d20                       mov rcx, qword ptr [r13 + 0x20]
0000000145c3e541: 4885c9                         test rcx, rcx
0000000145c3e544: 74ea                           je 0x145c3e530
0000000145c3e546: 4d397528                       cmp qword ptr [r13 + 0x28], r14
0000000145c3e54a: 75e4                           jne 0x145c3e530
0000000145c3e54c: 4889da                         mov rdx, rbx
0000000145c3e54f: 4d89f0                         mov r8, r14
0000000145c3e552: e890573500                     call 0x145f93ce7
0000000145c3e557: 85c0                           test eax, eax
0000000145c3e559: 75d5                           jne 0x145c3e530
0000000145c3e55b: 498d4540                       lea rax, [r13 + 0x40]
0000000145c3e55f: 48898798000000                 mov qword ptr [rdi + 0x98], rax
0000000145c3e566: 4c8d35d0949901                 lea r14, [rip + 0x19994d0]
0000000145c3e56d: bb06000000                     mov ebx, 6
0000000145c3e572: ba06000000                     mov edx, 6
0000000145c3e577: 4c89f1                         mov rcx, r14
0000000145c3e57a: e881b6eeff                     call 0x145b29c00
0000000145c3e57f: 4889c7                         mov rdi, rax
0000000145c3e582: 4885c0                         test rax, rax
0000000145c3e585: 480f44d3                       cmove rdx, rbx
0000000145c3e589: 488955f0                       mov qword ptr [rbp - 0x10], rdx
0000000145c3e58d: 490f44fe                       cmove rdi, r14
0000000145c3e591: 498d4530                       lea rax, [r13 + 0x30]
0000000145c3e595: 488945c8                       mov qword ptr [rbp - 0x38], rax
0000000145c3e599: 488d05409f3300                 lea rax, [rip + 0x339f40]
0000000145c3e5a0: 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000145c3e5a4: 488d1505946801                 lea rdx, [rip + 0x1689405]
0000000145c3e5ab: 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145c3e5af: 4c8d45c8                       lea r8, [rbp - 0x38]
0000000145c3e5b3: e878843200                     call 0x145f66a30
0000000145c3e5b8: 488b4de0                       mov rcx, qword ptr [rbp - 0x20]
0000000145c3e5bc: 488b55e8                       mov rdx, qword ptr [rbp - 0x18]
0000000145c3e5c0: 4d8b7500                       mov r14, qword ptr [r13]
0000000145c3e5c4: 498b5d08                       mov rbx, qword ptr [r13 + 8]
0000000145c3e5c8: 48894df8                       mov qword ptr [rbp - 8], rcx
0000000145c3e5cc: e82fb6eeff                     call 0x145b29c00
0000000145c3e5d1: 90                             nop
0000000145c3e5d2: e9e6000000                     jmp 0x145c3e6bd
0000000145c3e5d7: 4c89af98000000                 mov qword ptr [rdi + 0x98], r13
0000000145c3e5de: 48c70702000000                 mov qword ptr [rdi], 2
0000000145c3e5e5: 4c8bafb8000000                 mov r13, qword ptr [rdi + 0xb8]
0000000145c3e5ec: 4d85ed                         test r13, r13
0000000145c3e5ef: 0f8420010000                   je 0x145c3e715
0000000145c3e5f5: 4c8bb7c0000000                 mov r14, qword ptr [rdi + 0xc0]
0000000145c3e5fc: 4d39f5                         cmp r13, r14
0000000145c3e5ff: 0f8410010000                   je 0x145c3e715
0000000145c3e605: 4c8bbfc8000000                 mov r15, qword ptr [rdi + 0xc8]
0000000145c3e60c: 498b5f08                       mov rbx, qword ptr [r15 + 8]
0000000145c3e610: eb1b                           jmp 0x145c3e62d
0000000145c3e612: 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c3e620: 4983c540                       add r13, 0x40
0000000145c3e624: 4d39f5                         cmp r13, r14
0000000145c3e627: 0f84e1000000                   je 0x145c3e70e
0000000145c3e62d: 49395d28                       cmp qword ptr [r13 + 0x28], rbx
0000000145c3e631: 75ed                           jne 0x145c3e620
0000000145c3e633: 498b17                         mov rdx, qword ptr [r15]
0000000145c3e636: 498b4d20                       mov rcx, qword ptr [r13 + 0x20]
0000000145c3e63a: 4989d8                         mov r8, rbx
0000000145c3e63d: e8a5563500                     call 0x145f93ce7
0000000145c3e642: 85c0                           test eax, eax
0000000145c3e644: 75da                           jne 0x145c3e620
0000000145c3e646: 498d4540                       lea rax, [r13 + 0x40]
0000000145c3e64a: 488987b8000000                 mov qword ptr [rdi + 0xb8], rax
0000000145c3e651: 4c8d35e5939901                 lea r14, [rip + 0x19993e5]
0000000145c3e658: bb06000000                     mov ebx, 6
0000000145c3e65d: ba06000000                     mov edx, 6
0000000145c3e662: 4c89f1                         mov rcx, r14
0000000145c3e665: e896b5eeff                     call 0x145b29c00
0000000145c3e66a: 4889c7                         mov rdi, rax
0000000145c3e66d: 4885c0                         test rax, rax
0000000145c3e670: 480f44d3                       cmove rdx, rbx
0000000145c3e674: 488955f0                       mov qword ptr [rbp - 0x10], rdx
0000000145c3e678: 490f44fe                       cmove rdi, r14
0000000145c3e67c: 498d4530                       lea rax, [r13 + 0x30]
0000000145c3e680: 488945c8                       mov qword ptr [rbp - 0x38], rax
0000000145c3e684: 488d05559e3300                 lea rax, [rip + 0x339e55]
0000000145c3e68b: 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000145c3e68f: 488d1524936801                 lea rdx, [rip + 0x1689324]
0000000145c3e696: 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145c3e69a: 4c8d45c8                       lea r8, [rbp - 0x38]
0000000145c3e69e: e88d833200                     call 0x145f66a30
0000000145c3e6a3: 488b4de0                       mov rcx, qword ptr [rbp - 0x20]
0000000145c3e6a7: 488b55e8                       mov rdx, qword ptr [rbp - 0x18]
0000000145c3e6ab: 4d8b7500                       mov r14, qword ptr [r13]
0000000145c3e6af: 498b5d08                       mov rbx, qword ptr [r13 + 8]
0000000145c3e6b3: 48894df8                       mov qword ptr [rbp - 8], rcx
0000000145c3e6b7: e844b5eeff                     call 0x145b29c00
0000000145c3e6bc: 90                             nop
0000000145c3e6bd: 4989c4                         mov r12, rax
0000000145c3e6c0: 4989d7                         mov r15, rdx
0000000145c3e6c3: 488b55d8                       mov rdx, qword ptr [rbp - 0x28]
0000000145c3e6c7: 4885d2                         test rdx, rdx
0000000145c3e6ca: 740f                           je 0x145c3e6db
0000000145c3e6cc: 41b801000000                   mov r8d, 1
0000000145c3e6d2: 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145c3e6d6: e8f53a3cfa                     call 0x1400021d0
0000000145c3e6db: 4d85e4                         test r12, r12
0000000145c3e6de: 4d0f45f4                       cmovne r14, r12
0000000145c3e6e2: 4c0f44fb                       cmove r15, rbx
0000000145c3e6e6: 498b5d10                       mov rbx, qword ptr [r13 + 0x10]
0000000145c3e6ea: 4d8b6518                       mov r12, qword ptr [r13 + 0x18]
0000000145c3e6ee: 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145c3e6f2: 48893e                         mov qword ptr [rsi], rdi
0000000145c3e6f5: 48894608                       mov qword ptr [rsi + 8], rax
0000000145c3e6f9: 4c897610                       mov qword ptr [rsi + 0x10], r14
0000000145c3e6fd: 4c897e18                       mov qword ptr [rsi + 0x18], r15
0000000145c3e701: 48895e20                       mov qword ptr [rsi + 0x20], rbx
0000000145c3e705: 4c896628                       mov qword ptr [rsi + 0x28], r12
0000000145c3e709: e9ef000000                     jmp 0x145c3e7fd
0000000145c3e70e: 4c89afb8000000                 mov qword ptr [rdi + 0xb8], r13
0000000145c3e715: 48c707ffffffff                 mov qword ptr [rdi], 0xffffffffffffffff
0000000145c3e71c: 4c8ba7d0000000                 mov r12, qword ptr [rdi + 0xd0]
0000000145c3e723: 4d85e4                         test r12, r12
0000000145c3e726: 0f84ca000000                   je 0x145c3e7f6
0000000145c3e72c: 4c8bbfd8000000                 mov r15, qword ptr [rdi + 0xd8]
0000000145c3e733: 4d39fc                         cmp r12, r15
0000000145c3e736: 0f84ba000000                   je 0x145c3e7f6
0000000145c3e73c: 488b9fe0000000                 mov rbx, qword ptr [rdi + 0xe0]
0000000145c3e743: 4c8bb7e8000000                 mov r14, qword ptr [rdi + 0xe8]
0000000145c3e74a: eb11                           jmp 0x145c3e75d
0000000145c3e74c: 0f1f4000                       nop dword ptr [rax]
0000000145c3e750: 4983c460                       add r12, 0x60
0000000145c3e754: 4d39fc                         cmp r12, r15
0000000145c3e757: 0f8492000000                   je 0x145c3e7ef
0000000145c3e75d: 498b4c2440                     mov rcx, qword ptr [r12 + 0x40]
0000000145c3e762: 4885c9                         test rcx, rcx
0000000145c3e765: 74e9                           je 0x145c3e750
0000000145c3e767: 4d39742448                     cmp qword ptr [r12 + 0x48], r14
0000000145c3e76c: 75e2                           jne 0x145c3e750
0000000145c3e76e: 4889da                         mov rdx, rbx
0000000145c3e771: 4d89f0                         mov r8, r14
0000000145c3e774: e86e553500                     call 0x145f93ce7
0000000145c3e779: 85c0                           test eax, eax
0000000145c3e77b: 75d3                           jne 0x145c3e750
0000000145c3e77d: 498d442460                     lea rax, [r12 + 0x60]
0000000145c3e782: 488987d0000000                 mov qword ptr [rdi + 0xd0], rax
0000000145c3e789: 488d3db3929901                 lea rdi, [rip + 0x19992b3]
0000000145c3e790: 41bf09000000                   mov r15d, 9
0000000145c3e796: ba09000000                     mov edx, 9
0000000145c3e79b: 4889f9                         mov rcx, rdi
0000000145c3e79e: e85db4eeff                     call 0x145b29c00
0000000145c3e7a3: 4889c3                         mov rbx, rax
0000000145c3e7a6: 4989d6                         mov r14, rdx
0000000145c3e7a9: 4885c0                         test rax, rax
0000000145c3e7ac: 480f44df                       cmove rbx, rdi
0000000145c3e7b0: 4d0f44f7                       cmove r14, r15
0000000145c3e7b4: 498b7c2410                     mov rdi, qword ptr [r12 + 0x10]
0000000145c3e7b9: 4d8b7c2418                     mov r15, qword ptr [r12 + 0x18]
0000000145c3e7be: 4889f9                         mov rcx, rdi
0000000145c3e7c1: 4c89fa                         mov rdx, r15
0000000145c3e7c4: e837b4eeff                     call 0x145b29c00
0000000145c3e7c9: 4885c0                         test rax, rax
0000000145c3e7cc: 480f44c7                       cmove rax, rdi
0000000145c3e7d0: 490f44d7                       cmove rdx, r15
0000000145c3e7d4: 410f10442430                   movups xmm0, xmmword ptr [r12 + 0x30]
0000000145c3e7da: 48891e                         mov qword ptr [rsi], rbx
0000000145c3e7dd: 4c897608                       mov qword ptr [rsi + 8], r14
0000000145c3e7e1: 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145c3e7e5: 48895618                       mov qword ptr [rsi + 0x18], rdx
0000000145c3e7e9: 0f114620                       movups xmmword ptr [rsi + 0x20], xmm0
0000000145c3e7ed: eb0e                           jmp 0x145c3e7fd
0000000145c3e7ef: 4c89a7d0000000                 mov qword ptr [rdi + 0xd0], r12
0000000145c3e7f6: 48c70600000000                 mov qword ptr [rsi], 0
0000000145c3e7fd: 4883c468                       add rsp, 0x68
0000000145c3e801: 5b                             pop rbx
0000000145c3e802: 5f                             pop rdi
0000000145c3e803: 5e                             pop rsi
0000000145c3e804: 415c                           pop r12
0000000145c3e806: 415d                           pop r13
0000000145c3e808: 415e                           pop r14
0000000145c3e80a: 415f                           pop r15
0000000145c3e80c: 5d                             pop rbp
0000000145c3e80d: c3                             ret
