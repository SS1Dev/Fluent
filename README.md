<img src="Assets/logodark.png#gh-dark-mode-only" alt="fluent">
<img src="Assets/logolight.png#gh-light-mode-only" alt="fluent">

## ⚡ Features

- Modern design
- Many customization options
- Almost any UI Element you would ever need 
<br/>

## 🔌 Installation

You can load Fluent through a GitHub Release:

```lua
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
```
<br/>

## 📜 Usage

[Example Script](https://github.com/dawid-scripts/Fluent/blob/master/Example.lua)
<br/>

---

## 🇹🇭 เอกสารภาษาไทย

### 📖 วิธีใช้งาน (How to Use)

#### 1. โหลด Fluent Library

**วิธีที่ 1: โหลดจาก GitHub Release (แนะนำ)**
```lua
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
```

**วิธีที่ 2: ใช้ require ใน Roblox Studio**
```lua
local Fluent = require(game:GetService("ReplicatedStorage"):WaitForChild("Fluent"))
```

#### 2. สร้าง Window

```lua
local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- เปิดใช้ blur background (ต้องใช้ Graphic Quality 8+)
    Theme = "Dark", -- เลือกธีม: Dark, Light, Amethyst, Aqua, Rose, Darker
    MinimizeKey = Enum.KeyCode.LeftControl -- ปุ่มสำหรับย่อหน้าต่าง
})
```

#### 3. สร้าง Tabs

```lua
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "box" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
```

#### 4. เพิ่ม Elements ต่างๆ

**Button:**
```lua
Tabs.Main:AddButton({
    Title = "Button",
    Description = "คำอธิบาย",
    Callback = function()
        print("Button clicked!")
    end
})
```

**Toggle:**
```lua
local Toggle = Tabs.Main:AddToggle("MyToggle", {
    Title = "Toggle",
    Default = false
})

Toggle:OnChanged(function()
    print("Toggle value:", Fluent.Options.MyToggle.Value)
end)
```

**Checkbox:**
```lua
local Checkbox = Tabs.Main:AddCheckbox("MyCheckbox", {
    Title = "Checkbox",
    Description = "คำอธิบาย checkbox",
    Default = false,
    Callback = function(Value)
        print("Checkbox value:", Value)
    end
})

Checkbox:OnChanged(function(Value)
    print("Checkbox changed:", Value)
end)

-- เปลี่ยนค่า
Checkbox:SetValue(true)
```

**Slider:**
```lua
local Slider = Tabs.Main:AddSlider("MySlider", {
    Title = "Slider",
    Description = "คำอธิบาย",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        print("Slider value:", Value)
    end
})
```

**Dropdown:**
```lua
local Dropdown = Tabs.Main:AddDropdown("MyDropdown", {
    Title = "Dropdown",
    Values = {"ตัวเลือก 1", "ตัวเลือก 2", "ตัวเลือก 3"},
    Multi = false, -- true สำหรับเลือกหลายตัว
    Default = 1
})

Dropdown:OnChanged(function(Value)
    print("Selected:", Value)
end)
```

> **💡 หมายเหตุ:** Dropdown มี Search Box อัตโนมัติ เมื่อเปิด dropdown จะมีช่องค้นหาที่ด้านบนสำหรับกรองรายการตามคำค้นหา

**Colorpicker:**
```lua
local Colorpicker = Tabs.Main:AddColorpicker("MyColor", {
    Title = "Colorpicker",
    Default = Color3.fromRGB(96, 205, 255)
})

Colorpicker:OnChanged(function()
    print("Color:", Colorpicker.Value)
end)
```

**Keybind:**
```lua
local Keybind = Tabs.Main:AddKeybind("MyKeybind", {
    Title = "Keybind",
    Mode = "Toggle", -- "Always", "Toggle", "Hold"
    Default = "LeftControl",
    Callback = function(Value)
        print("Keybind state:", Value)
    end
})
```

**Input:**
```lua
local Input = Tabs.Main:AddInput("MyInput", {
    Title = "Input",
    Default = "",
    Placeholder = "พิมพ์ข้อความ...",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        print("Input value:", Value)
    end
})
```

**Paragraph:**
```lua
Tabs.Main:AddParagraph({
    Title = "Paragraph",
    Content = "นี่คือข้อความ\nบรรทัดที่สอง!"
})
```

#### 5. Notification

```lua
Fluent:Notify({
    Title = "Notification",
    Content = "นี่คือการแจ้งเตือน",
    SubContent = "รายละเอียดเพิ่มเติม", -- ไม่บังคับ
    Duration = 5 -- nil = ไม่หายอัตโนมัติ
})
```

#### 6. Dialog

```lua
Window:Dialog({
    Title = "ยืนยัน",
    Content = "คุณต้องการดำเนินการต่อหรือไม่?",
    Buttons = {
        {
            Title = "ยืนยัน",
            Callback = function()
                print("ยืนยันแล้ว")
            end
        },
        {
            Title = "ยกเลิก",
            Callback = function()
                print("ยกเลิกแล้ว")
            end
        }
    }
})
```

#### 7. ตัวอย่างโค้ดเต็ม

ดูตัวอย่างเพิ่มเติมได้ที่:
- [Example.lua](Example.lua) - สำหรับใช้กับ loadstring
- [Example.client.lua](Example.client.lua) - สำหรับใช้กับ require ใน Studio

---

### 🔨 วิธี Build Release เป็น Single File บน GitHub

#### ขั้นตอนการ Build

1. **ติดตั้ง Dependencies:**
   ```bash
   # ติดตั้ง pnpm
   npm install -g pnpm
   
   # ติดตั้ง dependencies
   pnpm install
   
   # ติดตั้ง Aftman tools (Rojo, DarkLua, Lune)
   aftman install
   ```

2. **Build โปรเจค:**
   ```bash
   # Build ด้วย Rojo (สร้าง main.rbxm)
   pnpm run rojo
   
   # Bundle เป็น single file (สร้าง main.lua)
   pnpm run bundle
   ```

   หรือรันทั้งสองคำสั่งพร้อมกัน:
   ```bash
   pnpm run bundle
   ```

3. **ไฟล์ที่ได้:**
   - `dist/main.rbxm` - ไฟล์ Roblox model (สำหรับใช้ใน Studio)
   - `dist/main.lua` - ไฟล์ single file (สำหรับใช้กับ loadstring)

#### สร้าง GitHub Release อัตโนมัติ

โปรเจคนี้มี GitHub Actions workflow ที่จะ build อัตโนมัติเมื่อสร้าง release:

**ขั้นตอนการสร้าง Release:**

1. **เตรียมโค้ดให้พร้อม:**
   ```bash
   # Commit และ push การเปลี่ยนแปลงทั้งหมด
   git add .
   git commit -m "Prepare for release v1.0.0"
   git push
   ```

2. **สร้าง Release บน GitHub:**
   - ไปที่ GitHub repository ของคุณ
   - คลิก **Releases** (ด้านขวาของหน้า repository)
   - คลิก **Create a new release** หรือ **Draft a new release**

3. **ตั้งค่า Release:**
   - **Choose a tag:** ใส่ tag ใหม่ เช่น `v1.0.0` (หรือเลือก tag ที่มีอยู่แล้ว)
     - ถ้าเป็น tag ใหม่: เลือก "Create new tag" และใส่ชื่อ tag
     - ถ้าเป็น tag เก่า: เลือก tag จาก dropdown
   - **Release title:** ใส่ชื่อ release เช่น "Release v1.0.0"
   - **Describe this release:** เขียน release notes (ไม่บังคับ)
   - **Set as a pre-release:** เลือกถ้าต้องการเป็น pre-release
   - **Set as the latest release:** ปล่อยให้เลือกไว้ (สำหรับ release หลัก)

4. **Publish Release:**
   - คลิก **Publish release** (หรือ **Update release** ถ้าแก้ไข release ที่มีอยู่)

5. **ตรวจสอบ Workflow:**
   - ไปที่ **Actions** tab ใน repository
   - ดู workflow run ที่ชื่อ "Release"
   - รอให้ workflow ทำงานเสร็จ (ประมาณ 2-3 นาที)
   - ตรวจสอบว่า workflow ผ่านทุก step:
     - ✅ Build and Compile
     - ✅ Bundle Luau
     - ✅ Verify Build Files
     - ✅ Upload Release Assets

6. **ตรวจสอบ Assets:**
   - กลับไปที่ **Releases** page
   - เปิด release ที่เพิ่งสร้าง
   - ตรวจสอบว่าในส่วน **Assets** มีไฟล์:
     - ✅ `main.lua` - สำหรับใช้กับ loadstring
     - ✅ `main.rbxm` - สำหรับใช้ใน Roblox Studio

**หมายเหตุสำคัญ:**
- ⚠️ **อย่า** อัปโหลดไฟล์ `main.lua` หรือ `main.rbxm` ด้วยตนเอง เพราะ workflow จะสร้างและอัปโหลดให้อัตโนมัติ
- ⚠️ ถ้า workflow ล้มเหลว ให้ตรวจสอบ error ใน **Actions** tab
- ⚠️ ถ้า release ถูกสร้างแล้วแต่ไม่มี assets ให้รอ workflow ให้เสร็จก่อน (อาจใช้เวลาสักครู่)

**วิธีใช้ไฟล์ที่ release แล้ว:**
```lua
-- ใช้ main.lua จาก latest release
local Fluent = loadstring(game:HttpGet("https://github.com/your-username/Fluent/releases/latest/download/main.lua"))()

-- หรือใช้จาก tag เฉพาะ
local Fluent = loadstring(game:HttpGet("https://github.com/your-username/Fluent/releases/download/v1.0.0/main.lua"))()
```

#### Build แบบ Manual

หากต้องการ build แบบ manual:

```bash
# 1. Clone repository
git clone https://github.com/your-username/Fluent.git
cd Fluent

# 2. ติดตั้ง dependencies
pnpm install
aftman install

# 3. Build
pnpm run bundle

# 4. ไฟล์ที่ได้จะอยู่ใน dist/
#    - dist/main.lua (single file สำหรับ loadstring)
#    - dist/main.rbxm (Roblox model สำหรับ Studio)
```

---

### 📦 Require อะไรบ้าง (Dependencies)

#### สำหรับใช้งาน (Runtime)

Fluent ไม่ต้องการ dependencies เพิ่มเติมเมื่อใช้ไฟล์ `main.lua` ที่ build แล้ว เพราะทุกอย่างถูกรวมไว้ในไฟล์เดียวแล้ว

#### สำหรับ Development

หากต้องการพัฒนาหรือ build โปรเจคเอง ต้องติดตั้ง:

1. **Node.js และ pnpm:**
   - Node.js (เวอร์ชัน 16+)
   - pnpm: `npm install -g pnpm`

2. **Aftman Tools** (ระบุใน `aftman.toml`):
   - **Rojo** (v7.3.0) - สำหรับ build Roblox project
   - **DarkLua** (v0.9.0) - สำหรับ minify code
   - **Lune** (v0.7.6) - สำหรับรัน build script

3. **npm Dependencies** (ระบุใน `package.json`):
   - `mkdirp` (^3.0.1) - สำหรับสร้าง directory

#### Roblox Services ที่ใช้

Fluent ใช้ Roblox services ต่อไปนี้ (ไม่ต้อง require เพิ่ม):

- `game:GetService("Lighting")`
- `game:GetService("RunService")`
- `game:GetService("Players")`
- `game:GetService("UserInputService")`
- `game:GetService("TweenService")`
- `game:GetService("Workspace")`
- `game:GetService("CoreGui")` (ถ้าไม่ใช่ Studio)

#### Addons (ไม่บังคับ)

Fluent มี Addons เพิ่มเติมที่สามารถใช้ได้:

1. **SaveManager** - สำหรับบันทึก/โหลด config
   ```lua
   local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
   SaveManager:SetLibrary(Fluent)
   ```

2. **InterfaceManager** - สำหรับจัดการ interface
   ```lua
   local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
   InterfaceManager:SetLibrary(Fluent)
   ```

---

## Credits

- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) - Assets for the UI, some of the code
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) - Code for most of the elements, save manager
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) - Porting richie0866's acrylic module to lua
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) - Bundler