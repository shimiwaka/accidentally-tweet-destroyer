require "json"

f1 = File.open("tweets.js", "r")
rawstr = f1.read
f1.close

print "set start count > "
start_count = Integer(gets)

tweet_ids = rawstr.scan(/"id_str" : "(\d{19})",/)

count = 0

f2 = File.open("curl_command.dat")
curl_command = f2.read
f2.close

p curl_command.class

tweet_ids.each do |tweet_id|
  count += 1
  if count >= start_count
    print "#{count} : #{tweet_id[0]}\n"
    actual_command = curl_command.sub(/TWEET_ID/, tweet_id[0])
    response = `#{actual_command}`

    p response
  end
end

print "end count [#{count - 1}]"