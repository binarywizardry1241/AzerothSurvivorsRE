undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  undefined8 uVar1;
  long lVar2;
  undefined8 local_a8;
  undefined8 uStack_a0;
  undefined8 local_98;
  undefined4 local_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined2 local_48;
  undefined1 uStack_46;
  undefined5 uStack_45;
  undefined8 local_38;

  local_38 = 0xfffffffffffffffe;
  if (*param_3 == -1) {
    if (param_3[3] != -1) goto LAB_14000f51b;
    if (*(char *)((long)param_3 + 0x61) == '\0') {
      func_0x0001458ab720(param_3,param_4,0,1);
      func_0x000145889110();
      uVar1 = 0x8000000000000000;
      goto LAB_14000f61f;
    }
  }
  else {
    if (param_3[3] != -1) {
LAB_14000f51b:
      lVar2 = param_3[7];
      if (param_3[6] == -1) {
        lVar2 = 1;
      }
      func_0x0001458aa470(param_3,param_4,param_3[4],&local_78,param_3[5],lVar2);
      if ((param_3[9] != -1) && (func_0x0001458b8970(), CONCAT44(uStack_8c,local_90) != -1)) {
        if (CONCAT44(uStack_74,local_78) != 0) {
          func_0x0001400021d0();
        }
        local_68 = local_80;
        local_78 = local_90;
        uStack_74 = uStack_8c;
        uStack_70 = uStack_88;
        uStack_6c = uStack_84;
      }
      uStack_46 = (undefined1)param_3[0xc];
      func_0x0001458ab720();
      func_0x000145889110();
      param_4[9] = CONCAT53(uStack_45,CONCAT12(uStack_46,local_48));
      param_4[7] = local_58;
      param_4[8] = uStack_50;
      param_4[5] = local_68;
      param_4[6] = uStack_60;
      param_4[3] = CONCAT44(uStack_74,local_78);
      param_4[4] = CONCAT44(uStack_6c,uStack_70);
      *param_4 = local_a8;
      param_4[1] = uStack_a0;
      param_4[2] = local_98;
      return param_4;
    }
    func_0x0001458ab720(param_3,param_4,param_3[2],param_3[1]);
  }
  func_0x000145889110();
  uVar1 = 0x8000000000000001;
LAB_14000f61f:
  param_4[3] = uVar1;
  return param_4;
}
