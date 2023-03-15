local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


-- Gets the code previously selected.
local get_visual = function(args, parent)
	if (#parent.snippet.env.SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
	else  -- If SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end


return {
	s(
		{trig="b", },
		fmta(
			[[
			\begin{<>}
				<>
			\end{<>}
			]],
			{
				i(1),
				i(0), -- i(0) node is always the last node jumped to
				rep(1),  -- this node repeats insert node i(1)
			})),
	-- Wraps the code selected.
	s(
		{trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command."},
		fmta("\\textit{<>}",
		{ d(1, get_visual), })),
	}

