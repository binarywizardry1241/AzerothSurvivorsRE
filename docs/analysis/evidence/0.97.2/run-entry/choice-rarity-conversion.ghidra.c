
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long param_4)

{
  long *plVar1;
  long lVar2;
  code *pcVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  long *plVar7;
  ulong uVar8;
  long lVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  undefined4 local_238;
  undefined4 uStack_234;
  undefined4 local_228;
  undefined4 uStack_224;
  undefined4 local_138;
  undefined4 uStack_134;
  undefined4 local_128;
  undefined4 uStack_124;

  plVar1 = *(long **)(param_4 + 0x18);
  lVar9 = param_3[3];
  plVar7 = *(long **)(param_4 + 8);
  fVar12 = _DAT_14590ae44;
  fVar13 = _DAT_1458eb480;
  fVar14 = _DAT_1459c799c;
  fVar15 = _DAT_1458f8de0;
  fVar16 = _DAT_1458eb4f8;
  fVar17 = _DAT_145930f00;
  do {
    if (plVar7 == plVar1) {
      if (*(long *)(param_4 + 0x10) != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)*param_3 = param_3[1];
      return;
    }
    lVar2 = *plVar7;
    lVar4 = plVar7[2];
    *(long **)(param_4 + 8) = plVar7 + 4;
    lVar5 = *plVar7;
    uVar6 = plVar7[3];
    fVar10 = (float)*(uint *)(lVar9 + 0x3f8) * _DAT_14594f310;
    if (fVar12 <= fVar10) {
      fVar10 = fVar12;
    }
    fVar19 = *(float *)(lVar9 + 0x484) + fVar13 + fVar10;
    fVar11 = fVar19 * fVar14;
    fVar20 = fVar19 * fVar19;
    fVar18 = fVar20 * fVar15;
    fVar21 = fVar20 * fVar20;
    fVar19 = fVar19 * fVar20 * fVar16;
    fVar10 = (float)func_0x0001454f97c0(fVar10,0,fVar11 + fVar17 + fVar18 + fVar19 + fVar21);
    if (fVar17 <= fVar10) {
      uVar8 = 1;
      if (fVar11 <= fVar10 + _DAT_1459c7e98) {
        fVar11 = (fVar10 + _DAT_1459c7e98) - fVar11;
        uVar8 = 2;
        if (fVar18 <= fVar11) {
          fVar11 = fVar11 - fVar18;
          uVar8 = 3;
          if (fVar19 <= fVar11) {
            if (fVar21 <= fVar11 - fVar19) goto LAB_145545478;
            uVar8 = 4;
          }
        }
      }
    }
    else {
LAB_145545478:
      uVar8 = 0;
    }
    if (-1 < lVar5) {
      do {
        if (3 < uVar8) {
          if (*(ulong *)(lVar9 + 0x2a0) <= uVar6) {
            func_0x0001458e75b3();
LAB_1455457aa:
                    /* WARNING: Does not return */
            pcVar3 = (code *)invalidInstructionException();
            (*pcVar3)();
          }
          func_0x0001455292b0();
          if (CONCAT44(uStack_134,local_138) != 0) {
            func_0x0001400021d0();
          }
          break;
        }
        if (*(ulong *)(lVar9 + 0x2a0) <= uVar6) {
          func_0x0001458e75b3();
          goto LAB_1455457aa;
        }
        func_0x0001455292b0();
        if (CONCAT44(uStack_134,local_138) != 0) {
          func_0x0001400021d0();
        }
        uVar8 = uVar8 + 1;
      } while (CONCAT44(uStack_124,local_128) == 0);
    }
    local_238 = (undefined4)lVar2;
    uStack_234 = (undefined4)((ulong)lVar2 >> 0x20);
    local_228 = (undefined4)lVar4;
    uStack_224 = (undefined4)((ulong)lVar4 >> 0x20);
    func_0x0001454ded40();
    lVar2 = param_3[1];
    func_0x000145756ddd();
    param_3[1] = lVar2 + 1;
    plVar7 = plVar7 + 4;
    uStack_124 = uStack_224;
    local_128 = local_228;
    uStack_134 = uStack_234;
    local_138 = local_238;
  } while( true );
}
