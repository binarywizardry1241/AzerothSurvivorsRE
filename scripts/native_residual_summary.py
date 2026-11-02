"""Select an exact residual snapshot without changing its native classification."""

from coverage_common import file_sha256, load_json, project_path

LEGACY_SUMMARY = 'runtime/q41-ownership-0.115.0/residual-summary-v2.json'


def _is_summary(value):
    return (isinstance(value, dict) and isinstance(value.get('generator'), dict)
            and value['generator'].get('path') == 'scripts/classify-native-residuals.py')


def residual_summary_path(proof_path, explicit=None):
    """Replay the proof's actual snapshot; new proposals may select another.

    Producers still verify the selected summary's target, census and data. A
    retained proof must identify one exact, unchanged summary receipt; only a
    new proof without explicit selection falls back to the original snapshot.
    """
    if explicit is not None:
        selected = project_path(explicit)
    elif not proof_path.exists():
        selected = project_path(LEGACY_SUMMARY)
    else:
        matches = []
        inputs = load_json(proof_path).get('inputs')
        if not isinstance(inputs, list):
            raise ValueError('Retained proof inputs must be receipts')
        for receipt in inputs:
            if not isinstance(receipt, dict) or not isinstance(receipt.get('path'), str):
                raise ValueError('Malformed retained input receipt')
            if not receipt['path'].endswith('.json'):
                continue
            candidate = project_path(receipt['path'])
            if not candidate.is_file():
                raise ValueError('Retained input is missing: '+receipt['path'])
            if _is_summary(load_json(candidate)):
                if file_sha256(candidate) != receipt.get('sha256'):
                    raise ValueError('Retained residual snapshot changed')
                matches.append(candidate)
        if len(matches) != 1:
            raise ValueError('Retained residual summary is missing or ambiguous')
        selected = matches[0]
    if not selected.is_file():
        raise ValueError('Selected residual summary is missing')
    if not _is_summary(load_json(selected)):
        raise ValueError('Selected input is not a residual summary')
    return selected
