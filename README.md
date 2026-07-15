# Wallboard Rail Hooks

[中文版](README.zh_CN.md)

Parametric, 3D-printable hooks for the Youbang GuaGuaQiang Parallel wallboard rail. The project captures a validated rail-claw interface in a reusable OpenSCAD library, then builds interchangeable accessories on top of it.

![Original hook installed on the rail](raw/rail/hook-full-view.jpg)

## What Is Here

The repository currently includes five printable accessories:

| Model | File | Purpose |
|---|---|---|
| Classic | `accessories/hooks/classic.scad` | 17 mm-span hook based on the original profile |
| Wide 25 | `accessories/hooks/wide-25.scad` | 25 mm-span hook with a 4.4 mm reinforced shank for the longer reach |
| Round 6 | `accessories/hooks/round-6.scad` | 25 mm-span hook whose front body blends into a centered, unthreaded Ø6 mm round rod with a spherical tip |
| Keyhole 9 | `accessories/pegs/keyhole-9.scad` | Short 8 mm mushroom peg for a 9.5/4.0 mm keyhole plate, using a Ø9 head and Ø3.8 capture neck |
| RIBBA 22 | `accessories/frames/ribba-22.scad` | Pair-use 24 mm saddle with an exact 22 mm flat reach; its raised free bearing edge sits 12 mm below the mount top, reinforced by a full-width diagonal gusset with tangent concave inner fillets |

All models use [`lib/rail-mount.scad`](lib/rail-mount.scad), which contains the fixed rail interface, a common extruder, and a parametric J-hook helper.

## Compatibility And Status

- The rail-claw geometry was test-fit on the author's Youbang GuaGuaQiang Parallel wallboard rail. It is intentionally hardware-specific; do not assume it fits another rail profile.
- The fixed interface uses a 2.40 mm rear finger, 2.75 mm slot gap, and 7.35 mm total head depth. Treat these as a matched set.
- Version 7 adds a 5 mm-tall lower wall-contact face with a 2.0 mm reach. It is shared by all production accessories and intended to transfer part of the hanging load into the wall panel.
- The current models render as manifold solids. Full-width physical seating and load testing of the version 7 wall-contact update are still required before relying on contact-dependent load ratings.

## Render A Model

The `.scad` files work with OpenSCAD. From the repository root:

```bash
openscad -o hook-classic.stl accessories/hooks/classic.scad
openscad -o hook-wide25.stl accessories/hooks/wide-25.scad
openscad -o hook-round6.stl accessories/hooks/round-6.scad
openscad -o hook-keyhole9.stl accessories/pegs/keyhole-9.scad
openscad -o frame-ribba22.stl accessories/frames/ribba-22.scad
```

The project also has a Docker-based render workflow used for verification. See [the project skill](.agents/skills/wallboard-rail-mount/SKILL.md) for the exact command and mesh checks.

## Print Notes

- Print the Classic and Wide 25 side-face-down as modeled, with the profile in the XY plane. They need no supports and keep the principal bending stresses within the layer plane.
- Round 6 keeps the same mount orientation, but its centered Ø6 mm rod starts 2.95 mm above the bed; use localized supports under the round body and tip.
- Keyhole 9 also keeps the mount side-face-down; its Ø9 mm head starts 1.45 mm above the bed, so add a small localized support beneath the mushroom peg.
- RIBBA 22 prints side-face-down without support and is used as a spaced pair. Its full-width gusset is a closed solid, so the slicer controls internal material through perimeter and infill settings. The current raised reinforced revision has been printed and installed on the user's old RIBBA 18288 frame; it fits and is concealed by the frame at the selected 12 mm datum, but still has no long-term load rating.
- Use PETG or ASA for sustained loads. PLA is prone to creep.
- Use at least four perimeters or 100% infill for functional tests.
- Verify that the hook fully seats on the rail before hanging anything meaningful. Start with a light static test and inspect for creep, layer separation, or panel damage.

## Extend The Design

Create each real family under `accessories/<family>/`, keep the rail interface fixed, and make new accessories through `rail_accessory()`:

```scad
include <../../lib/rail-mount.scad>

body = j_hook_body(drop = 22.3, r_out = 8.5, r_in = 5.5);
rail_accessory(-22.3, body, w = 11.9);
```

For a new custom body, continue the polygon from `(-pad_back, body_back_y)`, below the lower wall-contact face. The library asserts when a body begins too high for the pressure-pad transition.

## Repository Layout

```text
accessories/hooks/classic.scad          17 mm classic J hook
accessories/hooks/wide-25.scad          Reinforced 25 mm J hook
accessories/hooks/round-6.scad          25 mm J hook with centered Ø6 mm round rod
accessories/pegs/keyhole-9.scad         Short Ø9/Ø3.8 keyhole mushroom peg
accessories/frames/ribba-22.scad        Pair-use saddle for a 22 mm recessed frame back
catalog/accessories.toml                Machine-readable accessory registry
lib/rail-mount.scad                     Shared, fixed rail interface
raw/rail/                               Rail and original-hook references
raw/accessories/                        Accessory-specific references
wiki/accessories/                       Per-accessory design records
wiki/                                   Measurements, decisions, and validation history
.agents/skills/wallboard-rail-mount/    Reusable design and render workflow
```

## Documentation

The [`wiki/`](wiki/index.md) records the measurements, fit decisions, stress review, and version history. In particular:

- [Model history and v7 integration](wiki/outputs/hook-scad-v1.md)
- [25 mm hook sizing notes](wiki/accessories/hook-wide25.md)
- [Ø6 mm round-rod hook prototype](wiki/accessories/hook-round6.md)
- [Ø9/Ø3.8 short keyhole mushroom peg](wiki/accessories/hook-keyhole9.md)
- [RIBBA 22 recessed-back frame saddle](wiki/accessories/frame-ribba22.md)
- [Strength review and limitations](wiki/outputs/hook-strength-review.md)

## License

Copyright 2026 Tomcat. Distributed under the [MIT License](LICENSE).
