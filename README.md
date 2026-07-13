# Wallboard Rail Hooks

[中文版](README.zh_CN.md)

Parametric, 3D-printable hooks for the Youbang GuaGuaQiang Parallel wallboard rail. The project captures a validated rail-claw interface in a reusable OpenSCAD library, then builds interchangeable accessories on top of it.

![Original hook installed on the rail](raw/assets/hook-full-view.jpg)

## What Is Here

The repository currently includes two printable J hooks:

| Model | File | Purpose |
|---|---|---|
| Classic | `hooks/hook-classic.scad` | 17 mm-span hook based on the original profile |
| Wide 25 | `hooks/hook-wide25.scad` | 25 mm-span hook with a 4.4 mm reinforced shank for the longer reach |

Both models use [`lib/rail-mount.scad`](lib/rail-mount.scad), which contains the fixed rail interface, a common extruder, and a parametric J-hook helper.

## Compatibility And Status

- The rail-claw geometry was test-fit on the author's Youbang GuaGuaQiang Parallel wallboard rail. It is intentionally hardware-specific; do not assume it fits another rail profile.
- The fixed interface uses a 2.40 mm rear finger, 2.75 mm slot gap, and 7.35 mm total head depth. Treat these as a matched set.
- Version 7 adds a 5 mm-tall lower wall-contact face with a 2.0 mm reach. It is shared by both production hooks and intended to transfer part of the hanging load into the wall panel.
- The current models render as manifold solids. Full-width physical seating and load testing of the version 7 wall-contact update are still required before relying on contact-dependent load ratings.

## Render A Model

The `.scad` files work with OpenSCAD. From the repository root:

```bash
openscad -o hook-classic.stl hooks/hook-classic.scad
openscad -o hook-wide25.stl hooks/hook-wide25.scad
```

The project also has a Docker-based render workflow used for verification. See [the project skill](.agents/skills/wallboard-rail-mount/SKILL.md) for the exact command and mesh checks.

## Print Notes

- Print side-face-down as modeled, with the profile in the XY plane. This needs no supports and keeps the principal bending stresses within the layer plane.
- Use PETG or ASA for sustained loads. PLA is prone to creep.
- Use at least four perimeters or 100% infill for functional tests.
- Verify that the hook fully seats on the rail before hanging anything meaningful. Start with a light static test and inspect for creep, layer separation, or panel damage.

## Extend The Design

Keep the rail interface fixed and make new accessories through `rail_accessory()`:

```scad
include <../lib/rail-mount.scad>

body = j_hook_body(drop = 22.3, r_out = 8.5, r_in = 5.5);
rail_accessory(-22.3, body, w = 11.9);
```

For a new custom body, continue the polygon from `(-pad_back, body_back_y)`, below the lower wall-contact face. The library asserts when a body begins too high for the pressure-pad transition.

## Repository Layout

```text
lib/rail-mount.scad                    Shared, fixed rail interface
hooks/hook-classic.scad                17 mm classic J hook
hooks/hook-wide25.scad                 Reinforced 25 mm J hook
raw/assets/                            Reference photographs
wiki/                                  Measurements, decisions, and validation history
.agents/skills/wallboard-rail-mount/   Reusable design and render workflow
```

## Documentation

The [`wiki/`](wiki/index.md) records the measurements, fit decisions, stress review, and version history. In particular:

- [Model history and v7 integration](wiki/outputs/hook-scad-v1.md)
- [25 mm hook sizing notes](wiki/outputs/hook-wide25.md)
- [Strength review and limitations](wiki/outputs/hook-strength-review.md)

## License

Copyright 2026 Tomcat. Distributed under the [MIT License](LICENSE).
