# AeroBeat Input Driver - Mouse

This repo preserves AeroBeat's mouse input driver as a future-facing input path and a valid PC pointer path for UI/menu navigation.

Mouse is **not** an official AeroBeat v1 gameplay input. The current official gameplay path is **camera-first** for **Boxing** and **Flow**. In practice, this repo should be treated as a future/deprioritized gameplay-input lane while remaining truthful about mouse being useful for desktop navigation, menus, and related test/dev workflows.

Input Drivers bridge hardware and device-specific signals to the AeroBeat input contracts.

## 📋 Repository Details

*   **Type:** Input Driver
*   **License:** **Mozilla Public License 2.0 (MPL 2.0)**
*   **Current v1 scope:** Future/deprioritized gameplay-input lane; valid for PC UI/menu navigation
*   **Dependencies:**
    *   `aerobeat-input-core` (Canonical shared input contract)
    *   `aerobeat-vendor-*` (Allowed)

## GodotEnv development flow

This repo uses the AeroBeat GodotEnv package convention.

- Canonical dev/test manifest: `.testbed/addons.jsonc`
- Installed dev/test addons: `.testbed/addons/`
- GodotEnv cache: `.testbed/.addons/`
- Hidden workbench project: `.testbed/project.godot`
- Repo-local unit tests: `.testbed/tests/`

The repo root remains the package/published boundary for downstream consumers. Day-to-day development, debugging, and validation happen from the hidden `.testbed/` workbench using the pinned OpenClaw toolchain: Godot `4.6.2 stable standard`.

### Restore dev/test dependencies

From the repo root:

```bash
cd .testbed
godotenv addons install
```

That restores this repo's current dev/test manifest into `.testbed/addons/`. In the lane-based architecture, input repos should depend on `aerobeat-input-core`, not the older transition-era `aerobeat-core` key.

### Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and bugfinding surface for input-driver work.

### Import smoke check

From the repo root:

```bash
godot --headless --path .testbed --import
```

### Run unit tests

From the repo root:

```bash
godot --headless --path .testbed --script addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit
```

### Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The current manifest should pin `aerobeat-input-core` for the lane contract alongside GUT.
- Repo-local unit tests live under `.testbed/tests/`; this repo's current package payload is rooted at `/`, so the workbench does not ship a `.testbed/src` bridge for this subset.
- The current package shape is consumed from the repo root (`subfolder: "/"`) for downstream installs.
- Keep product wording truthful: mouse remains fine for PC UI/menu navigation, but official v1 gameplay input is camera-only.
