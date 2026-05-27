$ErrorActionPreference = "Stop"

$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$target = Join-Path $projectDir "index.html"
$icon = Join-Path $projectDir "icons\icon-192.png"
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktop "设计英语学习工具.lnk"

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $target
$shortcut.WorkingDirectory = $projectDir
if (Test-Path $icon) {
  $shortcut.IconLocation = $icon
}
$shortcut.Description = "设计学专业英语学习工具"
$shortcut.Save()

Write-Host "已创建桌面快捷方式：$shortcutPath"
