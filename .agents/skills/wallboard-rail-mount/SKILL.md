---
name: wallboard-rail-mount
description: "Design, adapt, render, and verify 3D-printable accessories for the user's Youbang GuaGuaQiang wallboard rail. Use for hooks, holders, hangers, shelves, cable organizers, or any OpenSCAD work in ~/openscad/work-hook. Provides the test-fit mount interface, the selected 2.0 mm lower wall-contact pressure face, a parametric library, strength guidance, and this Mac's Docker render workflow."
---

# Wallboard Rail Mount

Use the validated OpenSCAD interface for the champagne-gold Youbang GuaGuaQiang Parallel rail in the user's wall paneling. The rail clip was print-fit validated on 2026-07-09. A 2.0 mm lower wall-contact reach was selected from the 2.0/2.5 mm fit pair on 2026-07-10.

Read `~/openscad/work-hook/wiki/index.md` first when project history or design rationale matters.

## Canonical Files

- `~/openscad/work-hook/lib/rail-mount.scad` is the production source of truth.
- `~/openscad/work-hook/lib/j-hook.scad` is the production source of truth for the reusable parametric J-hook body helper; it includes `rail-mount.scad`.
- This skill's `rail-mount.scad` and `j-hook.scad` must each remain byte-identical to their production-library counterparts.
- This skill's `example-j-hook.scad` is a runnable 17 mm-span example.
- Production bodies live under `~/openscad/work-hook/accessories/<family>/`; define only families that have real models.

When the interface or J-hook helper changes, edit the corresponding production library first, sync its skill copy, render every production accessory and the skill example, then update the bilingual wiki.

## Geometry Contract

- **FIXED mount:** preserve the rail interface and lower wall-contact dimensions exactly. `rail_accessory()` keeps the contact enabled by default; only a dedicated rail-only ultra-short variant may pass `wall_contact=false`. Do not tolerance-compensate or override the fixed dimensions in body files.
- **FLEXIBLE body:** change the J geometry, peg, holder, shelf bracket, and extrusion width as needed.
- The only mount-side tuning exception is `arm_gusset_r`; reduce it only if a physical fit test shows interference inside the rail.

Datum and axes:

- `X=0`: plate back / rail contact plane.
- `Y=0`: slot ceiling / rail-lip bearing face.
- `+X`: toward the room.
- `+Y`: upward.
- `+Z`: extrusion direction along the rail.

Key fixed dimensions, in millimeters:

| Parameter | Value | Meaning |
|---|---:|---|
| `finger_t` | 2.40 | Rear claw finger thickness |
| `slot_gap` | 2.75 | Rail-lip slot |
| `head_depth` | 7.35 | Total head depth; derives `plate_t=2.20` |
| `arm_t` / `finger_len` | 2.2 / 6.75 | Bridge and finger; total claw height about 9.0 |
| `plate_above` | 9.0 | Plate above the bridge |
| `cap_h` / `cap_back` | 0.5 / 0.8 | Upper anti-rotation cap |
| `pad_back` / `pad_top_drop` | 0.8 / 8.0 | Baseline back contour and J-body datum; not the new pressure reach |
| `wall_contact_back` | 2.0 | Selected total wallward reach from `X=0` |
| `wall_contact_below_rail` / `wall_contact_h` | 8.0 / 5.0 | Default pressure face starts 8 mm below the rail-bottom datum and is 5 mm tall |
| `wall_contact_j_clearance` | 0.2 | Minimum straight clearance before the custom body/J arc |
| `fillet_finger_root` / `fillet_plate_root` | 0.6 / 0.3 | Stress relief while preserving a 1.85 mm flat lip seat |
| `tip_taper` / `tip_r` | 1.5 / 0.4 | Tilt-in ramp and printable rounded claw tip |
| `arm_gusset_r` / `arm_edge_r` | 5.0 / 0.8 | Bridge reinforcement and leading-edge round |
| side chamfer | 0.4 | Two-step edge treatment for entry and elephant-foot relief |

The default lower pressure face is at `X=-2.0`, `Y=-16..-21`. Its top ramp is 1.2 mm. The bottom ramp adapts to `body_back_y`: 1.1 mm on `hook-classic` to retain 0.2 mm before the J arc, and the full 1.2 mm on `hook-wide25`. Passing `wall_contact=false` to `rail_accessory()` removes that face and both ramps while preserving the 0.8 mm baseline back contour, claw, slot, bridge, and top cap. Use this only when the named design deliberately transfers its complete load through the rail and records the lost wall stabilization.

Do not assume one wall plane from the old 0.8 mm contour. The upper cap remains 0.8 mm behind `X=0`; the localized lower pressure face reaches 2.0 mm.

## Build An Accessory

1. For a custom non-J body, include the mount library with `include <../../lib/rail-mount.scad>`.
2. For a J hook, include `include <../../lib/j-hook.scad>` instead. It loads the fixed rail interface and defines `j_hook_body()` without adding top-level geometry.
3. Call `j_hook_body(drop, r_out, r_in, lift, sweep, front_extra, tip_round)`. The nominal span is `2*r_out`.
4. Keep `tip_round=true`, especially for CF/GF materials.
5. Use `front_extra` when reach grows. The 25 mm hook uses `front_extra=1.4`, producing a 4.4 mm shank rather than scaling the classic hook blindly.
6. Extrude with `rail_accessory(body_back_y, body_pts, w=<width>, wall_contact=true)`; the original width is 11.9 mm. Omit the final argument for normal accessories.

