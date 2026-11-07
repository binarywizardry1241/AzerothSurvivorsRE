  if (*(char *)(param_7 + 0xa10) == '\0') {
    fVar23 = param_6[1];
  }
  else {
    fVar23 = param_6[1];
    fVar20 = (float)*(undefined8 *)(param_7 + 0xa14) - *param_6;
    fVar31 = (float)((ulong)*(undefined8 *)(param_7 + 0xa14) >> 0x20) - fVar23;
    if ((_DAT_145df1a50 < fVar31 * fVar31 + fVar20 * fVar20) && (*(char *)(param_7 + 0xa20) != '\0')
       ) {
      *(char *)(param_7 + 0xa20) = *(char *)(param_7 + 0xa20) + -1;
      return;
    }
    *(undefined4 *)(param_7 + 0xa10) = 0;
  }
