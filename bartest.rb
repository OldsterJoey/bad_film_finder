require 'tty-progressbar'

bar = TTY::ProgressBar.new("Im finding you a terrible movie... [:bar]", total: 20)
20.times do
  sleep(0.1)
  bar.advance(1)
end