#!/usr/bin/env python3
"""Check project identity boundaries without network access or credentials."""
import json
import os
import unittest
from unittest.mock import patch
from script_sources import load_script

project = load_script("project_github", "project-github.py")


class ProjectIdentity(unittest.TestCase):
    def setUp(self):
        self.config = dict(host="github.com", account="example", repository="project",
                           email="123+example@users.noreply.github.com")

    def test_inherited_credentials_and_repository_are_removed(self):
        with patch.dict(os.environ, GH_TOKEN="inherited", GITHUB_TOKEN="inherited", GH_REPO="other/project"):
            env = project.environment()
        self.assertNotIn("GH_TOKEN", env)
        self.assertNotIn("GITHUB_TOKEN", env)
        self.assertNotIn("GH_REPO", env)

    def test_credentials_are_limited_to_one_https_repository(self):
        project.credential_request(self.config, "protocol=https\nhost=github.com\npath=example/project.git\n")
        for text in ("protocol=https\nhost=github.com\npath=other/project.git\n",
                     "protocol=http\nhost=github.com\npath=example/project.git\n",
                     "protocol=https\nhost=elsewhere.invalid\npath=example/project.git\n"):
            with self.assertRaises(ValueError):
                project.credential_request(self.config, text)

    def test_regular_email_and_other_commit_identities_are_rejected(self):
        with self.assertRaises(ValueError):
            project.expected_email(dict(self.config, email="example@example.invalid"))
        identity = [self.config["account"], self.config["email"]] * 2
        project.check_identity(self.config, identity)
        for index in range(4):
            wrong = identity.copy(); wrong[index] = "different"
            with self.assertRaises(ValueError):
                project.check_identity(self.config, wrong)

    def test_explicit_token_selection_still_requires_authenticated_identity_match(self):
        result = ["fixture-token", json.dumps(dict(login="different", id=123))]
        with patch.object(project, "gh", side_effect=result):
            with self.assertRaisesRegex(ValueError, "does not match"):
                project.verified_token(self.config)

    def test_verified_noreply_is_derived_from_account_identity(self):
        result = ["fixture-token", json.dumps(dict(login="example", id=123))]
        with patch.object(project, "gh", side_effect=result) as call:
            _, env, identity, email = project.verified_token(self.config)
        self.assertEqual(email, self.config["email"])
        self.assertEqual(env["GH_REPO"], "example/project")
        self.assertIn("--user", call.call_args_list[0].args[0])

    def test_old_branches_tags_and_other_destinations_cannot_be_pushed(self):
        url = "https://github.com/example/project.git"
        update = "refs/heads/main " + "a" * 40 + " refs/heads/main " + "0" * 40
        self.assertEqual(len(project.push_updates(self.config, "origin", url, update)), 1)
        for text in (update.replace("refs/heads/main", "refs/tags/archive"),
                     update.replace("refs/heads/main", "refs/provenance/archive")):
            with self.assertRaises(ValueError):
                project.push_updates(self.config, "origin", url, text)
        with self.assertRaises(ValueError):
            project.push_updates(self.config, "origin", "https://github.com/other/project.git", update)


if __name__ == "__main__":
    unittest.main()
