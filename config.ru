main_dir = File.expand_path(File.dirname(__FILE__))
apps = {}
host_regex = /^([a-zA-Z0-9-]+).([a-z]{2}).2013q2.davincicoders2013.info$/

run(lambda do |env|
  begin
    if match = env['HTTP_HOST'].match(host_regex)
      app_num = match[1]
      if Dir.exists?("#{main_dir}/#{app_num}")
        if File.exists?("#{main_dir}/#{app_num}/#{app_num}.rb")
          Dir.chdir "#{main_dir}/#{app_num}"
          Sinatra::Application.reset! if defined? Sinatra
          load "./#{app_num}.rb"
          if apps[app_num].nil?
            apps[app_num] = Sinatra::Application.new
          end
          apps[app_num].settings.set :app_file, nil
          return apps[app_num].call(env)
        else
          [
            404,
            {"Content-Type" => "text/plain"},
            ["Error: file #{app_num}/#{app_num}.rb doesn't exist, or hasn't been added to Git, committed to Git, and pushed to the remote named heroku yet."]
          ]
        end
      else
        [
          404,
          {"Content-Type" => "text/plain"},
          ["Error: directory #{app_num} doesn't exist, or hasn't been added to Git, committed to Git, and pushed to the remote named heroku yet."]
        ]
      end
    elsif env['HTTP_HOST'].match(/^localhost(:[0-9]{4})?$/)
      [
        200,
        {"Content-Type" => "text/plain"},
        ["Instructions:
1. Deploy this app to Heroku
2. Run heroku domains:add *.xx.2013q2.davincicoders2013.info
   (replacing xx with your first and last initials)
   (run 'heroku domains help' or see https://devcenter.heroku.com/articles/custom-domains#wildcard-domains for help)
3. Access your Sinatra app at http://999.xx.2013q2.davincicoders2013.info/
   (where 999 is the number of the directory and xx is your initials)"]
      ]
    else
      [
        404,
        {"Content-Type" => "text/plain"},
        ["Error: hostname must match #{host_regex}"]
      ]
    end
  rescue Exception => e
    [
      500,
      {"Content-Type" => "text/plain"},
      ["#{e.class}\n#{e}\n#{e.backtrace.join("\n")}"]
    ]
  end
end)
