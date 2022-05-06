require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Documentation for YAML::load_file is at https://docs.ruby-lang.org/en/3.1/Psych.html#method-c-load_file. YAML is an alias for Psych.