local M = {}

M.bottom_outer_thin = "▁"
M.top_outer_thin = "▔"
M.left_outer_thin = "▏"
M.right_outer_thin = "▕"

M.left_outer_thick = "▎"
M.right_outer_thick = "🮇"

M.full_block = "█"

M.top_right_outer_thin = "🭾"
M.top_left_outer_thin = "🭽"
M.bottom_left_outer_thin = "🭼"
M.bottom_right_outer_thin = "🭿"

M.top_left_round = "╭"
M.top_right_round = "╮"
M.bottom_right_round = "╯"
M.bottom_left_round = "╰"

M.top_left_square = "┌"
M.top_right_square = "┐"
M.bottom_right_square = "┘"
M.bottom_left_square = "└"

M.vertical_default = "│"
M.horizontal_default = "─"

M.small_circle = "•"

-- Border chars.
M.border_chars_round = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
M.border_chars_square = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
M.border_chars_none = { "", "", "", "", "", "", "", "" }
M.border_chars_empty = { " ", " ", " ", " ", " ", " ", " ", " " }
M.border_chars_inner_thick = { " ", "▄", " ", "▌", " ", "▀", " ", "▐" }
M.border_chars_outer_thick = { "▛", "▀", "▜", "▐", "▟", "▄", "▙", "▌" }
M.border_chars_cmp_items = { "▛", "▀", "▀", " ", "▄", "▄", "▙", "▌" }
M.border_chars_cmp_doc = { "▀", "▀", "▀", " ", "▄", "▄", "▄", "▏" }
M.border_chars_outer_thin = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
M.border_chars_inner_thin = { " ", "▁", " ", "▏", " ", "▔", " ", "▕" }
M.border_chars_top_only_thin = { " ", M.top_outer_thin, " ", " ", " ", " ", " ", " " }
M.border_chars_top_only_normal = { "", M.horizontal_default, "", "", "", " ", "", "" }

-- Telscope chars.
M.border_helix_telescope = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
M.border_chars_outer_thick_telescope = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙" }
M.border_chars_outer_thin_telescope = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" }
M.border_chars_telescope_default = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
M.border_chars_telescope_prompt_thin = { "▔", "▕", " ", "▏", "🭽", "🭾", "▕", "▏" }
M.border_chars_telescope_vert_preview_thin = { " ", "▕", "▁", "▏", "▏", "▕", "🭿", "🭼" }
M.border_chars_telescope_combine_top = { "─", "│", " ", "│", "╭", "╮", "│", "│" }
M.border_chars_telescope_combine_bottom = { "─", "│", "─", "│", "├", "┤", "╯", "╰" }

return M
