#!/usr/bin/env python3
"""Replay the complete current typed Save parser and serializer against retained vectors.

--write curates vectors from project-local native recovery inputs. Default is read-only.
No reconstruction is compiled; no native process, filesystem or cache-loading API executes.
"""
import argparse
import hashlib
import json
from pathlib import Path
from native_save_fixture import CPU, ROOT, SHA

DEST = ROOT / "docs/analysis/evidence/0.109.0/save-schema"


def vectors():
    groups = [
        (
            "schema",
            json.loads(
                (
                    ROOT / "runtime/secondary-pages-0.109.0/schema-vectors.json"
                ).read_text()
            ),
        ),
        (
            "extra",
            json.loads(
                (ROOT / "runtime/secondary-pages-0.109.0/schema-extra.json").read_text()
            ),
        ),
        (
            "account",
            json.loads(
                (ROOT / "runtime/fixgap-7-9/account-record-vectors.json").read_text()
            )["cases"],
        ),
        (
            "seed",
            json.loads(
                (
                    ROOT / "runtime/fixgap11-17/save-core/native-schema-seed.json"
                ).read_text()
            ),
        ),
    ]
    for role in ("account-roster-overflow", "account-open-order"):
        groups.append(
            (
                role,
                json.loads(
                    (ROOT / f"runtime/fixgap-7-9/{role}-vectors.json").read_text()
                )["cases"],
            )
        )
    output = {}
    for group, rows in groups:
        for row in rows:
            expected = row.get("expected", row.get("output"))
            case = dict(
                group=row.get("group", group), input=row["input"], expected=expected
            )
            if case["input"] in output:
                assert output[case["input"]]["expected"] == expected
            output[case["input"]] = case
    return list(output.values())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    saved = json.loads((DEST / "fixtures.json").read_text()) if not args.write else None
    cases = vectors() if args.write else saved["cases"]
    cpu = CPU()
    manifest = json.loads((DEST / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    for owner in manifest["owners"]:
        a, b = int(owner["start"], 16), int(owner["end"], 16)
        assert hashlib.sha256(cpu.raw(a, b)).hexdigest() == owner["sha256"]
        for suffix in ("c", "asm"):
            assert (
                hashlib.sha256(
                    (DEST / (owner["role"] + "." + suffix)).read_bytes()
                ).hexdigest()
                == owner[suffix + "_sha256"]
            )
    for case in cases:
        try:
            actual = cpu.serialize(cpu.parse(case["input"]))
        except Exception as error:
            raise RuntimeError(f"Native case failed: {case}") from error
        assert actual == case["expected"], (case, actual)
    appearance_cases = []
    for counts in (None, {}, {(1, 0): (0, 2, 5, 1, 255)}):
        cpu.appearance_counts = counts
        for race, sex in ((1, 0), (2, 0), (1, 1)):
            for values in (
                (0, 0, 0, 0, 0),
                (255, 255, 255, 255, 255),
                (200, 3, 9, 0, 255),
            ):
                packed = sum(value << (8 * i) for i, value in enumerate(values))
                actual = cpu.call(0x1459A2280, packed, race, sex)
                out = [(actual >> (i * 8)) & 255 for i in range(5)]
                expected = (
                    values
                    if counts is None or (race, sex) not in counts
                    else tuple(
                        min(value, max(0, bound - 1))
                        for value, bound in zip(values, counts[race, sex])
                    )
                )
                assert out == list(expected)
                appearance_cases.append(
                    dict(
                        counts=(
                            None
                            if counts is None
                            else [
                                dict(race=r, sex=s, values=v)
                                for (r, s), v in counts.items()
                            ]
                        ),
                        race=race,
                        sex=sex,
                        features=values,
                        expected=out,
                    )
                )
    result = dict(target_sha256=SHA, cases=cases, appearance_cases=appearance_cases)
    if args.write:
        (DEST / "fixtures.json").write_text(
            json.dumps(result, indent=2, ensure_ascii=False) + "\n"
        )
    else:
        assert json.loads(json.dumps(result)) == saved
    print(
        f"Current full Save parser/serializer passed {len(cases)} canonical vectors and {len(appearance_cases)} optional-cache clamp cases"
    )


if __name__ == "__main__":
    main()
