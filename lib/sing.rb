module Sing
  class Logger
    def self.log(log = 'Nothing in special')
      sing_on_log("[Sing::Logger.log on " + environment.capitalize + "] " + log + " at " + Time.now.to_s)
    end

    private

    def self.environment
      Sinatra::Application.environment.to_s
    end

    def self.log_location
      Dir.pwd + "/log/#{environment}.log" if check_or_create_log_location
    end

    def self.check_or_create_log_location
      return false unless system 'mkdir -p log'
      return false unless system "touch log/#{environment}.log"
      true
    end

    def self.sing_on_log(content = '')
      File.open(log_location, 'a') { |f| f.puts(content); f.close }
      puts content
      return content
    end
  end
end
