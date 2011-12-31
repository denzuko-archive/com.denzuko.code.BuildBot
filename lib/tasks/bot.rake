namespace :bot do
  desc "Start presence agent"
  task :start do
    system "ruby ./buildbot.rb"
  end
end
