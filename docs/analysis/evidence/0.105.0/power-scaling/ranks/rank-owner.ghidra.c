
void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined8 *puVar1;
  long lVar2;
  long lVar3;
  undefined8 uVar4;
  char cVar5;
  long *plVar6;
  long *plVar7;
  undefined8 unaff_RBX;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  byte bVar13;
  float in_XMM9_Da;
  float fVar14;
  float in_XMM11_Da;
  undefined2 local_178;
  undefined1 uStack_176;
  undefined4 uStack_175;
  undefined4 uStack_171;
  undefined4 uStack_16d;
  undefined4 uStack_169;
  undefined8 uStack_165;
  long local_140;
  uint local_134;
  undefined4 uStack_130;
  undefined3 uStack_12c;
  undefined2 local_112;
  undefined8 local_110;
  undefined2 local_108;
  undefined1 uStack_106;
  undefined4 uStack_105;
  undefined4 uStack_101;
  undefined1 uStack_f9;
  undefined1 auStack_df [10];
  undefined1 local_d5;

  local_140 = 0;
  if (*(long *)(param_3 + 0x10) != 0) {
    plVar7 = *(long **)(param_3 + 8);
    plVar6 = plVar7 + *(long *)(param_3 + 0x10) * 2;
    lVar10 = 0;
    local_134 = (uint)plVar6;
    do {
      lVar2 = *(long *)(*plVar7 + 0x58);
      if (lVar2 != 0) {
        fVar14 = (float)*(byte *)(plVar7 + 1);
        lVar8 = lVar10 * 0x48 + 0x2d;
        lVar9 = *(long *)(*plVar7 + 0x50) + 0x25;
        lVar11 = 0;
        do {
          lVar3 = *plVar7;
          bVar13 = *(byte *)(lVar9 + -0x25 + lVar11);
          cVar5 = bVar13 - 0x23;
          if (bVar13 < 0x23) {
            cVar5 = '\x02';
          }
          if (cVar5 == '\0') {
            uVar12 = (ulong)*(byte *)(lVar9 + -0x1d + lVar11);
            in_XMM9_Da = *(float *)(lVar9 + -0x21 + lVar11) * fVar14;
            bVar13 = 0x23;
          }
          else if (cVar5 == '\x01') {
            uVar12 = (ulong)*(byte *)(lVar9 + -0x1d + lVar11);
            uStack_12c = (undefined3)((uint)*(undefined4 *)(lVar9 + -0x19 + lVar11) >> 8);
            uStack_130 = *(undefined4 *)(lVar9 + -0x1c + lVar11);
            unaff_RBX = *(undefined8 *)(lVar9 + -0x15 + lVar11);
            local_110 = *(undefined8 *)(lVar9 + -0xd + lVar11);
            local_d5 = *(undefined1 *)(lVar9 + -1 + lVar11);
            in_XMM11_Da = *(float *)(lVar9 + -5 + lVar11) * fVar14;
            bVar13 = 0x24;
          }
          else {
            puVar1 = (undefined8 *)(lVar9 + lVar11);
            local_112 = *(undefined2 *)(lVar9 + -0x23 + lVar11);
            in_XMM9_Da = *(float *)(lVar9 + -0x21 + lVar11);
            uVar12 = *(ulong *)(lVar9 + -0x1d + lVar11);
            unaff_RBX = *(undefined8 *)(lVar9 + -0x15 + lVar11);
            local_110 = *(undefined8 *)(lVar9 + -0xd + lVar11);
            in_XMM11_Da = *(float *)(lVar9 + -5 + lVar11);
            local_d5 = *(undefined1 *)(lVar9 + -1 + lVar11);
            if (bVar13 < 0x23) {
                    /* WARNING: Could not emulate address calculation at 0x0001458e1a8d */
                    /* WARNING: Treating indirect jump as call */
              (*(code *)((long)*(int *)((ulong)bVar13 * 4 + 0x146e78130) + 0x146e78130))
                        ((float)((int)plVar7[1] + (uint)((char)(int)plVar7[1] == '\0') & 0xff),
                         uVar12 & 0xffffffff);
              return;
            }
            uVar4 = *puVar1;
            uStack_165 = *(undefined8 *)((long)puVar1 + 0x13);
            local_108 = (undefined2)uVar4;
            uStack_106 = (undefined1)((ulong)uVar4 >> 0x10);
            uStack_105 = (undefined4)((ulong)uVar4 >> 0x18);
            uStack_101._0_1_ = (undefined1)((ulong)uVar4 >> 0x38);
            uStack_101._1_3_ = (undefined3)puVar1[1];
            auStack_df._0_4_ = (undefined4)(uVar12 >> 8);
            uStack_12c = (undefined3)(uVar12 >> 0x28);
            uStack_130 = auStack_df._0_4_;
            local_178 = local_108;
            uStack_176 = uStack_106;
            uStack_175 = uStack_105;
            uStack_171 = uStack_101;
            uStack_16d = (undefined4)*(undefined8 *)((long)puVar1 + 0xb);
            uStack_169 = (undefined4)((ulong)*(undefined8 *)((long)puVar1 + 0xb) >> 0x20);
            local_134 = (uint)*(byte *)(lVar9 + -0x24 + lVar11);
          }
          if (lVar10 == 0) {
            func_0x000145bcb450();
          }
          *(long *)(lVar8 + -0x25) = lVar3;
          *(byte *)(lVar8 + -0x1d) = bVar13;
          *(char *)(lVar8 + -0x1c) = (char)local_134;
          *(undefined2 *)(lVar8 + -0x1b) = local_112;
          *(float *)(lVar8 + -0x19) = in_XMM9_Da;
          *(char *)(lVar8 + -0x15) = (char)uVar12;
          auStack_df._2_4_ = (undefined4)(CONCAT34(uStack_12c,uStack_130) >> 0x18);
          *(undefined4 *)(lVar8 + -0x14) = uStack_130;
          *(undefined4 *)(lVar8 + -0x11) = auStack_df._2_4_;
          *(undefined8 *)(lVar8 + -0xd) = unaff_RBX;
          *(undefined8 *)(lVar8 + -5) = local_110;
          *(float *)(lVar8 + 3) = in_XMM11_Da;
          *(undefined1 *)(lVar8 + 7) = local_d5;
          uStack_f9 = (undefined1)uStack_169;
          *(ulong *)(lVar8 + 8) =
               CONCAT17((char)uStack_171,CONCAT43(uStack_175,CONCAT12(uStack_176,local_178)));
          *(ulong *)(lVar8 + 0x10) = CONCAT17(uStack_f9,CONCAT43(uStack_16d,uStack_171._1_3_));
          *(ulong *)(lVar8 + 0x13) = CONCAT44(uStack_169,uStack_16d);
          *(undefined8 *)(lVar8 + 0x1b) = uStack_165;
          lVar10 = lVar10 + 1;
          lVar8 = lVar8 + 0x48;
          lVar11 = lVar11 + 0x40;
          local_140 = lVar10;
        } while (lVar2 << 6 != lVar11);
      }
      plVar7 = plVar7 + 2;
    } while (plVar7 != plVar6);
  }
  param_4[2] = local_140;
  *param_4 = 0;
  param_4[1] = 8;
  return;
}
