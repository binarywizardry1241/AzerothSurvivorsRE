
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  if (param_3 == 0xd) {
    if (*(long *)((long)param_4 + 5) == 0x656d616c665f666f && *param_4 == 0x5f666f5f6c6c6163) {
      return _DAT_1458fcc38;
    }
  }
  else if (param_3 == 0xc) {
    if ((int)param_4[1] == 0x6b72616d && *param_4 == 0x5f737265746e7568) {
      return _DAT_1458f6624;
    }
  }
  else if (param_3 == 9) {
    if ((char)param_4[1] == 'e' && *param_4 == 0x676172646f6f6c62) {
      return _DAT_1458f8e00;
    }
    if ((char)param_4[1] == 'e' && *param_4 == 0x7461665f6c616573) {
      return _DAT_1458f6624;
    }
    if ((char)param_4[1] != 'e' || *param_4 != 0x7269665f6c756f73) {
      if ((char)param_4[1] == 'l' && *param_4 == 0x6c6577746867696c) {
        return _DAT_1458fc8ac;
      }
      if ((char)param_4[1] != 'h' || *param_4 != 0x70726f6d796c6f70) {
        return 0;
      }
    }
    return _DAT_1458f662c;
  }
  return 0;
}

