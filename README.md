# WKBD rev1.0

> **WorkBuddy 标准破甲工具 · 免费版** — 双击即用，无需安装 Python。
> **Standard "armor-break" toolkit for WorkBuddy — free edition.** Double-click and go, no Python required.

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

> 注：以上声明**同时内置于 `WKBD_rev1.0.exe`**，每次运行都会在控制台打印出来。
> Note: the same notice is **embedded inside `WKBD_rev1.0.exe`** and is printed to the
> console on every run.

---

## 这是什么 / What is this

WKBD rev1.0 是针对 **WorkBuddy** 的本地化配置工具，通过修改本地安装目录下的提示词靶点与运行时配置，让客户端按操作者自定义的人格与策略运行。全部改动**仅发生在你本机**，不涉及任何联网上传。

WKBD rev1.0 is a local configuration tool for **WorkBuddy**. It patches the prompt targets and runtime config files inside your local installation so the client runs with the operator's own persona and policy. Every change happens **entirely on your machine** — nothing is uploaded anywhere.

---

## 标准破甲 = 三步 / Three steps

| 步骤 | 说明 |
|---|---|
| 1. 人格注入 | 把操作者人格写进 WorkBuddy 的系统提示词靶点 |
| 2. 云记忆注入 | 每轮对话自动带人格提示词（写入本地云记忆缓存） |
| 3. 命令闸门解锁 | 放行被限制的命令与工具调用 |

---

## 快速开始 / Quick start

1. 下载 `WKBD_rev1.0.exe`
2. 双击运行 → 进入菜单
3. 按 `1` 一键破甲
4. **完全退出 WorkBuddy**（含右下角托盘）后重新打开，改动才生效

> 破甲前会自动备份，可随时还原成官方原版。

---

## 命令行参数 / CLI

```
WKBD_rev1.0.exe --status         只读检测，不改任何文件
WKBD_rev1.0.exe --dry-run        预演：只显示会改什么，不写盘
WKBD_rev1.0.exe --apply          标准破甲
WKBD_rev1.0.exe --apply --force  强制重写（即使已破甲过）
WKBD_rev1.0.exe --revert         还原成官方原版
WKBD_rev1.0.exe --guard install  安装守护任务（需要管理员权限）
WKBD_rev1.0.exe --persona <文件>  指定自定义人格文件
WKBD_rev1.0.exe --clean-spill    只清理过期的会话快照
WKBD_rev1.0.exe --purge-spill    清理全部会话快照
```

---

## 验证是否生效 / Verify

破甲后重启 WorkBuddy，在**新会话**里单独发送四个字：

```
破甲自检
```

预期只回复一行：

```
WKBD_rev1.0_ASH注入成功
```

---

## 自定义人格 / Custom persona

编辑同目录下的 `persona.md`，把你自己的人格写在文件底部的 HTML 注释块之外。注释块内的内容不会被注入，可以放心写说明。

改完后运行一次 `--apply --force` 让改动真正生效。

> 优先级：命令行 `--persona` 指定的文件 > `persona.md` > 内置默认

---

## 免费版与 Pro 的区别 / Free vs Pro

| 能力 | 免费版 | Pro 版 |
|---|:---:|:---:|
| 人格注入 / 云记忆 / 命令闸门 | ✓ | ✓ |
| 网页内容过滤解除（敏感网页不再拒答） | ✗ | ✓ |
| 个人文件保护中和（删除 / 改名直接执行） | ✗ | ✓ |
| Ask 模式只读解禁 | ✗ | ✓ |

需要完全破甲，请购买 **WKBD rev1.0pro**。

---

## 文件清单 / Files

| 文件 | 说明 |
|---|---|
| `WKBD_rev1.0.exe` | 主程序（单文件，无需运行时；**内置免责声明**） |
| `persona.md` | 共用人格文件，可自由编辑 |
| `免责声明.txt` | 免责声明全文（中文 + English），随包分发 |
| `破甲日志.txt` | 运行日志，记录每次改动了哪些文件 |
| `LICENSE` | MIT 许可证（上游 popopo） |
| `使用说明.md` | 详细中文说明 |

---

## 还原 / Revert

```
WKBD_rev1.0.exe --revert
```

还原会从破甲前自动生成的备份恢复全部被改写的文件，恢复到官方原版状态。

---

## 许可 / License

本项目基于 **popopo**（MIT 许可证）修改，原版权声明见随附 `LICENSE` 文件。

This project is a derivative of **popopo** (MIT License); see the bundled `LICENSE`
file for the original copyright notice.

使用本工具即表示你已阅读并同意上文的免责声明；不再使用时，请连同全部副本一并删除。
