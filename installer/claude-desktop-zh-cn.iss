; ============================================================
;  Claude Desktop 中文补丁 - Windows 单文件安装器
;  上游项目: https://github.com/javaht/claude-desktop-zh-cn
;  本文件由 GitHub Actions 在 windows-latest 上编译
; ============================================================

#ifndef AppVersion
  #define AppVersion "0.0.0"
#endif
#ifndef AppVersionNumeric
  #define AppVersionNumeric "0.0.0.0"
#endif
#ifndef BuildSha
  #define BuildSha "local"
#endif

#include "lang.iss"

[Setup]
AppId={{9C6A2E4F-3B7D-4A21-9E5C-6F1D8B0A7C33}
AppName=Claude Desktop 中文补丁
AppVersion={#AppVersion}
AppVerName=Claude Desktop 中文补丁 {#AppVersion} (commit {#BuildSha})
AppPublisher=javaht/claude-desktop-zh-cn
AppPublisherURL=https://github.com/javaht/claude-desktop-zh-cn
AppSupportURL=https://github.com/javaht/claude-desktop-zh-cn/issues
AppUpdatesURL=https://github.com/javaht/claude-desktop-zh-cn
DefaultDirName={autopf}\ClaudeDesktopZhCn
DefaultGroupName=Claude Desktop 中文补丁
DisableProgramGroupPage=yes
OutputDir=..\dist
OutputBaseFilename=ClaudeDesktop-ZhCn-Setup-{#AppVersion}-{#BuildSha}
VersionInfoVersion={#AppVersionNumeric}
VersionInfoTextVersion={#AppVersion}
VersionInfoCompany=javaht/claude-desktop-zh-cn
VersionInfoDescription=Claude Desktop 中文补丁 安装器
VersionInfoProductName=Claude Desktop 中文补丁
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin

#if FileExists("app.ico")
SetupIconFile=app.ico
UninstallDisplayIcon={app}\app.ico
#endif

[Files]
Source: "..\install-windows.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\README.md"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\scripts\*"; DestDir: "{app}\scripts"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\resources\*"; DestDir: "{app}\resources"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "app.ico"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist

[Icons]
#if FileExists("app.ico")
Name: "{group}\运行中文补丁安装向导"; Filename: "{app}\install-windows.bat"; WorkingDir: "{app}"; IconFilename: "{app}\app.ico"
#else
Name: "{group}\运行中文补丁安装向导"; Filename: "{app}\install-windows.bat"; WorkingDir: "{app}"
#endif
Name: "{group}\卸载 Claude Desktop 中文补丁"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\install-windows.bat"; WorkingDir: "{app}"; Description: "立即运行中文补丁安装向导（选择语言与补丁模式）"; Flags: postinstall shellexec waituntilterminated skipifsilent
