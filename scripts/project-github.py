#!/usr/bin/env python3
"""Project GitHub CLI, credentials and Git identity checks.

Configuration and CLI authentication live under ignored runtime/github-account/.
Remote operations always use a token selected for the configured account.
"""
import json
import os
from pathlib import Path
import re
import shlex
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def configuration(root=ROOT):
    path = root / "runtime/github-account/project.json"
    if not path.is_file() or path.is_symlink():
        raise ValueError("Project account configuration is missing")
    value = json.loads(path.read_text())
    if value.get("host") != "github.com":
        raise ValueError("Unsupported project GitHub host")
    for key in ("account", "repository"):
        if not isinstance(value.get(key), str) or not re.fullmatch(r"[A-Za-z0-9_.-]+", value[key]):
            raise ValueError("Invalid project account configuration")
    return value


def environment(root=ROOT):
    value = dict(os.environ)
    for key in ("GH_TOKEN", "GITHUB_TOKEN", "GH_ENTERPRISE_TOKEN", "GITHUB_ENTERPRISE_TOKEN",
                "GH_REPO", "GH_CONFIG_DIR", "GH_HOST", "GH_DEBUG", "DEBUG"):
        value.pop(key, None)
    value.update(GH_CONFIG_DIR=str(root / "runtime/github-account/auth"),
                 GH_HOST="github.com", GH_NO_UPDATE_NOTIFIER="1")
    return value


def gh(arguments, env, *, capture=True):
    executable = shutil.which("gh")
    if not executable:
        raise ValueError("GitHub CLI is unavailable")
    result = subprocess.run([executable, *arguments], cwd=ROOT, env=env,
                            capture_output=capture, text=True)
    if result.returncode:
        raise ValueError("Project GitHub command failed; verify project authentication")
    return result.stdout if capture else None


def verified_token(config, root=ROOT):
    env = environment(root)
    # Explicit account selection prevents the active/default account from supplying credentials.
    token = gh(["auth", "token", "--hostname", config["host"], "--user", config["account"]], env).strip()
    if not token:
        raise ValueError("The configured project account is not authenticated")
    env["GH_TOKEN"] = token
    identity = json.loads(gh(["api", "user", "--jq", "{login: .login, id: .id}"], env))
    if identity.get("login", "").casefold() != config["account"].casefold() or type(identity.get("id")) is not int:
        raise ValueError("Authenticated identity does not match the configured project account")
    email = f"{identity['id']}+{identity['login']}@users.noreply.github.com"
    if config.get("email") and config["email"] != email:
        raise ValueError("Project commit email does not match the authenticated account")
    env["GH_REPO"] = config["account"] + "/" + config["repository"]
    return token, env, identity, email


def expected_email(config):
    email = config.get("email", "")
    if not re.fullmatch(r"[0-9]+\+" + re.escape(config["account"]) + r"@users\.noreply\.github\.com", email):
        raise ValueError("A verified project noreply email is required")
    return email


def credential_request(config, text):
    fields = dict(line.split("=", 1) for line in text.splitlines() if "=" in line)
    expected = config["account"] + "/" + config["repository"]
    path = fields.get("path", "").removesuffix(".git")
    if (fields.get("protocol") != "https" or fields.get("host") != config["host"]
            or path.casefold() != expected.casefold()
            or fields.get("username", config["account"]) != config["account"]):
        raise ValueError("Credential request is outside the configured project repository")


def git(arguments):
    return subprocess.check_output(["git", *arguments], cwd=ROOT, text=True).strip()


def check_identity(config, values):
    expected = [config["account"], expected_email(config)] * 2
    if values != expected:
        raise ValueError("Commit author or committer differs from the configured project identity")


def check_pending_identity(config):
    values = []
    for role in ("AUTHOR", "COMMITTER"):
        identity = git(["var", "GIT_" + role + "_IDENT"])
        match = re.fullmatch(r"(.+) <([^>]+)> [0-9]+ [+-][0-9]{4}", identity)
        if not match:
            raise ValueError("Cannot verify the pending commit identity")
        values.extend(match.groups())
    check_identity(config, values)


def push_updates(config, remote, url, text):
    expected = f"https://{config['host']}/{config['account']}/{config['repository']}.git"
    if remote != "origin" or url != expected:
        raise ValueError("Push destination differs from the configured project repository")
    updates = []
    for line in text.splitlines():
        fields = line.split()
        if len(fields) != 4 or fields[0] != "refs/heads/main" or fields[2] != "refs/heads/main" or set(fields[1]) == {"0"}:
            raise ValueError("Only the project main branch may be pushed")
        updates.append(fields)
    return updates


