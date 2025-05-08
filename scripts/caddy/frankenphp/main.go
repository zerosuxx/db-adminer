package main

import (
	"os"
	"strings"

	caddycmd "github.com/caddyserver/caddy/v2/cmd"

	// plug in Caddy modules here.
	_ "github.com/caddyserver/caddy/v2/modules/standard"
	_ "github.com/dunglas/caddy-cbrotli"
	_ "github.com/dunglas/frankenphp/caddy"
	_ "github.com/dunglas/mercure/caddy"
	_ "github.com/dunglas/vulcain/caddy"
)

func main() {
    defaultCommand := "php-server"
    if len(os.Args) < 2 {
        os.Args = append(os.Args, defaultCommand)
    } else if os.Args[1] != "--help" && strings.HasPrefix(os.Args[1], "-") {
        var args []string
        args = append(args, os.Args[:1]...)
        args = append(args, defaultCommand)
        os.Args = append(args, os.Args[1:]...)
    }

    caddycmd.Main()
}
