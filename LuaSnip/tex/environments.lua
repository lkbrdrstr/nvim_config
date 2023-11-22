local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require "luasnip.extras.fmt".fmt
local fmta = require "luasnip.extras.fmt".fmta
local rep = require "luasnip.extras".rep
local line_begin = require "luasnip.extras.expand_conditions".line_begin

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
    {
      t("\\frac{"),
      i(1),
      t("}{"),
      i(2),
      t("}")
    }
  ),
  s({ trig = "eq*", dscr = "A LaTeX equation* environment" },
    fmt(
      [[
        \begin{equation*}
            <>
        \end{equation*}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) },
      -- This is where I specify that angle brackets are used as node positions
      { delimiters = "<>" }
    )
  ),
  s({ trig = "a*", dscr = "A LaTeX align* environment" },
    fmta(
      [[
        \begin{align*}
            <>
        \end{align*}
      ]],
      { i(1) }
    )
  ),
  s({ trig = "new", snippetType = "autosnippet" },
    fmta( -- fmta automatically uses <> for formatting, fmt uses {}
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    ),
    { condition = line_begin }
  ),
  s({ trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
    fmta(
      [[\href{<>}{<>}]],
      {
        i(1, "url"),
        i(2, "display name"),
      }
    )
  ),
  s({ trig = "([^%a])mm", snippetType = "autosnippet", wordTrig = false, regTrig = true },
    fmta(
      "<>$<>$",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),
  s({ trig = "([^%a])ee", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
      "<>e^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),
  s({ trig = "h1", snippetType = "autosnippet" },
    fmta(
      [[\section*{<>}]],
      { i(1) }
      ),
    { condition = line_begin }
  ),
  s({ trig = "h2", snippetType = "autosnippet" },
    fmta(
      [[\subsection*{<>}]],
      { i(1) }
      ),
    { condition = line_begin }
  ),
  s({ trig = "h3", snippetType = "autosnippet" },
    fmta(
      [[\subsubsection*{<>}]],
      { i(1) }
      ),
    { condition = line_begin }
  )
}
