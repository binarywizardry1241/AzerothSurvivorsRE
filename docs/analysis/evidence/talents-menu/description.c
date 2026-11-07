/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * FUN_14590eaf0(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
                    long param_5,long *param_6,byte param_7)

{
  byte bVar1;
  code *pcVar2;
  bool bVar3;
  bool bVar4;
  char cVar5;
  byte bVar6;
  long *plVar7;
  byte bVar8;
  long lVar9;
  byte *pbVar10;
  long lVar11;
  uint uVar12;
  long lVar13;
  undefined4 in_XMM6_Da;
  float fVar14;
  undefined4 in_XMM7_Da;
  float fVar15;
  float fVar16;
  float in_XMM11_Da;
  undefined1 auVar17 [16];
  float *local_118;
  undefined8 local_110;
  float *local_108;
  long local_100;
  float **local_f8;
  undefined8 local_f0;
  long local_c8;
  long *local_c0;
  float local_b4;
  undefined8 local_b0;
  undefined4 local_a8;
  undefined4 local_98;

  local_b0 = 0xfffffffffffffffe;
  bVar6 = *(byte *)(param_5 + 0x72);
  local_a8 = in_XMM6_Da;
  local_98 = in_XMM7_Da;
  if (bVar6 == 0) {
    local_b4 = (float)CONCAT31(local_b4._1_3_,1);
    local_118 = (float *)((ulong)local_118 & 0xffffffffffffff00);
    local_108 = &local_b4;
    local_100 = 0x1403ebac0;
    local_f8 = &local_118;
    local_f0 = 0x1403ebac0;
    func_0x000145d99830(param_3,param_6,&local_108,0x147229296,0x14720bc98);
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  if (param_7 == 0) {
    bVar6 = 1;
    lVar13 = *(long *)(param_5 + 0x58);
    if (lVar13 != 0) goto LAB_14590eb67;
LAB_14590ed4b:
    lVar13 = *(long *)(param_5 + 0x68);
    auVar17 = func_0x0001458ec500(param_5,param_6,lVar13,*(undefined8 *)(param_5 + 0x60));
    lVar11 = auVar17._8_8_;
    if (auVar17._0_8_ == 0) {
      lVar11 = lVar13;
    }
  }
  else {
    if (param_7 < bVar6) {
      bVar6 = param_7;
    }
    lVar13 = *(long *)(param_5 + 0x58);
    if (lVar13 == 0) goto LAB_14590ed4b;
LAB_14590eb67:
    fVar15 = (float)bVar6;
    pbVar10 = *(byte **)(param_5 + 0x50);
    lVar13 = lVar13 << 6;
    bVar8 = 1;
    if (1 < bVar6) {
      bVar8 = bVar6;
    }
    fVar14 = (float)bVar8;
    lVar11 = 0x1472294bc;
    fVar16 = _DAT_145d9d2d0;
    local_c0 = param_6;
    do {
      cVar5 = *pbVar10 - 0x23;
      if (*pbVar10 < 0x23) {
        cVar5 = '\x02';
      }
      if (cVar5 == '\0') {
        in_XMM11_Da = *(float *)(pbVar10 + 4) * fVar15;
        bVar3 = true;
        if ((0x1a < pbVar10[8]) || ((0x6008040U >> (pbVar10[8] & 0x1f) & 1) == 0)) {
LAB_14590ebf3:
          bVar3 = true;
          in_XMM11_Da = in_XMM11_Da * fVar16;
        }
      }
      else if (cVar5 == '\x01') {
        in_XMM11_Da = *(float *)(pbVar10 + 0x20) * fVar15;
        bVar3 = true;
        if (pbVar10[0x24] != 2) goto LAB_14590ebf3;
      }
      else {
        param_1 = FUN_14590e600(param_1,param_2,fVar14);
        bVar3 = false;
        if (((ulong)local_108 & 0xff) < 0x23) {
                    /* WARNING: Could not recover jumptable at 0x00014590ec5a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          plVar7 = (long *)(*(code *)(*(int *)(lVar11 + ((ulong)local_108 & 0xff) * 4) + lVar11))();
          return plVar7;
        }
      }
      bVar4 = true;
      if (bVar3) goto LAB_14590ed8b;
      pbVar10 = pbVar10 + 0x40;
      lVar13 = lVar13 + -0x40;
    } while (lVar13 != 0);
    bVar4 = false;
LAB_14590ed8b:
    lVar13 = *(long *)(param_5 + 0x68);
    auVar17 = func_0x0001458ec500();
    lVar11 = auVar17._8_8_;
    if (auVar17._0_8_ == 0) {
      lVar11 = lVar13;
    }
    param_6 = local_c0;
    if (bVar4) {
      local_118 = &local_b4;
      local_110 = 0x145bddbe0;
      local_b4 = in_XMM11_Da;
      func_0x000145bcce30();
      do {
        while( true ) {
          lVar13 = (long)local_f8;
          if (local_f8 == (float **)0x0) goto LAB_14590ee9b;
          lVar11 = local_100 + (long)local_f8;
          bVar6 = *(byte *)(lVar11 + -1);
          if (-1 < (char)bVar6) break;
          bVar8 = *(byte *)(lVar11 + -2);
          if ((char)bVar8 < -0x40) {
            bVar1 = *(byte *)(lVar11 + -3);
            if ((char)bVar1 < -0x40) {
              lVar9 = lVar11 + -4;
              uVar12 = bVar1 & 0x3f | (*(byte *)(lVar11 + -4) & 7) << 6;
            }
            else {
              lVar9 = lVar11 + -3;
              uVar12 = bVar1 & 0xf;
            }
            uVar12 = bVar8 & 0x3f | uVar12 << 6;
          }
          else {
            lVar9 = lVar11 + -2;
            uVar12 = bVar8 & 0x1f;
          }
          local_f8 = (float **)(lVar9 - local_100);
          if (((uint)(bVar6 & 0x3f) | uVar12 << 6) != 0x30) goto LAB_14590ee9b;
        }
        local_f8 = (float **)((lVar11 + -1) - local_100);
      } while (bVar6 == 0x30);
LAB_14590ee9b:
      do {
        lVar11 = lVar13;
        if (lVar11 == 0) {
          lVar13 = 1;
          plVar7 = local_c0;
          goto joined_r0x00014590ef7d;
        }
        lVar13 = local_100 + lVar11;
        bVar6 = *(byte *)(lVar13 + -1);
        if (-1 < (char)bVar6) {
          lVar13 = (lVar13 + -1) - local_100;
          if (bVar6 != 0x2e) goto LAB_14590ef0f;
          goto LAB_14590ee9b;
        }
        bVar8 = *(byte *)(lVar13 + -2);
        if ((char)bVar8 < -0x40) {
          bVar1 = *(byte *)(lVar13 + -3);
          if ((char)bVar1 < -0x40) {
            lVar9 = lVar13 + -4;
            uVar12 = bVar1 & 0x3f | (*(byte *)(lVar13 + -4) & 7) << 6;
          }
          else {
            lVar9 = lVar13 + -3;
            uVar12 = bVar1 & 0xf;
          }
          uVar12 = bVar8 & 0x3f | uVar12 << 6;
        }
        else {
          lVar9 = lVar13 + -2;
          uVar12 = bVar8 & 0x1f;
        }
        lVar13 = lVar9 - local_100;
        if (((uint)(bVar6 & 0x3f) | uVar12 << 6) != 0x2e) {
LAB_14590ef0f:
          local_c8 = local_100;
          if (-1 < lVar11) {
            func_0x000140002200();
            lVar13 = func_0x0001400021c0();
            if (lVar13 != 0) {
              func_0x000145bfa0e7();
              plVar7 = local_c0;
joined_r0x00014590ef7d:
              if (local_108 != (float *)0x0) {
                local_c0 = plVar7;
                func_0x0001400021d0();
              }
              local_c8 = lVar13;
              local_c0 = (long *)lVar11;
              func_0x00014590cb30();
              if (local_c0 != (long *)0x0) {
                func_0x0001400021d0();
                return plVar7;
              }
              return plVar7;
            }
          }
          func_0x000145d992bb();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
      } while( true );
    }
  }
  if (lVar11 < 0) {
LAB_14590ed7b:
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  if (lVar11 == 0) {
    lVar13 = 1;
  }
  else {
    func_0x000140002200();
    lVar13 = func_0x0001400021c0();
    if (lVar13 == 0) goto LAB_14590ed7b;
    func_0x000145bfa0e7();
  }
  *param_6 = lVar11;
  param_6[1] = lVar13;
  param_6[2] = lVar11;
  return param_6;
}
