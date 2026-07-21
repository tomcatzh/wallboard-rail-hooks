# Wallboard Rail Hooks

[中文版](README.zh_CN.md)

Parametric, 3D-printable hooks for the Youbang GuaGuaQiang Parallel wallboard rail. The project captures a validated rail-claw interface in a reusable OpenSCAD library, then builds interchangeable accessories on top of it.

![Original hook installed on the rail](raw/rail/hook-full-view.jpg)

## What Is Here

The repository currently includes seven printable accessories:

| Model | File | Purpose |
|---|---|---|
| Classic | `accessories/hooks/classic.scad` | 17 mm-span hook based on the original profile |
| Wide 25 | `accessories/hooks/wide-25.scad` | 25 mm-span hook with a 4.4 mm reinforced shank for the longer reach |
| Round 6 | `accessories/hooks/round-6.scad` | 25 mm-span hook whose front body blends into a centered, unthreaded Ø6 mm round rod with a spherical tip |
| Round 6 Short | `accessories/hooks/round-6-short.scad` | Independent 33.6 mm-tall sibling with an exact 11.9 mm D-shaped root: flat on both print sides, clean above, and bottom-filled into the Ø6 / 25 mm J envelope |
| Round 6 Ultra Short | `accessories/hooks/round-6-ultra-short.scad` | Rail-only 28.6 mm-tall experiment that disables the 5 mm lower wall-contact face and raises the unchanged Ø6 / 25 mm J envelope to a new flat `Y=-17.4` bottom |
| Keyhole 9 | `accessories/pegs/keyhole-9.scad` | Short 8 mm mushroom peg for a 9.5/4.0 mm keyhole plate, using a Ø9 head and Ø3.8 capture neck |
| RIBBA 22 | `accessories/frames/ribba-22.scad` | Pair-use 24 mm saddle with an exact 22 mm flat reach; its raised free bearing edge sits 12 mm below the mount top, reinforced by a full-width diagonal gusset with tangent concave inner fillets |

All models use the fixed rail interface in [`lib/rail-mount.scad`](lib/rail-mount.scad), either directly or through the parametric J-hook helper in [`lib/j-hook.scad`](lib/j-hook.scad).

## Compatibility And Status

- The rail-claw geometry was test-fit on the author's Youbang GuaGuaQiang Parallel wallboard rail. It is intentionally hardware-specific; do not assume it fits another rail profile.
- The fixed interface uses a 2.40 mm rear finger, 2.75 mm slot gap, and 7.35 mm total head depth. Treat these as a matched set.
- Version 7 adds a default 5 mm-tall lower wall-contact face with a 2.0 mm reach, intended to transfer part of the hanging load into the wall panel. Round 6 Ultra Short is the sole deliberate exception: it disables that face and routes its complete load through the rail.
- The current models render as manifold solids. Full-width physical seating and load testing of the version 7 wall-contact update are still required before relying on contact-dependent load ratings.

## Render A Model

The `.scad` files work with OpenSCAD. From the repository root:

```bash
openscad -o hook-classic.stl accessories/hooks/classic.scad
openscad -o hook-wide25.stl accessories/hooks/wide-25.scad
openscad -o hook-round6.stl accessories/hooks/round-6.scad
openscad -o hook-round6-short.stl accessories/hooks/round-6-short.scad
openscad -o hook-round6-ultra-short.stl accessories/hooks/round-6-ultra-short.scad
openscad -o hook-keyhole9.stl accessories/pegs/keyhole-9.scad
openscad -o frame-ribba22.stl accessories/frames/ribba-22.scad
```

The project also has a Docker-based render workflow used for verification. See [the project skill](.agents/skills/wallboard-rail-mount/SKILL.md) for the exact command and mesh checks.

## Print Notes

