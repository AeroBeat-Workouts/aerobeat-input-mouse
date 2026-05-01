# aerobeat-input-mouse

**Date:** 2026-05-01  
**Status:** In Progress  
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

---

## Final Results

**Status:** ✅ Complete

**What We Built:** A light truth pass for `aerobeat-input-mouse` that now presents mouse support as a valid PC UI/menu navigation path and future-facing input lane, without implying current official gameplay parity.

**Reference Check:** Satisfied `REF-04` by making the navigation-vs-gameplay split explicit and removing the old `aerobeat-core` lane wording from the testbed manifest. Satisfied `REF-05` by keeping the repo aligned to the narrower camera-first Boxing/Flow v1 product claim.

**Commits:**
- Pending commit/push in this subtask handoff step.

**Lessons Learned:** Even the light future-input repos still carried stale truth in both human-facing docs and dev/test manifests. The safest small pass is README + `plugin.cfg` + `.testbed/addons.jsonc` + a small regression test so the wording drift does not immediately return.

---

*Completed on 2026-05-01*
