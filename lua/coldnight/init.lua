local colors = require('coldnight.colors')
local config = require('coldnight.config')
local coldnight = {}

--- Apply terminal highlighting.
local function set_terminal_colors()
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.rose
  vim.g.terminal_color_2 = colors.leaf
  vim.g.terminal_color_3 = colors.water
  vim.g.terminal_color_4 = colors.water
  vim.g.terminal_color_5 = colors.blossom
  vim.g.terminal_color_6 = colors.sky
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.bglight
  vim.g.terminal_color_9 = colors.rose1
  vim.g.terminal_color_10 = colors.leaf1
  vim.g.terminal_color_11 = colors.wood1
  vim.g.terminal_color_12 = colors.water1
  vim.g.terminal_color_13 = colors.blossom1
  vim.g.terminal_color_14 = colors.sky1
  vim.g.terminal_color_15 = colors.fg1
  vim.g.terminal_color_background = colors.bg
  vim.g.terminal_color_foreground = colors.fg
end

--- Apply groups highlighting.
local function set_groups()
  local groups = {
    -- Base.
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { bg = colors.bgmid },
    FloatBorder = { fg = colors.fg1 },
    FloatTitle = { fg = colors.fg },
    ColorColumn = { bg = colors.bgmid },
    Cursor = { fg = colors.rose, bg = colors.water },
    iCursor = { fg = colors.bg, bg = colors.water },
    nCursor = { fg = colors.bg, bg = colors.water },
    CursorColumn = { bg = colors.bgmid },
    CursorLine = { bg = colors.bgmidlight },
    CursorLineNr = { fg = colors.fg, bold = true },
    TermCursor = { bg = colors.water },
    LineNr = { fg = colors.bglight },

    Directory = { fg = colors.water },
    ErrorMsg = { fg = colors.rose },
    VertSplit = { fg = colors.water, bg = colors.bg },
    Folded = { fg = colors.water, bg = colors.brightsky },
    FoldColumn = { bg = colors.bg },
    SignColumn = { bg = colors.bg },

    MatchParen = { bg = colors.bgmidlight },
    ModeMsg = { fg = colors.leaf },
    MoreMsg = { fg = colors.leaf },
    NonText = { fg = colors.bglight },
    Pmenu = { fg = colors.fg, bg = colors.bgmidlight },
    PmenuSel = { fg = colors.bg, bg = colors.brightsky, reverse = false, bold = true },
    Question = { fg = colors.leaf },
    Search = { fg = colors.black, bg = colors.brightsky },
    CurSearch = { fg = colors.water, bg = colors.bgmid },
    IncSearch = { fg = colors.black, bg = colors.brightsky },
    SpecialKey = { fg = colors.bgmid },
    SpellCap = { sp = colors.water, undercurl = true },
    SpellLocal = { sp = colors.water, undercurl = true },
    SpellBad = { sp = colors.rose, undercurl = true },
    SpellRare = { sp = colors.leaf, undercurl = true },
    StatusLine = { fg = colors.bgmid, bg = colors.brightsky, bold = true },
    StatusLineAccent = { fg = colors.bgmid, bg = colors.brightsky, bold = true },
    StatusLineNC = { fg = colors.bg, bg = colors.skylighter, bold = true },
    WildMenu = { fg = colors.fg, bg = colors.rose },
    TabLine = { fg = colors.bgmid, bg = colors.water, bold = true },
    TabLineFill = { fg = colors.fg, bg = colors.water },
    TabLineSel = { fg = colors.fg, bg = colors.bg },
    Title = { fg = colors.fg, bold = true },
    Visual = { bg = colors.bgmidlight },
    WarningMsg = { fg = colors.wood },

    Comment = { fg = colors.bglight, italic = true },
    Constant = { fg = colors.white },
    Number = { fg = colors.blossom },
    String = { fg = colors.sky },
    Identifier = { fg = colors.fg },
    Function = { fg = colors.fg, bold = true },
    Keyword = { fg = colors.water, bold = true  },
    Statement = { fg = colors.water },
    Operator = { fg = colors.fg },
    Exception = { fg = colors.rose },
    PreProc = { fg = colors.fg },
    Type = { fg = colors.water },
    Typedef = { fg = colors.water },
    Structure = { fg = colors.water },
    Special = { fg = colors.fg },
    Delimiter = { fg = colors.fg },
    Underlined = { sp = colors.water, underline = true },
    Ignore = { fg = colors.fg },
    Error = { fg = colors.rose },
    Todo = { fg = colors.rose },
    qfLineNr = { fg = colors.water },
    qfError = { fg = colors.rose },
    Conceal = { fg = colors.bglight },
    CursorLineConceal = { fg = colors.bglight, bg = colors.bgmid },

    DiffAdd = { bg = colors.sky1 },
    DiffAdded = { fg = colors.sky },
    DiffDelete = { bg = colors.rose1 },
    DiffRemoved = { fg = colors.rose },
    DiffText = { bg = colors.bg },
    DiffChange = { bg = colors.water },

    -- LSP.
    DiagnosticError = { fg = colors.rose },
    DiagnosticWarn = { fg = colors.wood },
    DiagnosticInfo = { fg = colors.water },
    DiagnosticHint = { fg = colors.sky },

    DiagnosticUnderlineError = { sp = colors.rose, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.wood, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.water, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.sky, undercurl = true },

    -- Markdown.
    markdownCode = { fg = colors.sky },

    -- TreeSitter.
    ['@property'] = { fg = colors.fg },
    ['@function.builtin'] = {fg = colors.fg },
    ['@tag'] = { fg = colors.sky },
    ['@tag.attribute'] = { fg = colors.fg },
    ['@tag.delimiter'] = { link = 'Delimiter' },
    ['@type.qualifier'] = { fg = colors.sky },
    ['@variable'] = { fg = colors.fg },
    ['@variable.builtin'] = { fg = colors.fg },
    ['@variable.member'] = { fg = colors.fg },
    ['@variable.parameter'] = { fg = colors.fg },
    ['@module'] = { fg = colors.water },
    ['@markup.heading'] = { fg = colors.sky },
    ['@keyword.storage'] = { fg = colors.sky },

    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.type'] = { link = '@type' },
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.struct'] = { link = '@variable.member' },
    ['@lsp.type.parameter'] = { fg = colors.fg },
    ['@lsp.type.field'] = { link = '@variable.member' },
    ['@lsp.type.variable'] = { link = '@variable' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.method'] = { link = '@function.method' },
    ['@lsp.type.macro'] = { link = '@function.macro' },
    ['@lsp.type.decorator'] = { link = '@function' },
    ['@lsp.mod.constant'] = { link = '@constant' },

    -- TreesitterContext.
    TreesitterContext = { bg = colors.water },

    -- Gitsigns.
    GitSignsAddLn = { fg = colors.sky },
    GitSignsDeleteLn = { fg = colors.rose },
    GitSignsChange = { fg = colors.water },

    -- Telescope.
    TelescopePromptBorder = { fg = colors.wood },

    -- Cmp.
    CmpItemAbbrMatch = { fg = colors.water },
    CmpItemAbbrMatchFuzzy = { fg = colors.water },
    CmpItemKindText = { fg = colors.leaf },
    CmpItemKindMethod = { fg = colors.water },
    CmpItemKindFunction = { fg = colors.water },
    CmpItemKindConstructor = { fg = colors.water },
    CmpItemKindField = { fg = colors.fg },
    CmpItemKindVariable = { fg = colors.water },
    CmpItemKindClass = { fg = colors.fg },
    CmpItemKindInterface = { fg = colors.fg },
    CmpItemKindModule = { fg = colors.water },
    CmpItemKindProperty = { fg = colors.water },
    CmpItemKindUnit = { fg = colors.blossom },
    CmpItemKindValue = { fg = colors.blossom },
    CmpItemKindEnum = { fg = colors.fg },
    CmpItemKindKeyword = { fg = colors.water },
    CmpItemKindSnippet = { fg = colors.leaf },
    CmpItemKindColor = { fg = colors.rose1 },
    CmpItemKindFile = { fg = colors.rose1 },
    CmpItemKindReference = { fg = colors.rose1 },
    CmpItemKindFolder = { fg = colors.rose1 },
    CmpItemKindEnumMember = { fg = colors.blossom },
    CmpItemKindConstant = { fg = colors.blossom },
    CmpItemKindStruct = { fg = colors.fg },
    CmpItemKindEvent = { fg = colors.water },
    CmpItemKindOperator = { fg = colors.fg },
    CmpItemKindTypeParameter = { fg = colors.water },
    CmpItemMenu = { fg = colors.bglight },

    -- Word under cursor.
    CursorWord = { bg = colors.water },
    CursorWord0 = { bg = colors.water },
    CursorWord1 = { bg = colors.water },

    -- NvimTree.
    NvimTreeGitDirty = { fg = colors.wood },
    NvimTreeGitStaged = { fg = colors.water },
    NvimTreeGitMerge = { fg = colors.rose },
    NvimTreeGitNew = { fg = colors.sky },
    NvimTreeGitDeleted = { fg = colors.rose },

    NvimTreeFolderName = { fg = colors.water },
    NvimTreeFolderIcon = { fg = colors.water },
    NvimTreeOpenedFolderName = { fg = colors.water },
    NvimTreeRootFolder = { fg = colors.water },
    NvimTreeSpecialFile = { fg = colors.fg },
    NvimTreeExecFile = { fg = colors.fg },
    NvimTreeIndentMarker = { fg = colors.bglight },

    NvimTreeWindowPicker = { fg = colors.bgmid, bg = colors.water, bold = true },

    -- WhichKey.
    WhichKeyFloat = { bg = colors.bg },

    -- Indent blankline.
    IndentBlanklineContextChar = { fg = colors.bglight },

    -- Neogit.
    NeogitDiffContextHighlight = { bg = colors.bg },
    NeogitHunkHeader = { fg = colors.water },
    NeogitHunkHeaderHighlight = { fg = colors.water, bg = colors.bg },
    NeogitDiffAddHighlight = { bg = colors.sky },
    NeogitDiffDeleteHighlight = { bg = colors.rose },
}

  groups = vim.tbl_extend('force', groups, type(config.overrides) == 'function' and config.overrides() or config.overrides)

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

--- Apply user settings.
---@param values table
function coldnight.setup(values) setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values) }) end

--- Set the colorscheme.
function coldnight.colorscheme()
  if vim.version().minor < 8 then
    vim.notify('Neovim 0.8+ is required for coldnight colorscheme', vim.log.levels.ERROR, { title = 'coldnight colorscheme' })
    return
  end

  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'coldnight'

  colors.generate()
  set_terminal_colors()
  set_groups()
end

return coldnight
