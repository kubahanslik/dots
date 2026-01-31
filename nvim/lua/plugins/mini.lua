return {
    {
        'nvim-mini/mini.comment',
        version = '*',
        config = function()
            require('mini.comment').setup({
                options = {
                    custom_commentstring = nil,
                    ignore_blank_line = false,
                    start_of_line = false,
                    pad_comment_parts = true,
                },
                mappings = {
                    -- Toggle comment (like `gcip` - comment inner paragraph) for both
                    -- Normal and Visual modes
                    comment = 'gc',

                    -- Toggle comment on current line
                    comment_line = 'gcc',

                    -- Toggle comment on visual selection
                    comment_visual = 'gc',

                    -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                    -- Works also in Visual mode if mapping differs from `comment_visual`
                    textobject = 'gc',
                },
                hooks = {
                    -- Before successful commenting. Does nothing by default.
                    pre = function() end,
                    -- After successful commenting. Does nothing by default.
                    post = function() end,
                },
            })
        end,
    },
    {
        'nvim-mini/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup({
                custom_surroundings = nil,
                highlight_duration = 500,

                mappings = {
                    add = 'sa', -- Add surrounding in Normal and Visual modes
                    delete = 'sd', -- Delete surrounding
                    find = 'sf', -- Find surrounding (to the right)
                    find_left = 'sF', -- Find surrounding (to the left)
                    highlight = 'sh', -- Highlight surrounding
                    replace = 'sr', -- Replace surrounding

                    suffix_last = 'l', -- Suffix to search with "prev" method
                    suffix_next = 'n', -- Suffix to search with "next" method
                },

                -- Number of lines within which surrounding is searched
                n_lines = 20,
                respect_selection_type = false,

                -- How to search for surrounding (first inside current line, then inside
                -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
                -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
                -- see `:h MiniSurround.config`.
                search_method = 'cover',

                -- Whether to disable showing non-error feedback
                -- This also affects (purely informational) helper messages shown after
                -- idle time if user input is required.
                silent = false,
            })
        end,
    },
    {
        'nvim-mini/mini.pairs',
        version = '*',
        config = function()
            require('mini.pairs').setup({
                modes = { insert = true, command = false, terminal = false },

               mappings = {
                    ['('] = { action = 'open', pair = '()', neigh_pattern = '^[^\\]' },
                    ['['] = { action = 'open', pair = '[]', neigh_pattern = '^[^\\]' },
                    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '^[^\\]' },

                    [')'] = { action = 'close', pair = '()', neigh_pattern = '^[^\\]' },
                    [']'] = { action = 'close', pair = '[]', neigh_pattern = '^[^\\]' },
                    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '^[^\\]' },

                    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '^[^\\]',   register = { cr = false } },
                    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '^[^%a\\]', register = { cr = false } },
                    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '^[^\\]',   register = { cr = false } },
                },
            })
        end,
    },
}