def configure_local(config):
    _, _, identity, email = verified_token(config)
    hooks = "runtime/github-account/hooks"
    existing = subprocess.run(["git", "config", "--local", "--get", "core.hooksPath"],
                              cwd=ROOT, capture_output=True, text=True)
    if existing.returncode == 0 and existing.stdout.strip() != hooks:
        raise ValueError("Existing Git hook configuration needs review")
    gitdir = Path(git(["rev-parse", "--absolute-git-dir"]))
    if existing.returncode != 0 and any(path.is_file() and not path.name.endswith(".sample")
                                      for path in (gitdir / "hooks").glob("*")):
        raise ValueError("Existing Git hooks need review")
    config.update(account=identity["login"], email=email)
    location = ROOT / "runtime/github-account/project.json"
    location.write_text(json.dumps(config, indent=2) + "\n")
    location.chmod(0o600)
    directory = ROOT / hooks
    directory.mkdir(mode=0o700, exist_ok=True)
    for operation in ("pre-commit", "pre-push"):
        hook = directory / operation
        hook.write_text('#!/bin/sh\nset -eu\nproject_root=$(git rev-parse --show-toplevel)\n'
                        'exec python3 -B "$project_root/scripts/project-github.py" ' + operation + ' "$@"\n')
        hook.chmod(0o700)
    settings = {"user.name": config["account"], "user.email": email, "user.useConfigOnly": "true",
                "commit.gpgsign": "false", "core.hooksPath": hooks, "push.default": "simple",
                "push.followTags": "false", "credential.https://github.com.username": config["account"],
                "credential.https://github.com.useHttpPath": "true"}
    for key, value in settings.items():
        subprocess.run(["git", "config", "--local", key, value], cwd=ROOT, check=True)
    key = "credential.https://github.com.helper"
    subprocess.run(["git", "config", "--local", "--unset-all", key], cwd=ROOT, capture_output=True)
    helper = "!" + shlex.join([sys.executable, "-B", str(ROOT / "scripts/project-github.py"), "credential"])
    for value in ("", helper):
        subprocess.run(["git", "config", "--local", "--add", key, value], cwd=ROOT, check=True)
    check_pending_identity(config)
    print("Project account, credentials and commit/push hooks configured")


def main(arguments=None):
    arguments = list(sys.argv[1:] if arguments is None else arguments)
    if not arguments:
        raise ValueError("Usage: project-github.py gh <arguments> | identity | configure | login | credential <operation> | pre-commit | pre-push")
    config = configuration()
    mode, *arguments = arguments
    if mode == "configure":
        configure_local(config)
    elif mode == "login":
        gh(["auth", "login", "--hostname", config["host"], "--git-protocol", "https", "--web"], environment(), capture=False)
        verified_token(config)
    elif mode == "credential":
        if arguments != ["get"]:
            return
        credential_request(config, sys.stdin.read())
        token, _, _, _ = verified_token(config)
        sys.stdout.write(f"username={config['account']}\npassword={token}\n\n")
    elif mode == "identity":
        _, _, identity, email = verified_token(config)
        print(json.dumps(dict(account=identity["login"], id=identity["id"], email=email)))
    elif mode == "gh":
        if not arguments or arguments[0] == "auth":
            raise ValueError("Use the dedicated project login configuration for authentication")
        _, env, _, _ = verified_token(config)
        gh(arguments, env, capture=False)
    elif mode == "pre-commit":
        check_pending_identity(config)
    elif mode == "pre-push":
        if len(arguments) != 2:
            raise ValueError("Missing push destination")
        updates = push_updates(config, *arguments, sys.stdin.read())
        verified_token(config)
        for _, local, _, remote in updates:
            revisions = [local] + (["--not", remote] if set(remote) != {"0"} else [])
            for commit in git(["rev-list", *revisions]).splitlines():
                values = git(["show", "-s", "--format=%an%x00%ae%x00%cn%x00%ce", commit]).split("\0")
                check_identity(config, values)
    else:
        raise ValueError("Unknown project GitHub operation")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, OSError, subprocess.CalledProcessError) as error:
        print(str(error), file=sys.stderr)
        raise SystemExit(1)
