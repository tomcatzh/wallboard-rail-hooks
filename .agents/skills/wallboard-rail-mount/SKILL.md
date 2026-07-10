---
name: wallboard-rail-mount
description: "Design, adapt, render, and verify 3D-printable accessories for the user's Youbang GuaGuaQiang wallboard rail. Use for hooks, holders, hangers, shelves, cable organizers, or any OpenSCAD work in ~/openscad/work-hook. Provides the test-fit mount interface, the selected 2.0 mm lower wall-contact pressure face, a parametric library, strength guidance, and this Mac's Docker render workflow."
---

# Wallboard Rail Mount

Use the validated OpenSCAD interface for the champagne-gold Youbang GuaGuaQiang Parallel rail in the user's wall paneling. The rail clip was print-fit validated on 2026-07-09. A 2.0 mm lower wall-contact reach was selected from the 2.0/2.5 mm fit pair on 2026-07-10.

Read `~/openscad/work-hook/wiki/index.md` first when project history or design rationale matters.

## Canonical Files

- `~/openscad/work-hook/lib/rail-mount.scad` is the production source of truth.
- This skill's `rail-mount.scad` must remain byte-identical to the production library.
- This skill's `example-j-hook.scad` is a runnable 17 mm-span example.
- Production bodies live in `~/openscad/work-hook/hooks/`.

When the interface changes, edit the production library first, sync the skill copy, render both production hooks and the skill example, then update the bilingual wiki.

## Geometry Contract

- **FIXED mount:** preserve the rail interface and lower wall-contact dimensions exactly. Do not tolerance-compensate or override them in body files.
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
| `wall_contact_below_rail` / `wall_contact_h` | 8.0 / 5.0 | Pressure face starts 8 mm below the rail-bottom datum and is 5 mm tall |
| `wall_contact_j_clearance` | 0.2 | Minimum straight clearance before the custom body/J arc |
| `fillet_finger_root` / `fillet_plate_root` | 0.6 / 0.3 | Stress relief while preserving a 1.85 mm flat lip seat |
| `tip_taper` / `tip_r` | 1.5 / 0.4 | Tilt-in ramp and printable rounded claw tip |
| `arm_gusset_r` / `arm_edge_r` | 5.0 / 0.8 | Bridge reinforcement and leading-edge round |
| side chamfer | 0.4 | Two-step edge treatment for entry and elephant-foot relief |

The lower pressure face is at `X=-2.0`, `Y=-16..-21`. Its top ramp is 1.2 mm. The bottom ramp adapts to `body_back_y`: 1.1 mm on `hook-classic` to retain 0.2 mm before the J arc, and the full 1.2 mm on `hook-wide25`.

Do not assume one wall plane from the old 0.8 mm contour. The upper cap remains 0.8 mm behind `X=0`; the localized lower pressure face reaches 2.0 mm.

## Build An Accessory

1. Include the library. In `hooks/*.scad`, use `include <../lib/rail-mount.scad>`.
2. For a J hook, call `j_hook_body(drop, r_out, r_in, lift, sweep, front_extra, tip_round)`. The nominal span is `2*r_out`.
3. Keep `tip_round=true`, especially for CF/GF materials.
4. Use `front_extra` when reach grows. The 25 mm hook uses `front_extra=1.4`, producing a 4.4 mm shank rather than scaling the classic hook blindly.
5. Extrude with `rail_accessory(body_back_y, body_pts, w=<width>)`; the original width is 11.9 mm.

For a custom body, continue the outline from `(-pad_back, body_back_y)`, below the localized pressure pad. Traverse clockwise and finish on the front plane. `rail_accessory()` closes the polygon via `(plate_t, -pad_top_drop)`. Leave enough vertical room for the lower pressure-pad ramp; the library assertion reports a body that starts too high.

For PETG load-bearing bodies, keep sections at least 3 mm thick, keep the room-side bending-tension face smooth, and thicken the shank when reach grows. Treat wall contact as a load path only after the printed part sits firmly against the panel without preventing full rail seating.

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

Render at minimum:

```text
hooks/hook-classic.scad
hooks/hook-wide25.scad
.agents/skills/wallboard-rail-mount/example-j-hook.scad
```

Require all of the following:

- OpenSCAD reports no errors or warnings.
- Mesh checks report `Manifold`, `NoError`, and genus 0.
- Echo shows `plate_t=2.2`, head depth 7.35, cap/base-pad total 3.0, and wall contact 2.0 at `Y=-16..-21`.
- Classic lower ramp is 1.1; wide-hook lower ramp is 1.2.
- Inspect iso and top PNGs for a continuous pressure pad, a fully formed claw, and no self-intersection.
- Run `cmp -s lib/rail-mount.scad .agents/skills/wallboard-rail-mount/rail-mount.scad`.

## Print

- Print side-face-down as modeled, with the XY profile in each layer; no supports.
- Prefer PETG or ASA for sustained loads; avoid PLA creep.
- Use at least four perimeters or 100% infill for load-bearing tests.
- Print fixed dimensions verbatim on the owner's calibrated printer. Correct machine-specific fit with slicer flow or horizontal expansion, not library geometry.
