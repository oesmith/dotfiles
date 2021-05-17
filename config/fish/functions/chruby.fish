if test -d ~/third_party/chruby
  function chruby
      bass source ~/third_party/chruby/share/chruby/chruby.sh ';' chruby $argv
  end
end
