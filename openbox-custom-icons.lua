-- default configuration values
--
seticon_binary='xseticon'
-- lua script custom configuration
configuration=os.getenv('HOME')..'/.config/openbox/custom-icons.conf.lua'
-- default icon path prefix added to icon define into configuration
icon_prefix=os.getenv('HOME')..'/.config/openbox/custom-icons/'
-- default icon extension added to icon define into configuration
icon_extension='png'

-- Helpers functions

-- Checks if 'subject' starts with a given 'pattern'
function starts_with(subject, pattern)
    return string.find(subject, pattern) == 1
end

-- Checks if 'subject' ends with a given 'pattern'
function ends_with(subject, pattern)
    return string.match(subject, pattern..'$') or false
end

-- Checks if 'subject' are equivalent to 'pattern'
function same(subject, pattern)
    return subject == pattern
end

-- Returns 'true' if any of test into 'tests' succeeds, else 'false'
function any(tests)
    for index, test in pairs(tests) do
        if test then return true end
    end
    return false
end

-- Returns 'true' if all test into 'tests' succeeds, else 'false'
function all(tests)
    for index, test in pairs(tests) do
        if not test then return false end
    end
    return true
end

-- A convenient string.match wrapper function
-- Returns 'true' if match, or 'false' instead of 'nil'
-- (with lua, nil value into a table, stops its elements iteration)
function match(subject, pattern)
    return string.match(subject, pattern) or false
end

-- try to find a match between application
function custom_icon(applications)
    for index, attribute in pairs(applications) do
        -- by default 'match_if' is set to 'all'
        match_if=attribute.match_if or all
        if (match_if(attribute.search)) then
            return attribute.icon
        end
    end
    return false
end

function main()
    -- if match set corresponding icon for this application
    icon_name=custom_icon(applications)
    if icon_name then
        -- extends icon filename with prefix path and following extension
        icon=icon_prefix..icon_name..'.'..icon_extension
        -- retrieves window id and calls seticon_binary with it
        os.execute(seticon_binary..' -id '..get_window_xid()..' '..icon)
    end
end

-- if configuration file found, call main function
configuration_file=io.open(configuration, 'r')
if configuration_file ~= nil then
    io.close(configuration_file)
    dofile(configuration)
    main()
else
    print('Unable to load configuration file, does nothing more.')
    print('Configuration file path was: '..configuration)
end
