# frozen_string_literal: true
num = 0
10.times do
  Mix.create(title: "Mix #{num}", description: 'Description', url: 'www.google.com')
  num += 1
end
