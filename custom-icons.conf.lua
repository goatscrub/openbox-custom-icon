---- You can override default configuration here.

---- Binary used to set icon, default 'xseticon'
---- If seticon_binary is not accessible from environment PATH variable,
---- you can specify here full binary path as follows: seticon_binary='/path/to/binary'
----
---- /!\ xseticon works only with PNG files /!\
---- SVG file can be converted with imagemagick:
---- $ convert -background none -alpha activate input.svg output.png
-- seticon_binary='xseticon'

---- Icon path extension, define into devilspie2 configuration.
---- Default value: 'png'
--icon_extension='png'

---- Icon path prefix, define into devilspie2 configuration.
---- Default: os.getenv('HOME')..'/.config/openbox/custom-icons/'
-- icon_prefix=os.getenv('HOME')..'/.config/openbox/custom-icons/'

-- applications = {
-- {
--     search = { test1[, test2, ...] } -- from utils: same, match, starts_with, ends_with
--     match_if = all, any -- default all
--     icon = filename -- without pathname, without extension
-- }
-- }
-- devilspie2 useful functions,
-- more information into devilspie2 README
--
-- get_window_name()
-- get_application_name()
-- get_window_type()
-- get_window_role()
-- get_window_class()
-- get_class_instance_name()
--
-- devilspie2 functions output examples:
--
-- xterm running devilspie2 in while loop
---- window_name: while :;do devilspie2 -d ; sleep 0.75;done
---- application_name: while :;do devilspie2 -d ; sleep 0.75;done
---- class_instance_name: xterm
---- window_role:
---- window_xid: 58720282
---- window_class: XTerm
---
-- chrome with lua programming tab
---- window_name: Programming in Lua : 22.2 - Chromium
---- application_name: Programming in Lua : 22.2 - Chromium
---- class_instance_name: chromium
---- window_role: browser
---- window_xid: 48234500
---- window_class: Chromium

applications = {
    { -- man page with Xterm
        search = { match(get_window_name(), '^man: '), same(get_window_class(), 'XTerm') },
        icon = 'man',
    },
    { -- Xterm
        search = { same(get_window_class(), 'XTerm') },
        icon = 'xterm'
    },
    { -- gvim
        search =  { same(get_class_instance_name(), 'gvim') },
        icon = 'vim',
    },
    { -- gmpc
        search = { same(get_window_class(), 'Gmpc') },
        icon = 'soundspeaker',
    },
    { -- chromium devtools
        search = { starts_with(get_window_name(), 'DevTools -'), same(get_window_class(), 'Chromium') },
        icon = 'chromium-devtools',
    },
}
