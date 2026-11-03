# Seal of the Damned in 0.139.2

[Finding #308](../verification-needed.md#gap-308) and the
[native receipt](evidence/0.139.2/seal-of-the-damned.json) bind this repair
to SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

The ring descriptor at `0x1476b0350` retains a base of 0.1 and uses native
jewelry tag 19 (source tag 18). The pick increment uses ten times the base
as its ceiling and reduces the raw rarity-scaled gain by the remaining
fraction. First picks still use the 1.5 multiplier. The offer filter admits
a worn ring below 90% of that ceiling. The stat refresh sums the ring
contribution, clamps at 1.0 and stores the result at Game `+0x614`.
The worn tooltip uses a 100% maximum.

The ability cast owner reads that field and adds it to the tick factor only
when the descriptor's cast kind is 6, the actor-targeted DoT plan.
The selected path scales tick count and total damage while keeping the
periodic duration. Separate ground, channel, friendly and proc-owned
periodic constructors retain their existing inputs. The reconstructed
ring offers and acceptance, stat refresh, cast plan, Codex and worn tooltip
now use the recovered values. The guest preview uses the same DoT plan.

Ninety isolated native cases matched the increment model across rarity,
initial and repeat picks, the former ceiling and values near and above 100%.
The exact aggregate, display and cast-kind operands were checked separately.
Compilation, rebuilt application and original/rebuilt parity remain open.
