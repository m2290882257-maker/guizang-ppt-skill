# 锡有范 PPT 预览与截图

## 1) 在 Microsoft Edge 打开

Windows (PowerShell):

```powershell
Start-Process msedge "file:///workspace/guizang-ppt-skill/deliverables/xiyoufan-ppt/index.html"
```

macOS/Linux (若已安装 Edge):

```bash
microsoft-edge "file:///workspace/guizang-ppt-skill/deliverables/xiyoufan-ppt/index.html"
```

## 2) 生成预览图（优先 Edge，兼容 Chrome/Chromium）

```bash
bash deliverables/xiyoufan-ppt/take-screenshot.sh
```

也可以指定输入和输出：

```bash
bash deliverables/xiyoufan-ppt/take-screenshot.sh \
  /workspace/guizang-ppt-skill/deliverables/xiyoufan-ppt/index.html \
  /workspace/guizang-ppt-skill/deliverables/xiyoufan-ppt/preview.png \
  1600,900
```

> 若提示找不到 `google-chrome`，脚本会自动尝试 `microsoft-edge` / `msedge` / `chromium`，避免单一依赖导致失败。
