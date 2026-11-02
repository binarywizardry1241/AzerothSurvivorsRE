
void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  float fVar1;
  undefined1 uVar2;
  long *plVar3;
  long lVar4;
  undefined1 *puVar5;
  code *pcVar6;
  undefined1 *puVar7;
  ulong uVar8;
  long lVar9;
  long *plVar10;
  long lVar11;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined8 local_c0;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  long local_60;

  plVar3 = (long *)*param_3;
  lVar9 = param_3[1];
  lVar4 = *param_4;
  if (lVar4 == param_4[1]) {
LAB_1459b141f:
    *plVar3 = lVar9;
    return;
  }
  lVar11 = *(long *)(lVar4 + 0x20);
  if (-1 < lVar11) {
    puVar5 = (undefined1 *)param_4[3];
    uVar8 = (ulong)(param_4[1] - lVar4) / 0xf0;
    plVar10 = (long *)(lVar4 + 0x110);
    puVar7 = (undefined1 *)(lVar9 * 0x38 + param_3[2] + 0x34);
    do {
      uVar8 = uVar8 - 1;
      if (lVar11 == 0) {
        local_60 = 1;
      }
      else {
        func_0x000140002200();
        local_60 = func_0x0001400021c0();
        if (local_60 == 0) break;
        func_0x000145bc977b();
      }
      func_0x000145b9c4d0();
      fVar1 = *(float *)(plVar10 + -6);
      uVar2 = *puVar5;
      *(long *)(puVar7 + -0x34) = lVar11;
      *(long *)(puVar7 + -0x2c) = local_60;
      *(long *)(puVar7 + -0x24) = lVar11;
      local_98 = (undefined4)local_d0;
      uStack_94 = (undefined4)((ulong)local_d0 >> 0x20);
      uStack_90 = (undefined4)uStack_c8;
      uStack_8c = (undefined4)((ulong)uStack_c8 >> 0x20);
      *(undefined4 *)(puVar7 + -0x1c) = local_98;
      *(undefined4 *)(puVar7 + -0x18) = uStack_94;
      *(undefined4 *)(puVar7 + -0x14) = uStack_90;
      *(undefined4 *)(puVar7 + -0x10) = uStack_8c;
      *(undefined8 *)(puVar7 + -0xc) = local_c0;
      *(float *)(puVar7 + -4) = fVar1 * fVar1;
      *puVar7 = uVar2;
      if (uVar8 == 0) {
        lVar9 = lVar9 + 1;
        goto LAB_1459b141f;
      }
      lVar11 = *plVar10;
      plVar10 = plVar10 + 0x1e;
      puVar7 = puVar7 + 0x38;
      lVar9 = lVar9 + 1;
    } while (-1 < lVar11);
  }
  func_0x000145d6944b();
                    /* WARNING: Does not return */
  pcVar6 = (code *)invalidInstructionException();
  (*pcVar6)();
}
