# openbox-custom-icon
Under `openbox` window manager, sets application window icons with help of `devilspie2` and `xseticon`.

Into this repository, you will find a main lua script for `devilspie2` and a configuration lua script.
In 95% of time, the first one, no needs changes. The second one, contains an array (`applications`) in which you configure icons against application window attributes.

Theses scripts are essentially helpers functions, to helps you matching more easily window attributes, to make configuration process simpler as possible.

![screenshot](screenshot.png)

# Prerequists:
- devilspie2
- xseticon

# Installation:
- copy `openbox-custom-icons.lua` into devilspie's configuration folder: `~/.config/devilspie2`
- copy `custom-icons.conf.lua` into `~/.config/openbox/`
- edit and customize `custom-icons.conf.lua`

# Parameters
## openbox-custom-icons.lua
### default values:
- `seticon_binary = 'xseticon'`
- `configuration = os.getenv('HOME')..'/.config/openbox/custom-icons.conf.lua'`
- `icon_prefix = os.getenv('HOME')..'/.config/openbox/custom-icons/'`
- `icon_extension = 'png'`

## `custom-icons.conf.lua`
You can override all default parameters into this lua script, except `configuration`. So, after first installation,  you have only one entry point file for your daily customisation.

```lua
applications = {
   {
       search = { test1[, test2, ...] } -- from utils: same, match, starts_with, ends_with
       match_if = all, any -- default all
       icon = filename -- without pathname, without extension
    }
}
```
### helpers functions
#### pattern search
- `starts_with`: Checks if 'subject' starts with a given 'pattern'
- `ends_with`: Checks if 'subject' ends with a given 'pattern'
- `same`: Checks if 'subject' are equivalent to 'pattern'

#### test match type
- `all`: all test must succeed ― default
- `any`: at least one test succeed

#### icon filename
Icon filename without path prefix and extension, they are appended automaticaly.

# Crédits:
- openbox: [website](https://openbox.org/)
- devilspie2: [nongnu.org](https://www.nongnu.org/devilspie2/) ― [github](https://github.com/dsalt/devilspie2)
- xseticon: from LeoNerd.org.uk