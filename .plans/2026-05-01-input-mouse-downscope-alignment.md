# aerobeat-input-mouse

**Date:** 2026-05-01  
**Status:** Complete  
**Agent:** Chip 🐱‍💻

---

## Goal

Align `aerobeat-input-mouse` with the locked AeroBeat v1 downscope. Future/deprioritized gameplay path; mouse remains valid for UI/menu navigation.

---

## Overview

This repo is part of the AeroBeat input/platform downscope wave following the completed shell pass. The work stayed intentionally narrow and truthful: README, plugin metadata, testbed manifest, and repo-local validation surfaces were aligned to the current docs truth.

The key distinction for this repo is now explicit: mouse is still a legitimate desktop pointer path for PC UI and menu interaction, but it should not be presented as official v1 gameplay parity. Official gameplay remains camera-first for Boxing and Flow.

---

## REFERENCES

| ID | Description | Path |
| --- | --- | --- |
| `REF-01` | Parent input/platform coordination plan | `/home/derrick/.openclaw/workspace/projects/openclaw-chip/.plans/2026-05-01-aerobeat-input-platform-downscope-pass.md` |
| `REF-02` | Downscoped docs source of truth | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs` |
| `REF-03` | Owning repo | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-input-mouse` |
| `REF-04` | Input strategy / navigation-vs-gameplay truth | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/gdd/input-system/agnostic-input.md` |
| `REF-05` | Product concept / release-order truth | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/gdd/concept.md` |

---

## Tasks

### Task 1: Audit and align repo truth

**Bead ID:** `oc-1av`  
**SubAgent:** `primary`  
**Role:** `coder`  
**References:** `REF-01`, `REF-02`, `REF-03`, `REF-04`, `REF-05`  
**Prompt:** Claim the assigned bead, audit the repo against the downscoped AeroBeat docs truth, implement the required alignment changes, run relevant validation, commit/push to `main`, and leave concise QA handoff notes.

**Folders Created/Deleted/Modified:**
- `.plans/`
- `.testbed/`

**Files Created/Deleted/Modified:**
- `README.md`
- `plugin.cfg`
- `.testbed/addons.jsonc`
- `.testbed/tests/test_example.gd`
- `.plans/2026-05-01-input-mouse-downscope-alignment.md`

**Status:** ✅ Complete

**Results:** Claimed bead `oc-1av` and completed the repo-local truth pass. Updated `README.md` to make the scope distinction explicit: mouse is preserved as a future/deprioritized gameplay-input lane while remaining valid for PC UI/menu navigation. Updated `plugin.cfg` to use truthful product wording and bumped the version to `0.1.1` for the metadata pass. Replaced the stale transition-era `aerobeat-core` testbed dependency with `aerobeat-input-core` in `.testbed/addons.jsonc`. Expanded the repo-local GUT test to assert the truthful plugin wording and the lane-correct manifest key. Validated by running `godotenv addons install`, `godot --headless --path .testbed --import`, and the GUT suite; all three tests passed. Changes were checked against the downscoped docs truth in `REF-04` and `REF-05`.

**QA Findings (2026-05-01):** Independent QA reran the full repo validation flow (`godotenv addons install`, `godot --headless --path .testbed --import`, and the GUT suite) and confirmed the coder handoff is directionally correct against `REF-04` and `REF-05`. README, `plugin.cfg`, `.testbed/addons.jsonc`, and `.testbed/tests/test_example.gd` all align on the intended truth split: mouse remains valid for PC UI/menu navigation, while official v1 gameplay stays camera-first and mouse is not presented as parity gameplay input. The manifest now uses `aerobeat-input-core` as required. One repo-local validation artifact was generated during QA (`.testbed/tests/test_example.gd.uid`); treat it as a cleanup candidate unless this repo intentionally tracks Godot UID sidecars for test scripts. Attempted a non-closing `bd update` to attach QA notes, but it failed with a repo identity mismatch (`metadata.json project_id` ≠ database `_project_id`), so the bead was left open and no override was forced.

**Auditor Findings (2026-05-01):** Independent audit pass. Re-read `REF-04` and `REF-05`, re-verified `README.md`, `plugin.cfg`, `.testbed/addons.jsonc`, and `.testbed/tests/test_example.gd`, and reran the full validation flow: `godotenv addons install`, `godot --headless --path .testbed --import`, and the GUT suite. All checks passed again (3/3 tests). The only persistent post-validation dirt was `.testbed/tests/test_example.gd.uid`. Based on the AeroBeat GodotEnv contract (`aerobeat-docs/docs/architecture/godotenv-convention-contract.md`, section 6.3 / 7.2) and the broader UID hygiene guidance, that generated sidecar is the truthful canonical repo state and should be committed rather than deleted. Bead closure required a Beads identity-check override because this repo currently reports a `metadata.json` vs database project-id mismatch even though `bd context --json` still resolves to this repo-local `.beads` directory.

---

## Final Results

**Status:** ✅ Complete

**What We Built:** A truthful downscope alignment for `aerobeat-input-mouse` plus independent QA/audit confirmation. The repo now presents mouse support as a valid PC UI/menu navigation path and future-facing input lane without implying current official gameplay parity, and its repo-local validation surfaces match that story.

**Reference Check:** Satisfied `REF-04` by making the navigation-vs-gameplay split explicit and keeping the manifest/tests pinned to the `aerobeat-input-core` lane instead of the old `aerobeat-core` key. Satisfied `REF-05` by keeping the repo aligned to the narrower camera-first Boxing/Flow v1 product claim.

**Commits:**
- `a4d963c` - Truth-align mouse input repo scope
- Pending audit commit for plan update + committed test UID sidecar

**Lessons Learned:** Even the light future-input repos still carried stale truth in both human-facing docs and dev/test manifests. Also, for these GodotEnv repos, a generated test-script `.uid` sidecar can be part of the truthful source state rather than disposable noise; repo cleanliness after validation depends on making that call explicitly.

**Follow-up Notes:** Repo content and validation are now complete for this bead, but the repo-local Beads metadata/database project-id mismatch should be cleaned up separately so future `bd update` / `bd close` calls do not require `BEADS_SKIP_IDENTITY_CHECK=1`.

---

*Completed on 2026-05-01*
