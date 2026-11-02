int * entry(undefined8 param_1,undefined8 param_2,char param_3,int *param_4,undefined8 param_5,
           int *param_6)

{
  uint uVar1;
  long lVar2;
  uint uVar3;
  uint uVar4;
  int *in_stack_00000028;
  long local_98;
  long local_80;
  int local_38;

  func_0x0001459a3e80();
  if ((0x59U >> (param_3 - 2U & 0x1f) & (byte)(param_3 - 2U) < 7) == 1) {
    lVar2 = 0;
    do {
      uVar1 = param_6[lVar2];
      if (uVar1 != 0) {
        uVar3 = uVar1;
        if ((((99999 < uVar1) && (uVar4 = uVar1 - 100000, uVar4 < 12000)) && (uVar4 % 10 == 0)) &&
           (uVar4 = (uVar4 * 0xcccd >> 0x13) * -0x3333 - 1, uVar3 = uVar1 + 10,
           0x1999 < (ushort)((ushort)uVar4 >> 1 | (ushort)((uVar4 & 1) != 0) << 0xf))) {
          uVar3 = uVar1;
        }
        param_4[lVar2] = uVar3;
      }
      if (in_stack_00000028[lVar2 * 2] == 1) {
        uVar1 = in_stack_00000028[lVar2 * 2 + 1];
        uVar3 = uVar1;
        if (((99999 < uVar1) && (uVar4 = uVar1 - 100000, uVar4 < 12000)) &&
           ((uVar4 % 10 == 0 &&
            (uVar4 = (uVar4 * 0xcccd >> 0x13) * -0x3333 - 1, uVar3 = uVar1 + 10,
            0x1999 < (ushort)((ushort)uVar4 >> 1 | (ushort)((uVar4 & 1) != 0) << 0xf))))) {
          uVar3 = uVar1;
        }
        param_4[lVar2] = uVar3;
      }
      lVar2 = lVar2 + 1;
    } while (lVar2 != 0x13);
  }
  else {
    if (*param_6 != 0) {
      *param_4 = *param_6;
    }
    if (*in_stack_00000028 == 1) {
      *param_4 = in_stack_00000028[1];
    }
    if (param_6[1] != 0) {
      param_4[1] = param_6[1];
    }
    if (in_stack_00000028[2] == 1) {
      param_4[1] = in_stack_00000028[3];
    }
    if (param_6[2] != 0) {
      param_4[2] = param_6[2];
    }
    if (in_stack_00000028[4] == 1) {
      param_4[2] = in_stack_00000028[5];
    }
    if (param_6[3] != 0) {
      param_4[3] = param_6[3];
    }
    if (in_stack_00000028[6] == 1) {
      param_4[3] = in_stack_00000028[7];
    }
    if (param_6[4] != 0) {
      param_4[4] = param_6[4];
    }
    if (in_stack_00000028[8] == 1) {
      param_4[4] = in_stack_00000028[9];
    }
    if (param_6[5] != 0) {
      param_4[5] = param_6[5];
    }
    if (in_stack_00000028[10] == 1) {
      param_4[5] = in_stack_00000028[0xb];
    }
    if (param_6[6] != 0) {
      param_4[6] = param_6[6];
    }
    if (in_stack_00000028[0xc] == 1) {
      param_4[6] = in_stack_00000028[0xd];
    }
    if (param_6[7] != 0) {
      param_4[7] = param_6[7];
    }
    if (in_stack_00000028[0xe] == 1) {
      param_4[7] = in_stack_00000028[0xf];
    }
    if (param_6[8] != 0) {
      param_4[8] = param_6[8];
    }
    if (in_stack_00000028[0x10] == 1) {
      param_4[8] = in_stack_00000028[0x11];
    }
    if (param_6[9] != 0) {
      param_4[9] = param_6[9];
    }
    if (in_stack_00000028[0x12] == 1) {
      param_4[9] = in_stack_00000028[0x13];
    }
    if (param_6[10] != 0) {
      param_4[10] = param_6[10];
    }
    if (in_stack_00000028[0x14] == 1) {
      param_4[10] = in_stack_00000028[0x15];
    }
    if (param_6[0xb] != 0) {
      param_4[0xb] = param_6[0xb];
    }
    if (in_stack_00000028[0x16] == 1) {
      param_4[0xb] = in_stack_00000028[0x17];
    }
    if (param_6[0xc] != 0) {
      param_4[0xc] = param_6[0xc];
    }
    if (in_stack_00000028[0x18] == 1) {
      param_4[0xc] = in_stack_00000028[0x19];
    }
    if (param_6[0xd] != 0) {
      param_4[0xd] = param_6[0xd];
    }
    if (in_stack_00000028[0x1a] == 1) {
      param_4[0xd] = in_stack_00000028[0x1b];
    }
    if (param_6[0xe] != 0) {
      param_4[0xe] = param_6[0xe];
    }
    if (in_stack_00000028[0x1c] == 1) {
      param_4[0xe] = in_stack_00000028[0x1d];
    }
    if (param_6[0xf] != 0) {
      param_4[0xf] = param_6[0xf];
    }
    if (in_stack_00000028[0x1e] == 1) {
      param_4[0xf] = in_stack_00000028[0x1f];
    }
    if (param_6[0x10] != 0) {
      param_4[0x10] = param_6[0x10];
    }
    if (in_stack_00000028[0x20] == 1) {
      param_4[0x10] = in_stack_00000028[0x21];
    }
    if (param_6[0x11] != 0) {
      param_4[0x11] = param_6[0x11];
    }
    if (in_stack_00000028[0x22] == 1) {
      param_4[0x11] = in_stack_00000028[0x23];
    }
    if (param_6[0x12] != 0) {
      param_4[0x12] = param_6[0x12];
    }
    if (in_stack_00000028[0x24] == 1) {
      param_4[0x12] = in_stack_00000028[0x25];
    }
  }
  func_0x0001459a4ba0();
  if (local_98 != -1) {
    if (local_98 != 0) {
      func_0x0001400021d0();
    }
    if (local_80 != 0) {
      func_0x0001400021d0();
    }
    if (local_38 == 0x11) {
      param_4[0x10] = 0;
    }
  }
  return param_4;
}
