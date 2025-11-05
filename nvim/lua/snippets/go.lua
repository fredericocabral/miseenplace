-- ~/.config/nvim/lua/snippets/go.lua
local ls  = require("luasnip")
local s   = ls.snippet
local i   = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- sanity snippet to prove loading
  s("zzz", fmt([[SNIP OK]], {})),

  -- your tst snippet
  s("tst", fmt([[
    func TestSomething(t *testing.T) {{
        what := 1
        got := 2

        assert.Equal(t, got, what, "Error message")
    }}
  ]], {})),

  s("ttest", fmt([[
    func Test{}(t *testing.T) {{
        tests := []struct {{
            name string
            // add fields here
        }}{{
            {{"case1"}},
            {{"case2"}},
        }}

        for _, tt := range tests {{
            t.Run(tt.name, func(t *testing.T) {{
                // TODO: call function and compare
            }})
        }}
    }}
    ]], { i(1, "FuncName") })),
}