For a custom body, continue the outline from `(-pad_back, body_back_y)`, below the localized pressure pad when enabled. Traverse clockwise and finish on the front plane. `rail_accessory()` closes the polygon via `(plate_t, -pad_top_drop)`. With the default contact enabled, leave enough vertical room for its lower ramp; the library assertion reports a body that starts too high. With contact disabled, keep `body_back_y` below the baseline pad at `Y=-8.8`.

For PETG load-bearing bodies, keep sections at least 3 mm thick, keep the room-side bending-tension face smooth, and thicken the shank when reach grows. Treat wall contact as a load path only after the printed part sits firmly against the panel without preventing full rail seating.

Classify every corner from the final union outline before adding a fillet. At an obtuse/re-entrant junction where a diagonal gusset meets a plate or platform underside, construct a tangent concave inner arc between the two boundary lines. Do not round the corner of a standalone gusset polygon with a generic offset and then union it: that produces an outward bulb at the final junction. Keep positive-volume overlap as a separate connection requirement, and inspect the side profile to confirm the arc curves into the joint rather than away from it.

For a root that morphs from a plate into a rod or hook:

- Judge full-width coverage from the final union silhouette, not from a section's nominal maximum diameter. An ellipse reaches its stated width only through its middle and narrows toward its top and bottom; use a D-shaped or otherwise flat-sided root when the plate sides and bottom must remain covered.
- Treat the intended print plane as a hard geometric constraint. Before accepting lateral reinforcement, audit the final mesh bounds along the bed-normal axis; any root extending beyond the mount's `Z=0..w` faces lifts the validated mount and creates support underneath it.
- Prefer one embedded loft or `polyhedron()` with positive-volume overlap over a second hidden core. A separate core can emerge through the final union or create ambiguous intersection artifacts.
- Inspect the F6 final union and the relevant orthographic silhouette. OpenCSG preview overlap can mislead, while a manifold result alone does not prove that the exterior silhouette or print-bed contact is correct.

## Render And Verify

There is no local OpenSCAD CLI. From `~/openscad/work-hook`, use the installed Docker image and mount the renderer explicitly:

```bash
docker run --rm \
  -v "$PWD":/workspace \
  -v /Users/tomcat/work/openab-deploy/docker/openscad/scad-render.sh:/usr/local/bin/scad-render:ro \
  -w /workspace \
  openab-openscad-toolchain-base:openscad-nightly-2026.01.19.2 \
  bash /usr/local/bin/scad-render <input.scad> out <output-stem>
```

Choose the smallest validation set that exercises the changed dependency surface. Inspect `git status --short` before rendering, including untracked files.

- **Documentation, wiki, or raw-source metadata only:** do not render.
- **Path-only move or include rewrite with unchanged geometry:** compile each moved entry point to CSG/AST to verify path resolution, syntax, and assertions; do not regenerate STL or PNG artifacts.
- **One accessory body only (`accessories/<family>/<name>.scad`):** render only that accessory. Do not rerender unrelated accessories or the skill example when the shared library is unchanged.
- **Shared interface or helper change (`lib/rail-mount.scad`, `lib/j-hook.scad`, or either skill library copy):** sync the corresponding production and skill copies, then render every production accessory plus `.agents/skills/wallboard-rail-mount/example-j-hook.scad`.
- **Renderer/toolchain change:** render `hook-classic`, one non-J custom accessory, and the skill example; expand only when the changed path requires it.
- **Mixed or ambiguous change:** start with the directly affected models and expand only when a shared dependency, assertion, warning, or visual defect gives a concrete reason.

For every rendered target:

- Require OpenSCAD to report no errors or warnings.
- Require the mesh check to report `Manifold`, `NoError`, and genus 0.
- Inspect only the views needed to verify the changed geometry; default to iso plus the most informative orthographic view rather than all views. For gussets and fillets, verify both tangency and curvature direction on the final union silhouette.

For a shared-interface regression, additionally:

- Confirm echoes show `plate_t=2.2`, head depth 7.35, cap/base-pad total 3.0, and wall contact 2.0 at `Y=-16..-21`.
- Confirm ordinary accessories still echo the default wall contact, and a deliberate rail-only target echoes `wall contact = off`.
- Confirm the classic lower ramp is 1.1 and the wide-hook lower ramp is 1.2.
- Inspect the representative iso and top PNGs for a continuous pressure pad, a fully formed claw, and no self-intersection.
- Run `cmp -s` for both production/skill pairs: `rail-mount.scad` and `j-hook.scad`.

Keep successful verification output token-efficient: report one concise result line per target and do not copy repeated echo/render logs into chat. Show detailed log excerpts only for failures or unexpected differences.

## Print

- Follow each accessory's print notes. Keep profile-only J hooks side-face-down; centered rods or pegs may require localized support.
- Prefer PETG or ASA for sustained loads; avoid PLA creep.
- Use at least four perimeters or 100% infill for load-bearing tests.
- Print fixed dimensions verbatim on the owner's calibrated printer. Correct machine-specific fit with slicer flow or horizontal expansion, not library geometry.
