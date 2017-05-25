function slugify
  echo $argv[1] | tr " " - | tr "," -
end


function sound
  mpv $argv[1] -vo null > /dev/null ^ /dev/null
end


function random_string -d 'Generate a random string given a length'
  set -l length $argv[1]
  apg -m $length -a1 -n1
end


function mcd
  mkdir -p $argv[1]
  cd $argv[1]
end


function mysql_create_db_and_user
  set -l user $argv[1]
  set -l database $argv[1]
  set -l password $argv[1]

  mysqladmin -u root create $database
  mysql -u root -e "GRANT ALL ON $database.* TO '$user'@'localhost' IDENTIFIED BY '$password';"
end


function log
  set -l color
  set -l level $argv[1]

  switch $argv[1]
    case DEBUG
      set color blue
    case WARNING
      set color yellow
    case ERROR
      set color red
    case INFO 
      set color normal
    case '*'
      set color normal
  end

  set_color -b $color; echo $argv[2..(count $argv)]
end


function publicip
  set -l ip
  set -l domains "ip.appspot.com" \
                 "ip.telize.com" \
                 "wtfismyip.com/text" \
                 "icanhazip.com" \
                 "https://secure.internode.on.net/webtools/showmyip?textonly=1" \
                 "http://myexternalip.com/raw"

  for domain in $domains
    set ip (curl $domain --fail --silent)
    if test $ip 
      echo $ip
      break
    end
  end
end


function extract
  if test -f $argv[1]
    switch $argv[1]
      case '*.tar.*' '*.tgz'
        tar xf $argv[1] 
      case '*.rar'
        unrar -x -ad $argv[1]
      case '*.zip'
        unzip $argv[1] 
      case '*.gz'
        gunzip $argv[1] 
      case '*.bz2'
        bunzip2 $argv[1] 
      case '*.xz'
        unxz $argv[1] 
      case '*'
        echo 'Can not extract $argv[1]'
    end
  else
    echo 'File does not exist.'
  end
end


function s
  set -l depth 4
  set -l path bin/activate.fish

  for i in ( seq $depth )
    if test -f $path
      . $path
      return 0
    end
    set path ../$path
  end
end


function __workon_py
  set -l target $HOME/projects/$argv[1]

  if test -f $target/bin/activate.fish
    . $target/bin/activate.fish
  end

  if test -d $target/src
    cd $target/src
  else
    cd $target
  end
end


function __workon_directories
  ls -l $HOME/projects/ | grep '^d' | awk '{ print \$9 }'
  ls -l $GOPATH/src/github.com/snahor/ | grep '^d' | awk '{ print \$9 }'
end


function workon
  if test -d $HOME/projects/$argv[1]
    __workon_py $argv[1]
  else if test -d $GOPATH/src/github.com/snahor/$argv[1]
    cd $GOPATH/src/github.com/snahor/$argv[1]
  end
end


function mkvenv
  set -l venv_name
  set -l venv_params
  set -l num_args (count $argv)

  if test $num_args = 0
    return 0
  end

  set venv_name $argv[1]

  if test $num_args != 1
    set venv_params $argv[2..$num_args]
  end

  virtualenv $HOME/projects/$venv_name $venv_params

  __workon_py $venv_name
end


function rmvenv
  rm -rf ~/projects/$argv[1]/{lib,bin,include,local}
end


function hgrep
  history | grep -v grep | grep -i $argv[1] | sort | uniq | less
end


function docker_ssh
  docker exec -i -t $argv[1] bash
end


function treeish
  set -l depth 1
  set -l dir
  set -l num_args (count $argv)

  if test $num_args = 1
    set depth $argv[1]
  end

  #if math "$num_args > 0" > /dev/null
    #set depth $argv[1]
  #end

  tree --dirsfirst -ChFLQ  $depth $dir
end


function search_and_replace
  ag $argv[1] -l | xargs perl -pi -e "s/$argv[1]/$argv[2]/g"
end

function ihazinternets
  ping -q -c 1 -W 1 8.8.8.8 > /dev/null ^&1
  if test $status = 0
    echo 'yay 😊'
  else
    echo 'nope 😭'
  end
end

#complete -x -c workon -f -n '__workon_directories'
complete -x -c workon -a "( ls -l $HOME/projects/ | grep '^d' | awk '{ print \$9 }' )"
complete -x -c rmvenv -a "( ls -l $HOME/projects/ | grep '^d' | awk '{ print \$9 }' )"
