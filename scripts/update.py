#!/usr/bin/env python3
"""Rewrites Casks/*.rb from each app's latest GitHub release. Run after publishing a release."""
import hashlib
import json
import pathlib
import urllib.request

OWNER = "brijraj-rana"
APPS = [
    # token, app name, one line, command-line tool inside the bundle (or None), files to remove on zap
    ("smol", "Smol", "Image compressor with a dial for an interface", ("smol-cli", "smol"),
     ["~/Library/Preferences/com.brijraj.smol.plist"]),
    ("notchload", "Notchload", "System load monitor under the MacBook notch", None,
     ["~/Library/Preferences/com.brijraj.notchload.plist"]),
    ("notchshelf", "Notchshelf", "File shelf under the MacBook notch", None,
     ["~/Library/Application Support/Notchshelf", "~/Library/Preferences/com.brijraj.notchshelf.plist"]),
    ("portpeek", "Portpeek", "Lists listening localhost ports from a screen corner", None,
     ["~/Library/Preferences/com.brijraj.portpeek.plist"]),
    ("launchcheck", "Launchcheck", "Checks a website for SEO mistakes before it goes live", ("launchcheck-cli", "launchcheck"),
     ["~/Library/Application Support/Launchcheck", "~/Library/Preferences/com.brijraj.launchcheck.plist"]),
    ("launchwatch", "Launchwatch", "Keeps checking live websites from the menu bar", None,
     ["~/Library/Application Support/Launchwatch", "~/Library/Preferences/com.brijraj.launchwatch.plist"]),
]

root = pathlib.Path(__file__).resolve().parent.parent


def latest(token):
    with urllib.request.urlopen(f"https://api.github.com/repos/{OWNER}/{token}/releases/latest") as response:
        release = json.load(response)
    asset = next(a for a in release["assets"] if a["name"].endswith(".dmg"))
    with urllib.request.urlopen(asset["browser_download_url"]) as response:
        digest = hashlib.sha256(response.read()).hexdigest()
    return release["tag_name"].lstrip("v"), digest


for token, name, desc, tool, zap in APPS:
    version, digest = latest(token)
    lines = [
        f'cask "{token}" do',
        f'  version "{version}"',
        f'  sha256 "{digest}"',
        "",
        f'  url "https://github.com/{OWNER}/{token}/releases/download/v#{{version}}/{name}-#{{version}}.dmg"',
        f'  name "{name}"',
        f'  desc "{desc}"',
        f'  homepage "https://github.com/{OWNER}/{token}"',
        "",
        "  livecheck do",
        "    url :url",
        "    strategy :github_latest",
        "  end",
        "",
        "  depends_on macos: :sonoma",
        "",
        f'  app "{name}.app"',
    ]
    if tool:
        lines.append(f'  binary "#{{appdir}}/{name}.app/Contents/Resources/{tool[0]}", target: "{tool[1]}"')
    lines.append("")
    if len(zap) == 1:
        lines.append(f'  zap trash: "{zap[0]}"')
    else:
        lines.append("  zap trash: [")
        lines += [f'    "{path}",' for path in sorted(zap)]
        lines.append("  ]")
    lines += [
        "",
        "  caveats <<~EOS",
        f"    {name} is signed ad hoc and not notarized, so macOS blocks the first launch.",
        "    Open it once, then allow it under System Settings > Privacy & Security > Open Anyway.",
        "  EOS",
        "end",
    ]
    (root / "Casks" / f"{token}.rb").write_text("\n".join(lines) + "\n")
    print(f"{token} {version}")
