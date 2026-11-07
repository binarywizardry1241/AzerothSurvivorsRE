undefined8 entry(void)

{
  int in_ECX;

  if (in_ECX < 0x166c) {
    if (in_ECX < 0x5a9) {
      if (0x79 < in_ECX) {
        if (in_ECX != 0x7a) {
          if (in_ECX == 0x30b) {
            return 1;
          }
          if (in_ECX != 0x488) {
            return 0;
          }
        }
        return 1;
      }
      if (in_ECX != 10) {
        if (in_ECX == 0x78) {
          return 1;
        }
        return 0;
      }
    }
    else if (in_ECX < 0x690) {
      if (in_ECX == 0x5a9) {
        return 1;
      }
      if (in_ECX != 0x5e6) {
        return 0;
      }
    }
    else if (in_ECX != 0x690) {
      if (in_ECX == 0x79d) {
        return 1;
      }
      if (in_ECX != 0x848) {
        return 0;
      }
      return 1;
    }
  }
  else if (in_ECX < 0x35f2) {
    if (in_ECX < 0x1fba) {
      if ((in_ECX != 0x166c) && (in_ECX != 0x18c7)) {
        return 0;
      }
    }
    else if (in_ECX != 0x1fba) {
      if (in_ECX == 0x2b69) {
        return 1;
      }
      if (in_ECX != 0x2da3) {
        return 0;
      }
      return 1;
    }
  }
  else {
    if (in_ECX < 0x4212) {
      if (in_ECX == 0x35f2) {
        return 1;
      }
      if (in_ECX != 0x3b85) {
        return 0;
      }
      return 1;
    }
    if (((in_ECX != 0x4212) && (in_ECX != 0x5045)) && (in_ECX != 0x67cd)) {
      return 0;
    }
  }
  return 1;
}
