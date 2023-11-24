local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

return {
  s({ trig = ";a", snippetType = "autosnippet" },
    {
      t("\\alpha")
    }
  ),
  s({ trig = ";b", snippetType = "autosnippet" },
    {
      t("\\beta")
    }
  ),
  s({ trig = ";g", snippetType = "autosnippet" },
    {
      t("\\gamma")
    }
  ),
  s({ trig = ";d", snippetType = "autosnippet" },
    {
      t("\\delta")
    }
  ),
  s({ trig = ";e", snippetType = "autosnippet" },
    {
      t("\\varepsilon")
    }
  ),
  s({ trig = ";t", snippetType = "autosnippet" },
    {
      t("\\theta")
    }
  ),
  s({ trig = ";s", snippetType = "autosnippet" },
    {
      t("\\sigma")
    }
  ),
  s({ trig = ";Si", snippetType = "autosnippet" },
    {
      t("\\Sigma")
    }
  ),
  s({ trig = ";p", snippetType = "autosnippet" },
    {
      t("\\pi")
    }
  ),
  s({ trig = ";ph", snippetType = "autosnippet" },
    {
      t("\\varphi")
    }
  ),
}
