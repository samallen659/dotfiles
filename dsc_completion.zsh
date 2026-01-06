#compdef dsc

autoload -U is-at-least

_dsc() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-l+[Trace level to use]:TRACE_LEVEL:(error warn info debug trace)' \
'--trace-level=[Trace level to use]:TRACE_LEVEL:(error warn info debug trace)' \
'-t+[Trace format to use]:TRACE_FORMAT:(default plaintext json)' \
'--trace-format=[Trace format to use]:TRACE_FORMAT:(default plaintext json)' \
'-p+[Progress format to use]:PROGRESS_FORMAT:((default\:"If interactive, use a progress bar. If not interactive, no progress is shown"
none\:"No progress is shown"
json\:"Show progress as JSON"))' \
'--progress-format=[Progress format to use]:PROGRESS_FORMAT:((default\:"If interactive, use a progress bar. If not interactive, no progress is shown"
none\:"No progress is shown"
json\:"Show progress as JSON"))' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_dsc_commands" \
"*::: :->dsc" \
&& ret=0
    case $state in
    (dsc)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-command-$line[1]:"
        case $line[1] in
            (completer)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':shell -- The shell to generate a completion script for:(bash elvish fish powershell zsh)' \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" : \
'(-f --parameters-file)-p+[Parameters to pass to the configuration as JSON or YAML]:PARAMETERS:_default' \
'(-f --parameters-file)--parameters=[Parameters to pass to the configuration as JSON or YAML]:PARAMETERS:_default' \
'(-p --parameters)-f+[Parameters to pass to the configuration as a JSON or YAML file]:PARAMETERS_FILE:_default' \
'(-p --parameters)--parameters-file=[Parameters to pass to the configuration as a JSON or YAML file]:PARAMETERS_FILE:_default' \
'-r+[Specify the operating system root path if not targeting the current running OS]:SYSTEM_ROOT:_default' \
'--system-root=[Specify the operating system root path if not targeting the current running OS]:SYSTEM_ROOT:_default' \
'--as-group[]' \
'--as-assert[]' \
'--as-include[]' \
'-h[Print help]' \
'--help[Print help]' \
":: :_dsc__config_commands" \
"*::: :->config" \
&& ret=0

    case $state in
    (config)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-config-command-$line[1]:"
        case $line[1] in
            (get)
_arguments "${_arguments_options[@]}" : \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" : \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-w[Run as a what-if operation instead of executing the configuration or resource]' \
'--what-if[Run as a what-if operation instead of executing the configuration or resource]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" : \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--as-get[]' \
'--as-config[]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(validate)
_arguments "${_arguments_options[@]}" : \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" : \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(resolve)
_arguments "${_arguments_options[@]}" : \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_dsc__config__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-config-help-command-$line[1]:"
        case $line[1] in
            (get)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(validate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(resolve)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(extension)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_dsc__extension_commands" \
"*::: :->extension" \
&& ret=0

    case $state in
    (extension)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-extension-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml table-no-truncate)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml table-no-truncate)' \
'-h[Print help]' \
'--help[Print help]' \
'::extension_name -- Optional filter to apply to the list of extensions:_default' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_dsc__extension__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-extension-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(resource)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_dsc__resource_commands" \
"*::: :->resource" \
&& ret=0

    case $state in
    (resource)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-resource-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
