/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4,long *param_5)

{
  code *pcVar1;
  undefined8 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  undefined8 *puVar8;
  undefined8 *puVar9;
  int iVar10;
  undefined4 in_XMM6_Da;
  undefined4 uVar11;
  float fVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 in_XMM7_Da;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uStack_3a0;
  undefined4 uStack_39c;
  undefined1 local_188 [8];
  undefined8 uStack_180;
  undefined8 local_178;
  undefined8 uStack_170;
  undefined8 uStack_168;
  undefined8 local_160;
  undefined4 local_158;
  undefined4 uStack_154;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined8 local_148;
  undefined4 local_140;
  undefined4 uStack_13c;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined8 local_130;
  undefined4 local_128;
  undefined4 uStack_124;
  undefined4 uStack_120;
  undefined4 uStack_11c;
  undefined8 local_118;
  undefined4 *local_108;
  undefined8 local_100;
  undefined8 *local_f8;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;

  uVar6 = uRam0000000145deb93c;
  uVar5 = uRam0000000145deb938;
  uVar4 = uRam0000000145deb934;
  local_f0 = 0xfffffffffffffffe;
  local_100 = *param_4;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  func_0x00014588d200(param_4,*param_3,*(undefined8 *)(*param_5 + 0x28),
                      *(undefined8 *)(*param_5 + 0x20));
  func_0x000145bcce30();
  func_0x000140125ff0();
  func_0x0001426eca60();
  func_0x000145bfa0e7();
  func_0x000145bfa0e7();
  func_0x000145bfa0e7();
  func_0x0001401eb380();
  func_0x000140002200();
  puVar7 = (undefined4 *)func_0x0001400021c0();
  if (puVar7 == (undefined4 *)0x0) {
    func_0x000145d992a1();
  }
  else {
    func_0x000140002200();
    puVar8 = (undefined8 *)func_0x0001400021c0();
    local_108 = puVar7;
    if (puVar8 == (undefined8 *)0x0) {
      func_0x000145d992a1();
    }
    else {
      uVar11 = _DAT_145dec0b0;
      uVar13 = uRam0000000145dec0b4;
      uVar14 = uRam0000000145dec0b8;
      uVar15 = uRam0000000145dec0bc;
      local_f8 = puVar8;
      func_0x000144c7dcf0();
      uVar16 = local_188._0_4_;
      uVar17 = local_188._4_4_;
      uVar18 = (undefined4)uStack_180;
      uVar19 = uStack_180._4_4_;
      func_0x000144c7dcf0();
      puVar8 = local_f8;
      *local_f8 = 0x41f0000000000002;
      *(undefined4 *)(local_f8 + 1) = 1;
      *(undefined4 *)((long)local_f8 + 0xc) = uVar16;
      *(undefined4 *)(local_f8 + 2) = uVar17;
      *(undefined4 *)((long)local_f8 + 0x14) = uVar18;
      *(undefined4 *)(local_f8 + 3) = uVar19;
      uVar19 = uRam0000000145dd4afc;
      uVar18 = uRam0000000145dd4af8;
      uVar17 = uRam0000000145dd4af4;
      uVar16 = _DAT_145dd4af0;
      *(undefined4 *)((long)local_f8 + 0x1c) = _DAT_145dd4af0;
      *(undefined4 *)(local_f8 + 4) = uVar17;
      *(undefined4 *)((long)local_f8 + 0x24) = uVar18;
      *(undefined4 *)(local_f8 + 5) = uVar19;
      *(undefined1 (*) [8])((long)local_f8 + 0x2c) = local_188;
      *(undefined8 *)((long)local_f8 + 0x34) = uStack_180;
      *(undefined4 *)((long)local_f8 + 0x3c) = 0x3f000000;
      uVar3 = _DAT_145dd4e68;
      func_0x000140002200();
      puVar9 = (undefined8 *)func_0x0001400021c0();
      if (puVar9 != (undefined8 *)0x0) {
        local_188._4_4_ = uVar13;
        local_188._0_4_ = uVar11;
        uStack_180 = CONCAT44(uVar15,uVar14);
        local_178._0_4_ = 0;
        local_f8 = puVar9;
        func_0x000144c7dcf0();
        uStack_180 = CONCAT44(uRam0000000145dd4c08,uRam0000000145dd4c04);
        local_178 = CONCAT44(local_178._4_4_,uRam0000000145dd4c0c);
        local_188 = (undefined1  [8])((ulong)_DAT_145dd4c00 << 0x20);
        uVar11 = local_128;
        uVar13 = uStack_124;
        uVar14 = uStack_120;
        uVar15 = uStack_11c;
        func_0x000144c7dcf0();
        *local_f8 = 0x4270000000000002;
        *(undefined4 *)(local_f8 + 1) = 1;
        *(undefined4 *)((long)local_f8 + 0xc) = uVar11;
        *(undefined4 *)(local_f8 + 2) = uVar13;
        *(undefined4 *)((long)local_f8 + 0x14) = uVar14;
        *(undefined4 *)(local_f8 + 3) = uVar15;
        *(undefined4 *)((long)local_f8 + 0x1c) = uVar16;
        *(undefined4 *)(local_f8 + 4) = uVar17;
        *(undefined4 *)((long)local_f8 + 0x24) = uVar18;
        *(undefined4 *)(local_f8 + 5) = uVar19;
        *(ulong *)((long)local_f8 + 0x2c) = CONCAT44(uStack_124,local_128);
        *(ulong *)((long)local_f8 + 0x34) = CONCAT44(uStack_11c,uStack_120);
        *(undefined4 *)((long)local_f8 + 0x3c) = 0x3f000000;
        *(undefined8 *)(local_108 + 0x10) = 0;
        uStack_3a0 = SUB84(puVar8,0);
        uStack_39c = (undefined4)((ulong)puVar8 >> 0x20);
        local_108[0xc] = 10;
        local_108[0xd] = uVar4;
        local_108[0xe] = uVar5;
        local_108[0xf] = uVar6;
        local_108[8] = 2;
        local_108[9] = uVar3;
        local_108[10] = 0;
        local_108[0xb] = 0;
        local_108[4] = 2;
        local_108[5] = 0;
        local_108[6] = 2;
        local_108[7] = 0;
        *local_108 = 2;
        local_108[1] = 0;
        local_108[2] = uStack_3a0;
        local_108[3] = uStack_39c;
        *(undefined8 *)(local_108 + 0x12) = 0x8000000000000000;
        *(undefined8 *)(local_108 + 0x14) = 2;
        *(undefined8 **)(local_108 + 0x16) = local_f8;
        *(undefined8 *)(local_108 + 0x18) = 2;
        local_108[0x1a] = 0x40490fdb;
        *(undefined1 *)(local_108 + 0x1b) = 0;
        func_0x000145bfa0e7();
        func_0x0001401e1e40();
        puVar8 = (undefined8 *)(local_188 + 4);
        iVar10 = 0;
        do {
          fVar12 = (float)iVar10;
          func_0x000145bfa111(fVar12 * _DAT_145deb3f0);
          func_0x000144c7dcf0();
          func_0x000142649b80();
          func_0x000145bfa111(fVar12 * _DAT_145deb410);
          func_0x000145bfa111(fVar12 * _DAT_145deb414);
          func_0x000145bfa111(fVar12 * _DAT_145deb418);
          func_0x000145bfa111(fVar12 * _DAT_145deb41c);
          iVar10 = iVar10 + 1;
          func_0x000145bfa0e7();
          puVar8[2] = local_118;
          uVar2 = CONCAT44(uStack_11c,uStack_120);
          *puVar8 = CONCAT44(uStack_124,local_128);
          puVar8[1] = uVar2;
          func_0x0001401eb650();
        } while (iVar10 != 0x1c);
        local_188 = (undefined1  [8])_DAT_145deb900;
        uStack_180 = uRam0000000145deb908;
        local_178 = 0;
        uStack_170 = _DAT_145deb918;
        uStack_168 = uRam0000000145deb920;
        local_160 = 0;
        local_158 = _DAT_145deb930;
        uStack_154 = uRam0000000145deb934;
        uStack_150 = uRam0000000145deb938;
        uStack_14c = uRam0000000145deb93c;
        local_148 = 0;
        local_140 = _DAT_145deb948;
        uStack_13c = uRam0000000145deb94c;
        uStack_138 = uRam0000000145deb950;
        uStack_134 = uRam0000000145deb954;
        local_130 = 0;
        func_0x000145bfa0e7();
        func_0x0001401eb0d0();
        return param_4;
      }
      func_0x000145d992a1();
    }
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
