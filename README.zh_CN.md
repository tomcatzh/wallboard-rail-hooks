# 墙板轨道挂钩

[English](README.md)

这是一个面向友邦挂挂墙平行系列墙板轨道的参数化、可 3D 打印挂钩项目。项目把已经试装过的轨道卡爪接口沉淀为可复用 OpenSCAD 库，并在其上构建可替换的配件主体。

![原始挂钩安装在轨道上](raw/rail/hook-full-view.jpg)

## 当前模型

| 模型 | 文件 | 用途 |
|---|---|---|
| 经典款 | `accessories/hooks/classic.scad` | 基于原始轮廓的 17 mm 跨度 J 勾 |
| 宽 25 款 | `accessories/hooks/wide-25.scad` | 25 mm 跨度 J 勾，长悬出位置采用 4.4 mm 加强杆身 |
| 圆杆 6 款 | `accessories/hooks/round-6.scad` | 25 mm 跨度 J 勾，前端过渡为居中的无螺纹 Ø6 mm 圆杆，并保留球面圆头 |
| 钥匙孔 9 款 | `accessories/pegs/keyhole-9.scad` | 为 9.5/4.0 mm 钥匙孔挂片设计的 8 mm 短蘑菇头，采用 Ø9 头与 Ø3.8 捕获颈 |
| RIBBA 22 款 | `accessories/frames/ribba-22.scad` | 双只使用的 24 mm 宽托架，平直托面精确伸入 22 mm；抬高后的自由端上缘距安装头顶部 12 mm，并由带相切内弧的全宽斜撑加强 |

五款配件都使用 [`lib/rail-mount.scad`](lib/rail-mount.scad)。它包含固定轨道接口、通用挤出模块，以及参数化 J 勾辅助函数。

## 适配范围与当前状态

- 轨道卡爪几何已在作者的友邦挂挂墙平行系列墙板轨道上完成试装。它是特定五金件的配合设计，不应假定能直接适配其他轨道。
- 固定接口采用 2.40 mm 后爪、2.75 mm 槽宽和 7.35 mm 安装头总深；这几个尺寸需要作为一个整体保留。
- v7 在全部正式配件中共享一段高 5 mm、总后伸 2.0 mm 的下方抵墙承压面，用于把一部分悬挂载荷转化为墙板压力。
- 当前模型均已渲染为流形实体。v7 承压面仍需要全宽实物确认完全就位，并进行承载测试后，才能依赖与抵墙接触相关的承载结论。

## 渲染模型

这些 `.scad` 文件可直接由 OpenSCAD 使用。在仓库根目录执行：

```bash
openscad -o hook-classic.stl accessories/hooks/classic.scad
openscad -o hook-wide25.stl accessories/hooks/wide-25.scad
openscad -o hook-round6.stl accessories/hooks/round-6.scad
openscad -o hook-keyhole9.stl accessories/pegs/keyhole-9.scad
openscad -o frame-ribba22.stl accessories/frames/ribba-22.scad
```

项目也保留了用于验证的 Docker 渲染流程。完整命令和网格检查要求见 [项目 Skill](.agents/skills/wallboard-rail-mount/SKILL.md)。

## 打印建议

- 经典款与宽 25 款按模型姿态侧面朝下打印，截面位于 XY 平面；它们无需支撑，主要弯曲应力也留在层平面内。
- 圆杆 6 款保持相同的安装头朝向，但居中的 Ø6 mm 圆杆最低点高出热床 2.95 mm；需要在圆杆和圆头下方使用局部支撑。
- 钥匙孔 9 款同样保持安装头侧面朝下；Ø9 mm 头部最低点高出热床 1.45 mm，需要在蘑菇头下方增加一小块局部支撑。
- RIBBA 22 款侧面朝下打印，无需支撑，使用时应将两只分开放置。全宽斜撑是闭合实体，内部用料由切片器的壁数和填充设置控制。前一个低平台版本已在用户的旧款 RIBBA 18288 上验证配合；当前抬高加强版需要重新试装，且仍无长期承载额定值。
- 长期承载请选择 PETG 或 ASA，PLA 容易蠕变。
- 功能测试建议至少 4 圈壁，或使用 100% 填充。
- 挂重物前先确认卡爪完全坐入轨道。应从轻载静置开始，检查蠕变、层间开裂和墙板压痕。

## 扩展设计

只在有真实模型时创建 `accessories/<family>/`，保持轨道接口固定，并通过 `rail_accessory()` 构建新的配件主体：

```scad
include <../../lib/rail-mount.scad>

body = j_hook_body(drop = 22.3, r_out = 8.5, r_in = 5.5);
rail_accessory(-22.3, body, w = 11.9);
```

自定义主体时，从下方抵墙承压面之后的 `(-pad_back, body_back_y)` 继续绘制 polygon（多边形）。如果主体起点太高、没有为承压面过渡留出空间，库会用 assert（断言）报错。

## 目录结构

```text
accessories/hooks/classic.scad          17 mm 经典 J 勾
accessories/hooks/wide-25.scad          加强版 25 mm J 勾
accessories/hooks/round-6.scad          居中 Ø6 mm 圆杆的 25 mm J 勾
accessories/pegs/keyhole-9.scad         Ø9/Ø3.8 短钥匙孔蘑菇头
accessories/frames/ribba-22.scad        两只配合使用的 22 mm 凹背相框托架
catalog/accessories.toml                机器可读配件清单
lib/rail-mount.scad                     共享、固定的轨道接口
raw/rail/                               轨道与原始挂钩参考资料
raw/accessories/                        配件专属参考资料
wiki/accessories/                       各配件设计记录
wiki/                                   测量、决策与验证历史
.agents/skills/wallboard-rail-mount/    可复用的设计与渲染工作流
```

## 项目文档

[`wiki/`](wiki/index.md) 保存测量、配合决策、强度审查和版本记录，重点包括：

- [模型版本史与 v7 集成](wiki/outputs/hook-scad-v1.md)
- [25 mm 挂钩尺寸说明](wiki/accessories/hook-wide25.md)
- [Ø6 mm 圆杆挂钩原型](wiki/accessories/hook-round6.md)
- [Ø9/Ø3.8 短钥匙孔蘑菇头](wiki/accessories/hook-keyhole9.md)
- [RIBBA 22 凹背相框托架](wiki/accessories/frame-ribba22.md)
- [强度审查与限制](wiki/outputs/hook-strength-review.md)

## 许可

Copyright 2026 Tomcat。项目以 [MIT License](LICENSE) 发布。
