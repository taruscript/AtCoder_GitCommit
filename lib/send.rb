class Send
  def self.index
    lastday = time

    # system("echo 'machine github.com\nlogin #{ENV["Git_ID"]}\npassword #{ENV["Git_PW"]}' > ./.netrc")

    system("cd storage;git init")
    system("cd storage;ls -a")
    # system("cd storage;echo 'AAAAA\n'")

    # system("cd storage;git remote add origin 'https://github.com/xryuseix/AtCoder_Backup'")
    system("cd storage;git remote set-url origin 'git@github.com:xryuseix/AtCoder_Backup.git'")
    
    system("cd storage;echo 'git remote -v\n'")

    domain = '@gmail.com'
    system("cd storage;git config --global user.email 'ryusei143.shootingstar#{domain}'")
    system("cd storage;git config --global user.name 'xryuseix'")
    # system("cd storage;echo 'CCCCC\n'")

    system("cd storage;git pull origin master")
    # system("cd storage;echo 'DDDDD\n'")
   
    system("cd storage;git add --all")
    # system("cd storage;echo 'EEEEE\n'")

    system("cd storage;git commit -m '#{lastday.year}/#{lastday.month}/#{lastday.day} #{rand(100000)}'")
    # system("cd storage;echo 'FFFFF\n'")

    system("cd storage;git push origin master")

    cmd = 'git push origin master'
    PTY.getpty(cmd) do | i,o |
        o.sync = true
        i.expect(/password:/,10){|line| ##入力プロンプトくるまでreadline繰り返す
            puts line
            o.puts ENV['Git_PW']
            o.flush
        }
        while( i.eof? == false )
            puts i.gets
        end
    end
    # system("cd storage;echo 'GGGGG\n'")
    
  end

  def self.time
    # === 昨日の日付を取得 ===
    now_unixtime = Time.new.to_i
    lastday_unixtime = now_unixtime - 60*60*24
    lastday = Time.at(lastday_unixtime)
    return lastday
  end

end