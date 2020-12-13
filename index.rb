require "tty-prompt"

prompt = TTY::Prompt.new

prompt.yes?("Want to watch a terrible movie?")
# => Do you like Ruby? (Y/n)

prompt.select("What Genre?", %w(Horror Comedy Drama Action Adventure))

