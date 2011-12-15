require 'gemjacker'

here = File.dirname(__FILE__)

search_a = File.expand_path(File.join(here, "search_a"))
search_b = File.expand_path(File.join(here, "search_b"))

GemJacker::ExecutablePaths.reset_path
GemJacker::ExecutablePaths.add_path(search_a)
GemJacker::ExecutablePaths.add_path(search_b)
GemJacker::ExecutablePaths.replace_sys_path

p ENV['PATH']
system("found_a")
system("found_b")

GemJacker::ExecutablePaths.reset_path
GemJacker::ExecutablePaths.reset_sys_path_to_original
GemJacker::ExecutablePaths.inherit_sys_path(0) # !
GemJacker::ExecutablePaths.add_path(search_a, 2)
GemJacker::ExecutablePaths.add_path(search_b, 1)
GemJacker::ExecutablePaths.replace_sys_path

p ENV['PATH']
system("found_a")
system("found_b")