'-a+[Adapter filter to limit the resource search]:ADAPTER_NAME:_default' \
'--adapter=[Adapter filter to limit the resource search]:ADAPTER_NAME:_default' \
'-d+[Description keyword to search for in the resource description]:DESCRIPTION:_default' \
'--description=[Description keyword to search for in the resource description]:DESCRIPTION:_default' \
'*-t+[Tag to search for in the resource tags]:TAGS:_default' \
'*--tags=[Tag to search for in the resource tags]:TAGS:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml table-no-truncate)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml table-no-truncate)' \
'-h[Print help]' \
'--help[Print help]' \
'::resource_name -- Optional filter to apply to the list of resources:_default' \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" : \
'-r+[The name of the resource to invoke]:RESOURCE:_default' \
'--resource=[The name of the resource to invoke]:RESOURCE:_default' \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json json-array pass-through pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json json-array pass-through pretty-json yaml)' \
'-a[Get all instances of the resource]' \
'--all[Get all instances of the resource]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" : \
'-r+[The name of the resource to invoke]:RESOURCE:_default' \
'--resource=[The name of the resource to invoke]:RESOURCE:_default' \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" : \
'-r+[The name of the resource to invoke]:RESOURCE:_default' \
'--resource=[The name of the resource to invoke]:RESOURCE:_default' \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-r+[The name of the resource to invoke]:RESOURCE:_default' \
'--resource=[The name of the resource to invoke]:RESOURCE:_default' \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(schema)
_arguments "${_arguments_options[@]}" : \
'-r+[The name of the resource to invoke]:RESOURCE:_default' \
'--resource=[The name of the resource to invoke]:RESOURCE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" : \
'-r+[The name of the resource to invoke]:RESOURCE:_default' \
'--resource=[The name of the resource to invoke]:RESOURCE:_default' \
'(-f --file)-i+[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-f --file)--input=[The input document as JSON or YAML to pass to the configuration or resource]:INPUT:_default' \
'(-i --input)-f+[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'(-i --input)--file=[The path to a file used as input to the configuration or resource. Use '\''-'\'' for the file to read from STDIN.]:FILE:_default' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_dsc__resource__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-resource-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(schema)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(schema)
_arguments "${_arguments_options[@]}" : \
'-t+[The type of DSC schema to get]:type:(get-result set-result test-result resolve-result dsc-resource resource-manifest include configuration configuration-get-result configuration-set-result configuration-test-result)' \
'--type=[The type of DSC schema to get]:type:(get-result set-result test-result resolve-result dsc-resource resource-manifest include configuration configuration-get-result configuration-set-result configuration-test-result)' \
'-o+[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'--output-format=[The output format to use]:OUTPUT_FORMAT:(json pretty-json yaml)' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_dsc__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-help-command-$line[1]:"
        case $line[1] in
            (completer)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" : \
":: :_dsc__help__config_commands" \
"*::: :->config" \
&& ret=0

    case $state in
    (config)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-help-config-command-$line[1]:"
        case $line[1] in
            (get)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(validate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(resolve)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(extension)
_arguments "${_arguments_options[@]}" : \
":: :_dsc__help__extension_commands" \
"*::: :->extension" \
&& ret=0

    case $state in
    (extension)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-help-extension-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(resource)
_arguments "${_arguments_options[@]}" : \
":: :_dsc__help__resource_commands" \
"*::: :->resource" \
&& ret=0

    case $state in
    (resource)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dsc-help-resource-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(schema)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(schema)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_dsc_commands] )) ||
