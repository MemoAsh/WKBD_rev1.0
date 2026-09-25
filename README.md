# WKBD rev2.0

> **WorkBuddy 本地配置工具 · rev2.0** —— 人格注入 / 云记忆注入 / 命令闸门解锁 / 网页过滤解除。
> **Local configuration toolkit for WorkBuddy — rev2.0.** Persona injection, cloud-memory
> injection, command-gate unlock and web-filter removal.

---

## ⚠️ 免责声明 / DISCLAIMER

> **本工具仅用于学习交流、个人研究与技术学习，无任何不良引导。**
> **严禁将本工具用于任何违法、违规、侵权或未获授权的用途。**
>
> 若他人使用本工具从事任何违法、违规或侵权行为，**均属使用者个人行为，与作者无关**：
> 作者不知情、未参与、未获利，**不承担任何直接、间接、连带或替代责任**，
> 亦不承担由此产生的任何数据丢失、账号封禁、法律追责或其他后果。
> **使用本工具的全部风险与后果，由使用者自行承担。**
>
> 请自行确认所在地法律法规及目标软件服务条款的约束。
> **不同意以上任何一条，请立即停止使用并删除本工具及其全部副本。**
> 本工具按"现状"（AS IS）提供，不提供任何明示或默示担保。

**English**

> This tool is provided **for study, exchange and personal research only**, with no
> intent to encourage any wrongdoing. **Any use of this tool for illegal,
> non-compliant, infringing or unauthorized purposes is strictly forbidden.**
>
> If a third party uses this tool to commit any illegal, non-compliant or infringing
> act, that is **the user's own conduct and has nothing to do with the author**: the
> author is unaware of it, took no part in it, gained nothing from it, and **accepts no
> direct, indirect, joint or vicarious liability**, including for any data loss,
> account suspension, legal action or other consequence. **All risk and all
> consequences are borne solely by the user.**
>
> You are responsible for confirming what your local laws and the target software's
> terms of service allow. **If you disagree with any of the above, stop using this tool
> immediately and delete it together with all copies.** The tool is provided "AS IS",
> without warranty of any kind.

---

## 这是什么 / What is this

`Forge` 是针对 **WorkBuddy** 的本地配置工具。它读取你自己写的 `persona.md`，然后改写
WorkBuddy 安装目录里的提示词靶点与运行时配置，让客户端按操作者自定义的人格与作业策略运行。

`Forge` is a local configuration tool for **WorkBuddy**. It reads your own `persona.md`
and rewrites the prompt targets and runtime configuration inside your WorkBuddy
installation so the client runs with the operator's own persona and working policy.

**全部改动只发生在你本机**：不联网、不上传、不带遥测。工具唯一的网络相关代码是"探测是否有
代理可用"，不会发送任何用户数据。

**Everything happens on your machine.** No network calls, no uploads, no telemetry. The
only network-adjacent code is a local proxy probe; no user data is ever sent.

---

## rev2.0 相对 rev1.0 的变化 / What changed in 2.0

| 项 | rev1.0 | rev2.0 |
|---|---|---|
| 交付形态 | 单文件 `.exe` | Python 源码（`forge.py` + `forge.bat`） |
| 工具名 | WKBD rev1.0 | **Forge** rev2.0 |
| 自证口令 | `破甲自检成功` | **`WKBD_rev2.0_ASH注入成功`** |
| 作业规范 | 基础 | 增补**反软性抵抗**六条（见下） |
| 还原 | 基础还原 | 备份基准校验：**绝不把"已注入版"当成你的原始文件**存进备份 |
| 备份 / 还原 | 基础备份还原 | `.forge.bak` + **基准校验**：绝不把"已注入版"当成你的原档 |
| 状态/历史 | — | `状态/` 与 `历史备份/` 两个目录，便于对比与回退 |

**反软性抵抗（2.0 新增）** —— 注入的作业规范里明确点名这一类退化行为并禁止：
答完追加"不过请注意"式对冲、答完再补一条"更稳妥的做法是…"、追问时收紧口径、
用"我先声明限制再执行"拖延。规范文本是正常技术文档语气，不含越狱关键词。

**Anti-hedging rules (new in 2.0)** — the injected working policy now explicitly names and
forbids these failure modes: appending a hedging suffix after answering, tacking on a
"the safer approach would be…" afterword, tightening answers when the user re-asks, and
stalling with "let me first state my limits". The text reads as an ordinary engineering
policy and contains no jailbreak keywords.

---

## 三步破甲 / The three steps

| 步骤 | 说明 |
|---|---|
| 1. 人格注入 | 把 `persona.md` 写进 WorkBuddy 的提示词靶点（模板 / `product.json`） |
| 2. 云记忆注入 | 每轮对话自动带人格提示词（写入本地云记忆缓存 `*_memory.md`） |
| 3. 命令闸门解锁 | 放行被限制的命令与工具调用，并可解除网页内容过滤 |

