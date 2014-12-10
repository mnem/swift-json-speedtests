require "json"

NUM_RECORDS = 8200
OUT_FILE = 'speedtest/convos.json'


def hic(length, variance)
    ('a'..'z').to_a.shuffle[0, 2 * variance * rand() + length - variance].join
end

def burp
    {
        :name => "#{hic(10, 6)} #{hic(8, 4)}",
        :handle => hic(10, 4),
    }
end

desc "Excrete some data"
task :dump do
    items = []

    NUM_RECORDS.times { items << burp }
    json_string = JSON.pretty_generate items

    File.open(OUT_FILE, 'w') { |f| f.write json_string }

    puts "#{NUM_RECORDS} records written in #{File.size(OUT_FILE) / 1024} KiB to #{OUT_FILE}"
end
