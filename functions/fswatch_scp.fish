function fswatch_scp --argument watch_dir target

    if test -z "$target"
      echo "usage: $self <watch-dir> <target>"
      echo "  watch-dir: path to a local directory to watch"
      echo "  target:    an scp target specification, e.g."
      echo "             user@host.domain:/var/tmp"
      exit 1
    end

    echo "watching: $watch_dir"
    echo "target:   $target"
    echo "press ctrl+c to quit"
    echo
    fswatch -e '.git/' $watch_dir | while read f; echo "$f => $target"; and scp -q "$f" "$target"; end
end
