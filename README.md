# CarHMI - 车载中控屏 HMI 原型

基于 **Qt 6.5 + QML + C++** 开发的新能源汽车中控屏人机交互界面原型，分辨率 **1520 × 856**，涵盖主页、空调控制、应用启动器、车辆设置、控制中心五大功能模块。

## 技术栈

| 层级 | 技术 |
|---|---|
| UI 层 | QML (Qt Quick) |
| 业务逻辑层 | C++ (Qt 6.5) |
| 构建系统 | CMake + MinGW 64-bit |
| 设计素材 | Figma → 126 张 PNG 资源 |

## 架构设计

```
┌──────────────────────────────────────────────────────┐
│                    Main.qml (Window)                  │
│  ┌─────────┐ ┌────────────────────────────────────┐  │
│  │Navigation│ │          Loader (页面切换)          │  │
│  │ (左侧栏) │ │  Home │ AC │ App │ Settings │ Ctrl │  │
│  └─────────┘ └────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────┐│
│  │         Conponents/ (17个可复用组件)              ││
│  └──────────────────────────────────────────────────┘│
└──────────────────────────────────────────────────────┘
         ↕ Q_PROPERTY 双向数据绑定
┌──────────────────────────────────────────────────────┐
│             Interface (C++ 单例数据模型)              │
└──────────────────────────────────────────────────────┘
```

- **MVVM 架构**：QML 层负责视图，C++ Interface 单例作为数据模型与控制器，通过 `Q_PROPERTY` + NOTIFY 信号实现双向绑定
- **Loader 懒加载**：5 个页面按需加载，减少启动内存占用
- **组件化设计**：17 个可复用 QML 组件覆盖导航栏、状态栏、控制栏、滑块、滚轮、手势识别、开关按钮等场景

## 功能模块

### 主页 (Home)
- 天气信息展示（城市/天气/温度/空气质量）
- 语音助手提示
- 地图快捷导航（回家/去公司/充电站）
- 音乐播放控制（专辑封面/歌词/上下曲切换）
- 收音机面板
- 车辆状态概览（安全天数/里程/车况）

### 空调控制 (AC)
- 双区独立温控（16-32℃，温度滚轮选择器）
- 10 档风扇调节
- 四模式切换（制冷 / 通风加热 / 滤净 / 空调设置）
- 粒子风效系统（风向随鼠标拖动、颜色随温度渐变）
- 负离子/香薰开关

### 应用启动器 (App)
- 14 个车载应用图标网格布局

### 车辆设置 (Settings)
- 三栏联动架构：5 类模式 × 8 类功能
- 转向助力模式（舒适/运动）、交通环境（城市/越野）
- 大灯高度调节（0-9 档）、制动助力分配（整车/前排/后排）
- 氛围灯开关及动态色彩
- HUD 高度/亮度/旋转调节、舒适停车开关

### 控制中心 (ControCenter)
- 顶部下滑手势呼出，高斯模糊弹出动画
- WLAN / 蓝牙 / GPS / HUD / ESP / 天窗等硬件开关
- 媒体/导航双通道音量调节
- 中控/仪表双区亮度调节，支持自动/手动模式

## 自定义组件

| 组件 | 说明 | 核心技术 |
|---|---|---|
| `QuickTemperatureList` | 温度滚轮选择器 | ListView + highlightRangeMode 吸附 + delegate 动态样式衰减 |
| `ColorSlider` | 渐变滑块 | Slider 透明化 + 外层渐变 Rectangle 覆盖 |
| `QuickWind` | 粒子风效系统 | QtQuick.Particles（Emitter + TargetDirection + Turbulence） |
| `SwipeArea` | 手势识别组件 | MouseArea + 方向锁定 + 阈值防抖 + Timer 双击检测 |
| `QuickSlider` | 垂直滑块（音量/亮度） | Slider 透明化 + 自动/手动模式切换 |
| `IconSwitch` | 图标开关卡片 | MouseArea 驱动状态翻转 |
| `FunctionBar2/3` | 2/3 选项切换栏 | QML State + Transition 滑动高亮块 |
| `SettingsModeBar` | 5 标签垂直选择栏 | 同上，垂直布局版 |
| `ACFan` | 风扇弹出面板 | Popup + Timer 3 秒自动隐藏 + 长按连发 |

## 目录结构

```
BYD/
├── main.cpp                        # 入口：注册 C++ 单例到 QML 上下文
├── Main.qml                        # 主窗口：导航栏 + Loader + 手势交互
├── CMakeLists.txt                  # CMake 构建配置
├── resources.qrc                   # 资源文件索引（126 张图片）
│
├── Interface/                      # C++ 后端层
│   ├── Interface.h                 # 单例类声明
│   └── Interface.cpp               # 业务逻辑实现
│
├── HMI/                            # 页面视图层
│   ├── Home.qml
│   ├── AC.qml
│   ├── App.qml
│   ├── Settings.qml
│   └── ControCenter.qml
│
├── Conponents/                     # 可复用组件层（17 个）
│   ├── Navigation.qml              # 左侧导航栏
│   ├── StatusBar.qml               # 顶部状态栏
│   ├── ACBar.qml                   # 底部空调控制栏
│   ├── ACFan.qml                   # 风扇弹出面板
│   ├── ACFunctionBar.qml           # 空调功能切换栏
│   ├── ColorSlider.qml             # 渐变滑块
│   ├── QuickSlider.qml             # 垂直滑块
│   ├── QuickTemperatureList.qml    # 温度滚轮
│   ├── QuickWind.qml               # 粒子风效
│   ├── SwipeArea.qml               # 手势识别
│   ├── IconButton.qml              # 图标按钮
│   ├── IconSwitch.qml              # 图标开关
│   ├── FunctionBar2.qml            # 双选切换栏
│   ├── FunctionBar3.qml            # 三选切换栏
│   ├── SettingsModeBar.qml         # 设置模式栏
│   ├── SettingsFunctionBar.qml     # 设置功能栏
│   └── SettingsList.qml            # 设置列表
│
└── Images/                         # 设计素材（12 个子目录，126 张 PNG）
```

## 构建运行

### 环境要求

- Qt 6.5+
- CMake ≥ 3.16
- MinGW 64-bit（或 MSVC 2019+）

### 构建

```bash
cmake -B build -G "MinGW Makefiles"
cmake --build build
```

或在 Qt Creator 中直接打开 `CMakeLists.txt`，配置编译套件后构建运行。

### 运行

```bash
./build/appBYD
```

程序以固定 **1520 × 856** 分辨率启动。

## 设计模式

| 模式 | 实现 |
|---|---|
| MVVM | QML (View) ↔ C++ Interface (ViewModel/Model) |
| 单例 | `Q_GLOBAL_STATIC` 确保 Interface 全局唯一 |
| 观察者 | `Q_PROPERTY NOTIFY` 信号驱动 UI 自动刷新 |
| 组件化 | 17 个通用组件，多页面复用 |

## 附注

项目仅用于学习交流
