#\ -E deployment -p 3001
use Rack::Reloader, 0
use Rack::ContentLength

app = proc do |env|
  req = Rack::Request.new(env)

  data = [
    Time.now.iso8601,
    req.ip.inspect,
    req.request_method.inspect,
    req.path.inspect,
    req.user_agent.inspect,
    req.params.inspect,
    req.body.read.inspect,
  ]

  puts data.join(" ")

  [200, {"Content-Type" => "text/plain"}, [""]]
end


run app
