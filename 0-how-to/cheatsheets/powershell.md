# How to Use PowerShell to Build the TAPs-PM File Structure

This guide is for beginners who need to create or maintain the TAPs project folder system on Windows.

---

## Step 1: Open PowerShell in the Right Place
1. Open File Explorer.
2. Navigate to your `taps-proj-mgmt` (or `TAPs-PM`) folder.
3. **Shift + Right Click** in an empty area → choose **Open PowerShell window here**.  
   - Or click into the address bar, type `powershell`, and hit Enter.

You should see a prompt like:
```
PS C:\Users\YourName\...\taps-proj-mgmt>
```

---

## Step 2: Paste the Script
Copy the block of code provided in project docs (e.g., to create READMEs or folders) and paste it into the PowerShell window. Then press Enter.

PowerShell will:
- Create any missing subfolders.
- Write `README.md` files into each folder.
- Print confirmation when done.

---

## Step 3: Verify
Run:
```powershell
Get-ChildItem -Recurse -Directory | Select-Object FullName
```
This lists all folders. You should see:
```
1-inputs\11-knowledge-base
1-inputs\12-analytical-engine
2-processes\21-production-hub
...etc.
```

---

## Notes & Tips
- **Comments** (lines starting with `#`) in scripts are just for humans.
- Blocks starting with `@"` and ending with `"@ | Set-Content ...` create text files.
- If something looks wrong, re-run the block. Existing files will be overwritten.
- No harm done: you’re just writing plain text files.
