
undefined1  [16] entry(void)

{
  long lVar1;
  code *pcVar2;
  long lVar3;
  long lVar4;
  undefined8 *in_RCX;
  long lVar5;
  long lVar6;
  ulong uVar7;
  undefined1 auVar8 [16];
  undefined8 uStack_48;
  
  uStack_48 = 0x1402131f6;
  lVar3 = func_0x0001460044e0();
  lVar3 = -lVar3;
  *(undefined8 *)(&stack0x00002040 + lVar3) = 0xfffffffffffffffe;
  *(undefined1 **)(&stack0x00002010 + lVar3) = &stack0xffffffffffffffe0 + lVar3;
  *(undefined8 *)(&stack0x00002018 + lVar3) = 0x2000;
  *(undefined8 *)(&stack0x00002020 + lVar3) = 0;
  (&stack0x00002028)[lVar3] = 0;
  *(undefined8 *)(&stack0x00002030 + lVar3) = *in_RCX;
  uVar7 = in_RCX[2];
  lVar6 = 0x14620cc28;
  *(undefined8 *)(&stack0x00001fe8 + lVar3) = 0;
  if (uVar7 != 0) goto LAB_140213294;
  do {
    lVar5 = 0;
    uVar7 = 0;
    while( true ) {
      if (lVar5 == 0) {
        auVar8._8_8_ = 0;
        auVar8._0_8_ = *(ulong *)(&stack0x00001fe8 + lVar3);
        return auVar8 << 0x40;
      }
      *(long *)(&stack0x00001fe8 + lVar3) = *(long *)(&stack0x00001fe8 + lVar3) + lVar5;
      *(undefined8 *)(&stack0x00002020 + lVar3) = 0;
      if (uVar7 == 0) break;
LAB_140213294:
      lVar1 = *(long *)(&stack0x00002020 + lVar3);
      if (uVar7 < (ulong)(*(long *)(&stack0x00002018 + lVar3) - lVar1)) {
        *(long *)(&stack0x00001ff0 + lVar3) = *(long *)(&stack0x00002010 + lVar3) + lVar1;
        *(ulong *)(&stack0x00001ff8 + lVar3) = uVar7;
        *(undefined8 *)(&stack0x00002000 + lVar3) = 0;
        (&stack0x00002008)[lVar3] = 0;
        if ((&stack0x00002028)[lVar3] == '\0') {
          pcVar2 = *(code **)(*(long *)(*(long *)(&stack0x00002030 + lVar3) + 8) + 0x48);
          *(undefined8 *)((long)&uStack_48 + lVar3) = 0x140213368;
          lVar4 = (*pcVar2)();
          lVar6 = *(long *)(&stack0x00002000 + lVar3);
          if ((&stack0x00002008)[lVar3] != '\0') {
            *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14021338b;
            func_0x00014600505d();
            (&stack0x00002028)[lVar3] = 1;
          }
        }
        else {
          (&stack0x00002008)[lVar3] = 1;
          pcVar2 = *(code **)(*(long *)(*(long *)(&stack0x00002030 + lVar3) + 8) + 0x48);
          *(undefined8 *)((long)&uStack_48 + lVar3) = 0x1402132ff;
          lVar4 = (*pcVar2)();
          lVar6 = *(long *)(&stack0x00002000 + lVar3);
        }
        lVar5 = lVar1 + lVar6;
        *(long *)(&stack0x00002020 + lVar3) = lVar5;
        uVar7 = uVar7 - lVar6;
        in_RCX[2] = uVar7;
        lVar6 = 0x14620cc28;
        *(long *)(&stack0x00001fe0 + lVar3) = lVar4;
      }
      else {
        pcVar2 = *(code **)(*(long *)(*(long *)(&stack0x00002030 + lVar3) + 8) + 0x48);
        *(undefined8 *)((long)&uStack_48 + lVar3) = 0x140213328;
        lVar4 = (*pcVar2)();
        lVar5 = *(long *)(&stack0x00002020 + lVar3);
        uVar7 = (uVar7 + lVar1) - lVar5;
        in_RCX[2] = uVar7;
        *(long *)(&stack0x00001fe0 + lVar3) = lVar4;
      }
      if (lVar4 != 0) {
                    /* WARNING: Could not recover jumptable at 0x0001402133ca. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        auVar8 = (*(code *)(*(int *)(lVar6 + (ulong)((uint)lVar4 & 3) * 4) + lVar6))();
        return auVar8;
      }
    }
  } while( true );
}

