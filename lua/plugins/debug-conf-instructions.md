# Debug Setup Installation Guide

## Step 1: Clean up the deprecated package

```bash
sudo npm uninstall -g js-debug
```

## Step 2: Replace your debug configuration

- **Remove** `debug-config.lua` (the old one with path issues)
- **Add** `modern-debug.lua` (the new configuration I provided)

## Step 3: Install Python debugging support

```bash
# Install debugpy for Python debugging
pip3 install debugpy
```

## Step 4: Restart Neovim and sync

```vim
:Lazy sync
```

## Step 5: Install Mason packages (Python only now)

```vim
:MasonInstall debugpy
```

## Step 6: Test the setup

### For Python debugging:

1. Open a Python file
2. Set a breakpoint with `<leader>b`
3. Press `<F5>` to start debugging

### For JavaScript/TypeScript debugging:

1. Open a JS/TS file
2. Set a breakpoint with `<leader>b`
3. Press `<F5>` to start debugging
4. The modern setup will automatically handle the JS debug adapter

## Key Features of the New Setup:

### Python Debugging:

- ✅ Uses `nvim-dap-python` for reliable Python debugging
- ✅ Supports pytest debugging
- ✅ Virtual environment detection
- ✅ Debug Python test methods and classes

### JavaScript/TypeScript Debugging:

- ✅ Uses modern `vscode-js-debug` adapter
- ✅ Supports Node.js debugging
- ✅ Browser debugging with Chrome
- ✅ Next.js debugging support
- ✅ React debugging support

### Key Bindings:

- `<F5>` - Start/Continue debugging
- `<F1>` - Step Into
- `<F2>` - Step Over
- `<F3>` - Step Out
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Set conditional breakpoint
- `<leader>du` - Toggle debug UI
- `<leader>dpr` - Debug Python test method
- `<leader>dpc` - Debug Python test class

## Troubleshooting:

### If Python debugging doesn't work:

```bash
# Make sure debugpy is installed
pip3 install debugpy
# Or in your virtual environment
source venv/bin/activate
pip install debugpy
```

### If JS/TS debugging doesn't work:

The setup will automatically download and configure the Microsoft VS Code JS debugger. Just make sure you have Node.js installed:

```bash
node --version
npm --version
```

## What's Different:

1. **No more deprecated js-debug package**
2. **Uses Microsoft's official VS Code JavaScript debugger**
3. **Mason-nvim-dap handles installation reliably**
4. **Better error handling and fallbacks**
5. **Support for modern frameworks (Next.js, React, etc.)**

The new setup is much more reliable and uses maintained, official debugging tools.
