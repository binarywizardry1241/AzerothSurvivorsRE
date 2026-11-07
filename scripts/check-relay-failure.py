#!/usr/bin/env python3
"""Check the independent #216 current guest-failure contract; never run a game."""
from coverage_common import ROOT
from script_sources import load_script


if __name__ == "__main__":
    load_script("relay_policy_native", ROOT / "scripts/check-relay-policy.py").main(
        ROOT / "docs/analysis/evidence/relay-failure/manifest.json"
    )
