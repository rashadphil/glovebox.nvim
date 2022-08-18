" clear cache so this reloads changes.
" useful for development
" lua package.loaded['glovebox'] = nil
" lua package.loaded['glovebox.theme'] = nil
" lua package.loaded['glovebox.colors'] = nil
" lua package.loaded['glovebox.util'] = nil
lua package.loaded['glovebox.config'] = nil

lua require('glovebox').colorscheme()