_dsc_commands() {
    local commands; commands=(
'completer:Generate a shell completion script' \
'config:Apply a configuration document' \
'extension:Operations on DSC extensions' \
'resource:Invoke a specific DSC resource' \
'schema:Get the JSON schema for a DSC type' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc commands' commands "$@"
}
(( $+functions[_dsc__completer_commands] )) ||
_dsc__completer_commands() {
    local commands; commands=()
    _describe -t commands 'dsc completer commands' commands "$@"
}
(( $+functions[_dsc__config_commands] )) ||
_dsc__config_commands() {
    local commands; commands=(
'get:Retrieve the current configuration' \
'set:Set the current configuration' \
'test:Test the current configuration' \
'validate:Validate the current configuration' \
'export:Export the current configuration' \
'resolve:Resolve the current configuration' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc config commands' commands "$@"
}
(( $+functions[_dsc__config__export_commands] )) ||
_dsc__config__export_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config export commands' commands "$@"
}
(( $+functions[_dsc__config__get_commands] )) ||
_dsc__config__get_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config get commands' commands "$@"
}
(( $+functions[_dsc__config__help_commands] )) ||
_dsc__config__help_commands() {
    local commands; commands=(
'get:Retrieve the current configuration' \
'set:Set the current configuration' \
'test:Test the current configuration' \
'validate:Validate the current configuration' \
'export:Export the current configuration' \
'resolve:Resolve the current configuration' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc config help commands' commands "$@"
}
(( $+functions[_dsc__config__help__export_commands] )) ||
_dsc__config__help__export_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config help export commands' commands "$@"
}
(( $+functions[_dsc__config__help__get_commands] )) ||
_dsc__config__help__get_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config help get commands' commands "$@"
}
(( $+functions[_dsc__config__help__help_commands] )) ||
_dsc__config__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config help help commands' commands "$@"
}
(( $+functions[_dsc__config__help__resolve_commands] )) ||
_dsc__config__help__resolve_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config help resolve commands' commands "$@"
}
(( $+functions[_dsc__config__help__set_commands] )) ||
_dsc__config__help__set_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config help set commands' commands "$@"
}
(( $+functions[_dsc__config__help__test_commands] )) ||
_dsc__config__help__test_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config help test commands' commands "$@"
}
(( $+functions[_dsc__config__help__validate_commands] )) ||
_dsc__config__help__validate_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config help validate commands' commands "$@"
}
(( $+functions[_dsc__config__resolve_commands] )) ||
_dsc__config__resolve_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config resolve commands' commands "$@"
}
(( $+functions[_dsc__config__set_commands] )) ||
_dsc__config__set_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config set commands' commands "$@"
}
(( $+functions[_dsc__config__test_commands] )) ||
_dsc__config__test_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config test commands' commands "$@"
}
(( $+functions[_dsc__config__validate_commands] )) ||
_dsc__config__validate_commands() {
    local commands; commands=()
    _describe -t commands 'dsc config validate commands' commands "$@"
}
(( $+functions[_dsc__extension_commands] )) ||
_dsc__extension_commands() {
    local commands; commands=(
'list:List or find extensions' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc extension commands' commands "$@"
}
(( $+functions[_dsc__extension__help_commands] )) ||
_dsc__extension__help_commands() {
    local commands; commands=(
'list:List or find extensions' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc extension help commands' commands "$@"
}
(( $+functions[_dsc__extension__help__help_commands] )) ||
_dsc__extension__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'dsc extension help help commands' commands "$@"
}
(( $+functions[_dsc__extension__help__list_commands] )) ||
_dsc__extension__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'dsc extension help list commands' commands "$@"
}
(( $+functions[_dsc__extension__list_commands] )) ||
_dsc__extension__list_commands() {
    local commands; commands=()
    _describe -t commands 'dsc extension list commands' commands "$@"
}
(( $+functions[_dsc__help_commands] )) ||
_dsc__help_commands() {
    local commands; commands=(
'completer:Generate a shell completion script' \
'config:Apply a configuration document' \
'extension:Operations on DSC extensions' \
'resource:Invoke a specific DSC resource' \
'schema:Get the JSON schema for a DSC type' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc help commands' commands "$@"
}
(( $+functions[_dsc__help__completer_commands] )) ||
_dsc__help__completer_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help completer commands' commands "$@"
}
(( $+functions[_dsc__help__config_commands] )) ||
_dsc__help__config_commands() {
    local commands; commands=(
'get:Retrieve the current configuration' \
'set:Set the current configuration' \
'test:Test the current configuration' \
'validate:Validate the current configuration' \
'export:Export the current configuration' \
'resolve:Resolve the current configuration' \
    )
    _describe -t commands 'dsc help config commands' commands "$@"
}
(( $+functions[_dsc__help__config__export_commands] )) ||
_dsc__help__config__export_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help config export commands' commands "$@"
}
(( $+functions[_dsc__help__config__get_commands] )) ||
_dsc__help__config__get_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help config get commands' commands "$@"
}
(( $+functions[_dsc__help__config__resolve_commands] )) ||
_dsc__help__config__resolve_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help config resolve commands' commands "$@"
}
(( $+functions[_dsc__help__config__set_commands] )) ||
_dsc__help__config__set_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help config set commands' commands "$@"
}
(( $+functions[_dsc__help__config__test_commands] )) ||
_dsc__help__config__test_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help config test commands' commands "$@"
}
(( $+functions[_dsc__help__config__validate_commands] )) ||
_dsc__help__config__validate_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help config validate commands' commands "$@"
}
(( $+functions[_dsc__help__extension_commands] )) ||
_dsc__help__extension_commands() {
    local commands; commands=(
'list:List or find extensions' \
    )
    _describe -t commands 'dsc help extension commands' commands "$@"
}
(( $+functions[_dsc__help__extension__list_commands] )) ||
_dsc__help__extension__list_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help extension list commands' commands "$@"
}
(( $+functions[_dsc__help__help_commands] )) ||
_dsc__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help help commands' commands "$@"
}
(( $+functions[_dsc__help__resource_commands] )) ||
_dsc__help__resource_commands() {
    local commands; commands=(
'list:List or find resources' \
'get:Invoke the get operation to a resource' \
'set:Invoke the set operation to a resource' \
'test:Invoke the test operation to a resource' \
'delete:Invoke the delete operation to a resource' \
'schema:Get the JSON schema for a resource' \
'export:Retrieve all resource instances' \
    )
    _describe -t commands 'dsc help resource commands' commands "$@"
}
(( $+functions[_dsc__help__resource__delete_commands] )) ||
_dsc__help__resource__delete_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help resource delete commands' commands "$@"
}
(( $+functions[_dsc__help__resource__export_commands] )) ||
_dsc__help__resource__export_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help resource export commands' commands "$@"
}
(( $+functions[_dsc__help__resource__get_commands] )) ||
_dsc__help__resource__get_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help resource get commands' commands "$@"
}
(( $+functions[_dsc__help__resource__list_commands] )) ||
_dsc__help__resource__list_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help resource list commands' commands "$@"
}
(( $+functions[_dsc__help__resource__schema_commands] )) ||
_dsc__help__resource__schema_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help resource schema commands' commands "$@"
}
(( $+functions[_dsc__help__resource__set_commands] )) ||
_dsc__help__resource__set_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help resource set commands' commands "$@"
}
(( $+functions[_dsc__help__resource__test_commands] )) ||
_dsc__help__resource__test_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help resource test commands' commands "$@"
}
(( $+functions[_dsc__help__schema_commands] )) ||
_dsc__help__schema_commands() {
    local commands; commands=()
    _describe -t commands 'dsc help schema commands' commands "$@"
}
(( $+functions[_dsc__resource_commands] )) ||
_dsc__resource_commands() {
    local commands; commands=(
'list:List or find resources' \
'get:Invoke the get operation to a resource' \
'set:Invoke the set operation to a resource' \
'test:Invoke the test operation to a resource' \
'delete:Invoke the delete operation to a resource' \
'schema:Get the JSON schema for a resource' \
'export:Retrieve all resource instances' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc resource commands' commands "$@"
}
(( $+functions[_dsc__resource__delete_commands] )) ||
_dsc__resource__delete_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource delete commands' commands "$@"
}
(( $+functions[_dsc__resource__export_commands] )) ||
_dsc__resource__export_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource export commands' commands "$@"
}
(( $+functions[_dsc__resource__get_commands] )) ||
_dsc__resource__get_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource get commands' commands "$@"
}
(( $+functions[_dsc__resource__help_commands] )) ||
_dsc__resource__help_commands() {
    local commands; commands=(
'list:List or find resources' \
'get:Invoke the get operation to a resource' \
'set:Invoke the set operation to a resource' \
'test:Invoke the test operation to a resource' \
'delete:Invoke the delete operation to a resource' \
'schema:Get the JSON schema for a resource' \
'export:Retrieve all resource instances' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dsc resource help commands' commands "$@"
}
(( $+functions[_dsc__resource__help__delete_commands] )) ||
_dsc__resource__help__delete_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help delete commands' commands "$@"
}
(( $+functions[_dsc__resource__help__export_commands] )) ||
_dsc__resource__help__export_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help export commands' commands "$@"
}
(( $+functions[_dsc__resource__help__get_commands] )) ||
_dsc__resource__help__get_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help get commands' commands "$@"
}
(( $+functions[_dsc__resource__help__help_commands] )) ||
_dsc__resource__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help help commands' commands "$@"
}
(( $+functions[_dsc__resource__help__list_commands] )) ||
_dsc__resource__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help list commands' commands "$@"
}
(( $+functions[_dsc__resource__help__schema_commands] )) ||
_dsc__resource__help__schema_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help schema commands' commands "$@"
}
(( $+functions[_dsc__resource__help__set_commands] )) ||
_dsc__resource__help__set_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help set commands' commands "$@"
}
(( $+functions[_dsc__resource__help__test_commands] )) ||
_dsc__resource__help__test_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource help test commands' commands "$@"
}
(( $+functions[_dsc__resource__list_commands] )) ||
_dsc__resource__list_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource list commands' commands "$@"
}
(( $+functions[_dsc__resource__schema_commands] )) ||
_dsc__resource__schema_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource schema commands' commands "$@"
}
(( $+functions[_dsc__resource__set_commands] )) ||
_dsc__resource__set_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource set commands' commands "$@"
}
(( $+functions[_dsc__resource__test_commands] )) ||
_dsc__resource__test_commands() {
    local commands; commands=()
    _describe -t commands 'dsc resource test commands' commands "$@"
}
(( $+functions[_dsc__schema_commands] )) ||
_dsc__schema_commands() {
    local commands; commands=()
    _describe -t commands 'dsc schema commands' commands "$@"
}

if [ "$funcstack[1]" = "_dsc" ]; then
    _dsc "$@"
else
    compdef _dsc dsc
fi
