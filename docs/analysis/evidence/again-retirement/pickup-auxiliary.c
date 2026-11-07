
void entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  undefined8 *puVar1;
  long lVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  long lVar7;
  undefined8 *puVar8;
  undefined8 uVar9;
  long lVar10;
  
  puVar5 = (undefined8 *)param_3[2];
  lVar10 = *param_3;
  lVar2 = param_3[1];
  puVar4 = (undefined8 *)param_3[4];
  puVar3 = (undefined8 *)param_3[5];
  puVar6 = (undefined8 *)param_3[3];
  do {
    if (puVar5 == (undefined8 *)0x0) {
LAB_145c8c725:
      if ((lVar10 != 0) && (lVar10 != lVar2)) {
        do {
          lVar7 = lVar10;
          if (*(long *)(lVar7 + 0x10) != 0) {
            puVar5 = *(undefined8 **)(lVar7 + 8);
            puVar6 = puVar5 + *(long *)(lVar7 + 0x10);
            lVar10 = lVar7 + 0x48;
            *param_3 = lVar10;
            param_3[3] = (long)puVar6;
            goto LAB_145c8c6e7;
          }
          lVar10 = lVar7 + 0x48;
        } while (lVar10 != lVar2);
        puVar6 = *(undefined8 **)(lVar7 + 8);
        *param_3 = lVar10;
        param_3[2] = 0;
        param_3[3] = (long)puVar6;
      }
      if ((puVar4 == (undefined8 *)0x0) || (puVar4 == puVar3)) {
        return;
      }
      puVar1 = puVar4 + 1;
      param_3[4] = (long)puVar1;
      puVar8 = (undefined8 *)0x0;
      uVar9 = *puVar4;
      lVar7 = param_4[2];
      puVar5 = puVar8;
      puVar4 = puVar1;
      if (lVar7 == *param_4) {
LAB_145c8c778:
        func_0x000146005df0();
        puVar5 = puVar8;
      }
    }
    else {
      if (puVar5 == puVar6) {
        param_3[2] = 0;
        goto LAB_145c8c725;
      }
LAB_145c8c6e7:
      puVar8 = puVar5 + 1;
      param_3[2] = (long)puVar8;
      uVar9 = *puVar5;
      lVar7 = param_4[2];
      puVar5 = puVar8;
      if (lVar7 == *param_4) goto LAB_145c8c778;
    }
    *(undefined8 *)(param_4[1] + lVar7 * 8) = uVar9;
    param_4[2] = lVar7 + 1;
  } while( true );
}

