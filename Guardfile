# frozen_string_literal: true

clearing :on
guard :shell do
  watch(/.*/) do |_m|
    system('bundle exec rubocop')
    system('bundle exec rspec')
  end
end
