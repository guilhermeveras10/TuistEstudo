#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

PLACEHOLDER = "MODULE_NAME"


def rename_paths(root: Path, new_name: str) -> None:
    # Rename deeper nodes first so we don't invalidate parent paths.
    candidates = sorted(
        (path for path in root.rglob(f"*{PLACEHOLDER}*")),
        key=lambda path: len(str(path)),
        reverse=True,
    )

    for path in candidates:
        target = path.with_name(path.name.replace(PLACEHOLDER, new_name))
        path.rename(target)


def replace_contents(root: Path, new_name: str) -> None:
    for file_path in root.rglob("*"):
        if not file_path.is_file():
            continue

        text = file_path.read_text(encoding="utf-8")
        if PLACEHOLDER not in text:
            continue
        file_path.write_text(text.replace(PLACEHOLDER, new_name), encoding="utf-8")


def main() -> None:
    if len(sys.argv) != 3:
        print("Usage: create_module.py <destination> <module_name>", file=sys.stderr)
        sys.exit(1)

    destination = Path(sys.argv[1])
    module_name = sys.argv[2]

    if not destination.exists():
        print(f"Destination '{destination}' not found.", file=sys.stderr)
        sys.exit(1)

    rename_paths(destination, module_name)
    replace_contents(destination, module_name)


if __name__ == "__main__":
    main()
