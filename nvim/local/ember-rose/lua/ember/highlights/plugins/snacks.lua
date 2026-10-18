local M = {}

M.get = function(theme)
  return {
    -- ── Windows — three-level hierarchy ──
    -- preview: base0 (darkest)  →  list: base1/bg (mid)  →  input: base2 (lightest)
    SnacksPicker = { fg = theme.ui.fg, bg = theme.ui.bg },
    SnacksPickerBorder = { fg = theme.ui.float_border, bg = theme.ui.bg },
    SnacksPickerInput = { fg = theme.ui.fg, bg = theme.ui.bg },
    SnacksPickerInputBorder = { fg = theme.ui.float_border, bg = theme.ui.bg },
    SnacksPickerInputSearch = { fg = theme.syn.coral, bold = true },
    SnacksPickerList = { fg = theme.ui.fg, bg = theme.ui.bg },
    SnacksPickerListBorder = { fg = theme.ui.float_border, bg = theme.ui.bg },
    SnacksPickerListCursorLine = { bg = theme.ui.base3 },
    SnacksPickerPreview = { fg = theme.ui.fg, bg = theme.ui.base0 },
    SnacksPickerPreviewBorder = { fg = theme.ui.float_border, bg = theme.ui.base0 },
    SnacksPickerPreviewCursorLine = { bg = theme.ui.base2 },
    SnacksPickerBox = { bg = theme.ui.bg },
    SnacksPickerPickWin = { fg = theme.syn.coral, bold = true },

    -- ── Titles and prompt ──
    SnacksPickerTitle = { fg = theme.ui.bg, bg = theme.syn.coral, bold = true },
    SnacksPickerPreviewTitle = { fg = theme.ui.bg, bg = theme.syn.coral, bold = true },
    SnacksPickerPrompt = { fg = theme.syn.coral },
    SnacksPickerTotals = { fg = theme.ui.base6 },

    -- ── Selection and matching ──
    SnacksPickerMatch = { fg = theme.syn.coral, bold = true },
    SnacksPickerSearch = { fg = theme.syn.coral, bold = true },
    SnacksPickerSelected = { fg = theme.syn.orange, bold = true },
    SnacksPickerUnselected = { fg = theme.ui.base5 },

    -- ── Files and paths ──
    SnacksPickerFile = { fg = theme.ui.fg },
    SnacksPickerDir = { fg = theme.ui.fg_alt },
    SnacksPickerDirectory = { fg = theme.syn.coral, bold = true },
    SnacksPickerPathIgnored = { fg = theme.ui.base5 },
    SnacksPickerPathHidden = { fg = theme.ui.base5 },
    SnacksPickerIcon = { fg = theme.ui.fg_alt },

    -- ── Text styling ──
    SnacksPickerBold = { bold = true },
    SnacksPickerCode = { fg = theme.syn.orange, bg = theme.ui.base2 },
    SnacksPickerItalic = { italic = true },
    SnacksPickerDelim = { fg = theme.ui.fg_alt },
    SnacksPickerComment = { fg = theme.ui.base6, italic = true },
    SnacksPickerDesc = { fg = theme.ui.fg_alt },
    SnacksPickerLabel = { fg = theme.syn.coral },
    SnacksPickerLink = { fg = theme.syn.coral, underline = true },
    SnacksPickerLinkBroken = { fg = theme.syn.rose, strikethrough = true },
    SnacksPickerRule = { fg = theme.ui.base4 },
    SnacksPickerDimmed = { fg = theme.ui.base5 },
    SnacksPickerSpecial = { fg = theme.syn.coral },
    SnacksPickerSpinner = { fg = theme.syn.coral },

    -- ── Positional ──
    SnacksPickerRow = { fg = theme.ui.base6 },
    SnacksPickerCol = { fg = theme.ui.base6 },
    SnacksPickerIdx = { fg = theme.ui.base6 },
    SnacksPickerTree = { fg = theme.ui.base4 },
    SnacksPickerTime = { fg = theme.syn.steel },

    -- ── Git ──
    SnacksPickerGit = { fg = theme.ui.fg_alt },
    SnacksPickerGitStatus = { fg = theme.ui.fg_alt },
    SnacksPickerGitStatusAdded = { fg = theme.diff.add },
    SnacksPickerGitStatusModified = { fg = theme.diff.change },
    SnacksPickerGitStatusDeleted = { fg = theme.diff.delete },
    SnacksPickerGitStatusRenamed = { fg = theme.syn.steel },
    SnacksPickerGitStatusCopied = { fg = theme.syn.steel },
    SnacksPickerGitStatusUntracked = { fg = theme.ui.base6 },
    SnacksPickerGitStatusIgnored = { fg = theme.ui.base5 },
    SnacksPickerGitStatusUnmerged = { fg = theme.syn.rose, bold = true },
    SnacksPickerGitStatusStaged = { fg = theme.syn.olive, bold = true },
    SnacksPickerGitCommit = { fg = theme.syn.gold },
    SnacksPickerGitMsg = { fg = theme.ui.fg },
    SnacksPickerGitType = { fg = theme.syn.coral, bold = true },
    SnacksPickerGitScope = { fg = theme.syn.orange },
    SnacksPickerGitBreaking = { fg = theme.syn.rose, bold = true },
    SnacksPickerGitBranch = { fg = theme.syn.coral, bold = true },
    SnacksPickerGitBranchCurrent = { fg = theme.syn.coral, bold = true },
    SnacksPickerGitDate = { fg = theme.syn.steel },
    SnacksPickerGitAuthor = { fg = theme.syn.orange },
    SnacksPickerGitIssue = { fg = theme.syn.gold },

    -- ── Buffers and diagnostics ──
    SnacksPickerBufNr = { fg = theme.ui.base6 },
    SnacksPickerBufFlags = { fg = theme.syn.coral },
    SnacksPickerBufType = { fg = theme.ui.base6 },
    SnacksPickerFileType = { fg = theme.ui.base6 },
    SnacksPickerDiagnosticSource = { fg = theme.ui.base6 },
    SnacksPickerDiagnosticCode = { fg = theme.ui.base6 },

    -- ── Keymaps and commands ──
    SnacksPickerCmd = { fg = theme.syn.coral },
    SnacksPickerCmdBuiltin = { fg = theme.syn.gold },
    SnacksPickerKeymapMode = { fg = theme.syn.steel },
    SnacksPickerKeymapLhs = { fg = theme.syn.coral, bold = true },
    SnacksPickerKeymapRhs = { fg = theme.ui.fg_alt },
    SnacksPickerKeymapNowait = { fg = theme.syn.orange },
    SnacksPickerToggle = { fg = theme.syn.olive },

    -- ── Autocmd and man ──
    SnacksPickerAuEvent = { fg = theme.syn.coral },
    SnacksPickerAuPattern = { fg = theme.syn.gold },
    SnacksPickerAuGroup = { fg = theme.syn.orange },
    SnacksPickerManPage = { fg = theme.syn.coral, bold = true },
    SnacksPickerManSection = { fg = theme.syn.gold },
    SnacksPickerManDesc = { fg = theme.ui.fg_alt },

    -- ── Register and undo ──
    SnacksPickerRegister = { fg = theme.syn.coral },
    SnacksPickerUndoAdded = { fg = theme.diff.add },
    SnacksPickerUndoRemoved = { fg = theme.diff.delete },
    SnacksPickerUndoCurrent = { fg = theme.syn.coral, bold = true },
    SnacksPickerUndoSaved = { fg = theme.syn.olive },

    -- ── LSP ──
    SnacksPickerLspEnabled = { fg = theme.syn.olive },
    SnacksPickerLspDisabled = { fg = theme.ui.base5 },
    SnacksPickerLspAttached = { fg = theme.syn.olive },
    SnacksPickerLspAttachedBuf = { fg = theme.syn.gold },
    SnacksPickerLspUnavailable = { fg = theme.ui.base5 },

    -- ── Icon kinds (LSP symbols) ──
    SnacksPickerIconArray = { fg = theme.syn.orange },
    SnacksPickerIconBoolean = { fg = theme.syn.constant },
    SnacksPickerIconClass = { fg = theme.syn.type },
    SnacksPickerIconConstant = { fg = theme.syn.constant },
    SnacksPickerIconConstructor = { fg = theme.syn.type },
    SnacksPickerIconEnum = { fg = theme.syn.type },
    SnacksPickerIconEnumMember = { fg = theme.syn.constant },
    SnacksPickerIconEvent = { fg = theme.syn.coral },
    SnacksPickerIconField = { fg = theme.syn.property },
    SnacksPickerIconFile = { fg = theme.ui.fg_alt },
    SnacksPickerIconFunction = { fg = theme.syn.func },
    SnacksPickerIconInterface = { fg = theme.syn.type },
    SnacksPickerIconKey = { fg = theme.syn.coral },
    SnacksPickerIconMethod = { fg = theme.syn.method },
    SnacksPickerIconModule = { fg = theme.syn.coral },
    SnacksPickerIconNamespace = { fg = theme.syn.coral },
    SnacksPickerIconNull = { fg = theme.ui.base5 },
    SnacksPickerIconNumber = { fg = theme.syn.number },
    SnacksPickerIconObject = { fg = theme.syn.orange },
    SnacksPickerIconOperator = { fg = theme.syn.operator },
    SnacksPickerIconPackage = { fg = theme.syn.coral },
    SnacksPickerIconProperty = { fg = theme.syn.property },
    SnacksPickerIconString = { fg = theme.syn.string },
    SnacksPickerIconStruct = { fg = theme.syn.type },
    SnacksPickerIconTypeParameter = { fg = theme.syn.type },
    SnacksPickerIconVariable = { fg = theme.syn.variable },

    -- ── Notifications ──
    SnacksPickerNotificationMessage = { fg = theme.ui.fg },

    -- ── Snacks Explorer ──
    SnacksExplorerNormal = { fg = theme.ui.fg, bg = theme.ui.bg_alt },
    SnacksExplorerDir = { fg = theme.ui.fg_alt },
    SnacksExplorerFile = { fg = theme.ui.fg },
    SnacksExplorerTree = { fg = theme.ui.base4 },

    -- ── Snacks Notifier ──
    SnacksNotifierNormal = { fg = theme.ui.fg, bg = theme.ui.base2 },
    SnacksNotifierBorder = { fg = theme.ui.float_border, bg = theme.ui.base2 },

    -- ── Snacks Dashboard ──
    SnacksDashboardHeader = { fg = theme.syn.coral },
    SnacksDashboardKey = { fg = theme.syn.coral, bold = true },
    SnacksDashboardDesc = { fg = theme.ui.base6 },
    SnacksDashboardIcon = { fg = theme.syn.gold },
    SnacksDashboardFooter = { fg = theme.ui.base6, italic = true },

    -- ── Snacks Indent ──
    SnacksIndent = { fg = theme.ui.base3 },
    SnacksIndentScope = { fg = theme.ui.base5 },

    -- ── Snacks Terminal ──
    SnacksTerminalNormal = { bg = theme.ui.base0 },
    SnacksTerminalBorder = { fg = theme.ui.float_border, bg = theme.ui.base0 },
  }
end

return M