- Print the Classic and Wide 25 side-face-down as modeled, with the profile in the XY plane. They need no supports and keep the principal bending stresses within the layer plane.
- Round 6, Short, and Ultra Short keep the mount side-face-down on the bed, while their centered Ø6 mm rods start 2.95 mm above it; use localized support under the round body and tip. Both compact variants keep their 11.9 mm D roots coplanar with the mount sides. The original is 47.7 mm tall, Short is the physically printed 33.6 mm wall-contact version, and Ultra Short is the successfully printed, excellent-seating 28.6 mm rail-only version.
- Keyhole 9 also keeps the mount side-face-down; its Ø9 mm head starts 1.45 mm above the bed, so add a small localized support beneath the mushroom peg.
- RIBBA 22 prints side-face-down without support and is used as a spaced pair. Its full-width gusset is a closed solid, so the slicer controls internal material through perimeter and infill settings. The current raised reinforced revision has been printed and installed on the user's old RIBBA 18288 frame; it fits and is concealed by the frame at the selected 12 mm datum, but still has no long-term load rating.
- Use PETG or ASA for sustained loads. PLA is prone to creep.
- Use at least four perimeters or 100% infill for functional tests.
- Verify that the hook fully seats on the rail before hanging anything meaningful. Start with a light static test and inspect for creep, layer separation, or panel damage.

## Extend The Design

Create each real family under `accessories/<family>/`, keep the rail interface fixed, and make new accessories through `rail_accessory()`:

```scad
include <../../lib/j-hook.scad>

body = j_hook_body(drop = 22.3, r_out = 8.5, r_in = 5.5);
rail_accessory(-22.3, body, w = 11.9);
```

For a new custom body, continue the polygon from `(-pad_back, body_back_y)`, below the lower wall-contact face. The library asserts when a body begins too high for the pressure-pad transition. `rail_accessory()` defaults to `wall_contact=true`; use `false` only for a dedicated rail-only design that explicitly accepts the loss of wall stabilization.

## Repository Layout

```text
accessories/hooks/classic.scad          17 mm classic J hook
accessories/hooks/wide-25.scad          Reinforced 25 mm J hook
accessories/hooks/round-6.scad          25 mm J hook with centered Ø6 mm round rod
accessories/hooks/round-6-short.scad    Minimum-height Ø6 J with a bottom-fused eccentric root
accessories/hooks/round-6-ultra-short.scad  Rail-only 28.6 mm-tall Ø6 J hook
accessories/pegs/keyhole-9.scad         Short Ø9/Ø3.8 keyhole mushroom peg
accessories/frames/ribba-22.scad        Pair-use saddle for a 22 mm recessed frame back
catalog/accessories.toml                Machine-readable accessory registry
lib/rail-mount.scad                     Shared, fixed rail interface
lib/j-hook.scad                         Reusable parametric J-hook body helper
raw/rail/                               Rail and original-hook references
raw/accessories/                        Accessory-specific references
wiki/accessories/                       Per-accessory design records
wiki/                                   Measurements, decisions, and validation history
.agents/skills/wallboard-rail-mount/    Reusable design and render workflow
```

## Documentation

The [`wiki/`](wiki/index.md) records the measurements, fit decisions, stress review, and version history. In particular:

- [Model history and v8 library split](wiki/outputs/hook-scad-v1.md)
- [Library boundaries and dependency direction](wiki/topics/library-architecture.md)
- [25 mm hook sizing notes](wiki/accessories/hook-wide25.md)
- [Ø6 mm round-rod hook prototype](wiki/accessories/hook-round6.md)
- [Minimum-height Ø6 mm round-rod sibling](wiki/accessories/hook-round6-short.md)
- [Rail-only 28.6 mm Round 6 Ultra Short](wiki/accessories/hook-round6-ultra-short.md)
- [Ø9/Ø3.8 short keyhole mushroom peg](wiki/accessories/hook-keyhole9.md)
- [RIBBA 22 recessed-back frame saddle](wiki/accessories/frame-ribba22.md)
- [Strength review and limitations](wiki/outputs/hook-strength-review.md)

## License

Copyright 2026 Tomcat. Distributed under the [MIT License](LICENSE).
