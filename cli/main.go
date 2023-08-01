package main

import (
	"os"

	"github.com/avarian/dbo-test/cli/commands"
)

func main() {
	if err := commands.Execute(); err != nil {
		os.Exit(1)
	}
}