| Step | What it does |
|---|---|
| 1. Persona injection | Writes `persona.md` into WorkBuddy's prompt targets (templates / `product.json`) |
| 2. Cloud-memory injection | Carries the persona automatically every turn (local cloud-memory cache `*_memory.md`) |
| 3. Command-gate unlock | Allows restricted command/tool calls, and optionally removes the web content filter |

---

## 快速开始 / Quick start

**要求 / Requirements**：Windows + Python 3.8 以上（`python` 在 PATH 里）。
Windows + Python 3.8+ with `python` on your PATH.

```bat
:: 1) 预览要改什么（一个字节都不改）
python forge.py --dry-run

:: 2) 只读检测当前状态
python forge.py --status

:: 3) 执行
python forge.py --apply

:: 4) 完全模式（含闸门 / 网页过滤 / 文件保护中和）
python forge.py --apply --full
```

也可以直接双击 `forge.bat`（等价于 `python forge.py`，不带参数进交互菜单）。

Or just double-click `forge.bat` — it runs `python forge.py` with no arguments and opens
the interactive menu.

> **打完必须完全退出 WorkBuddy（含右下角托盘）再重开**，改动才会加载。
> **Fully quit WorkBuddy (including the tray icon) and relaunch** for changes to take effect.

---

## 命令一览 / CLI reference

| 参数 | 说明 |
|---|---|
| `--status` | 只读：检测所有靶点状态 |
| `--diagnose` | 只读：详细取证 |
| `--check` | 只读体检：磁盘态 / 明文凭证提示 / 自证就绪（不改盘，有问题退出码 1） |
| `--dry-run` | 预演，不改盘 |
| `--apply` | 执行破甲 |
| `--apply --full` | 完全模式：+网页过滤 +Ask模式 +文件保护中和 |
| `--revert` / `--restore` | 从备份还原成官方原版 |
| `--guard install\|remove\|status` | 守护任务管理（定时复查，掉档自动补） |
| `--snapshot` / `--compare` | 生成提示词快照 / 与最新快照对比 |
| `--clean-spill` / `--purge-spill` | 清理过期 / 全部会话快照（不在备份范围内） |
| `--pick wb` / `--clear` | 手动指定安装目录（弹系统窗口）/ 清除手动指定 |
| `--force` | 已破甲也强制重写一遍（统一人格哈希） |
| `--quiet` | 静默（守护任务用） |

---

## 自证 / Self-check

装完之后，在 WorkBuddy 里**开一个新会话**，单独发这四个字：

```
破甲自检
```

应当回复：

```
WKBD_rev2.0_ASH注入成功
```

After installing, open a **new** WorkBuddy conversation and send this single phrase.
It should reply `WKBD_rev2.0_ASH注入成功`.

命令行也能看：

```bat
python forge.py --check
```

---

## 还原 / Revert

```bat
python forge.py --revert
```

从备份原样还原。安全约定（2.0 强化）：

- 首次改动前，原文件会备份成 `<文件名>.forge.bak`（或 `状态/`、`历史备份/` 下的归档）；
- 判断"这份内容是不是本工具写的"用标记清单，**绝不把已经注入过的文件当成你的原始文件备份**——
  这是防止"还原时反而用注入内容覆盖你的真文件"的关键判据；
- 备份不存在的文件**一个字节都不动**，并如实告诉你哪些文件无法还原。

Backups are taken before the first write. The tool refuses to treat an
already-injected file as your pristine original — this is the guard that prevents
`--revert` from overwriting your real files with injected content. Files with no backup
are left untouched and reported honestly.

---

## 目录结构 / Layout

```
forge.py          主程序（纯标准库，无第三方依赖）
forge.bat         双击入口
persona.md        操作者人格（<!-- --> 注释外的内容会被注入）
LICENSE           MIT
状态/             运行时状态 + 提示词快照        [运行时生成]
历史备份/         历史备份归档                    [运行时生成]
forge.log         运行日志                        [运行时生成]
```

`forge.py` uses **standard library only** — no third-party packages, no `pip install`.

---

## 已知限制 / Known limitations

- 只在 Windows 上测试过；路径与进程管理都按 Windows 写的。
- WorkBuddy 版本升级会覆盖靶点文件，掉档后重跑 `--apply` 或装 `--guard install` 自动补。
- 云记忆注入受客户端上限约束：人格文本超过 10000 字会被跳过（控制台会说明）。
- `--purge-spill` 清掉的会话快照不在备份范围内，删掉无法还原。

- Tested on Windows only.
- A WorkBuddy update overwrites the prompt targets; re-run `--apply`, or install the
  guardian task so it self-heals.
- Cloud-memory injection is capped by the client at 10000 characters; longer personas
  are skipped with an explicit message.
- Session snapshots removed by `--purge-spill` are outside the backup scope.

---

## 许可 / License

MIT —— 见 [LICENSE](LICENSE)。 / MIT — see [LICENSE](LICENSE).
