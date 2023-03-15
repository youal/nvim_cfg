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
		{ trig = "m" },
		fmta(
			[[
			int
			main(int argc, char *argv[])
			{
				<>


				return 0;
			}
			]],
			{i(0, "statement;"),}
	)),
	s(
		{ trig = "io" },
		fmt(
			[[
			#include <stdio.h>{}
			]],
			{i(1),}
	)),
	s(
		{ trig = "fc" },
		fmt(
			[[
			#include <fcntl.h>{}
			]],
			{i(1),}
	)),
	s(
		{ trig = "str" },
		fmt(
			[[
			#include <string.h>{}
			]],
			{i(1),}
	)),
	s(
		{ trig = "unx" },
		fmt(
			[[
			#include <unistd.h>
			{}
			]],
			{i(1),}
	)),
	}

