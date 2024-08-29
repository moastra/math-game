class IOHandler
  def self.get_input(prompt)
    puts prompt
    print  "> "
    gets.chomp
  end

  def self.output(message)
    puts message
  end
end