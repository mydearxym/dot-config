if test -e ~/.autojump/etc/profile.d/autojump.fish
    . ~/.autojump/etc/profile.d/autojump.fish
end

set fish_plugins git rails rbenv bundler node brew rake
#set theme robbyrussell
set theme clearance


# name: RobbyRussel
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $arrow $cwd $git_info $normal ' '
end



alias v='mvim -v'
alias vi='vim'

# Working with Git
alias g='git'
alias gl='tig'

alias gst='git status'
alias gci='git commit'
alias gca='git commit -am'
alias ga='git add'
alias gco='git checkout'
alias gb='git branch'
alias gm='git merge'
alias gd="git diff"
alias gdrop="git reset --hard HEAD"
alias gdroph="git reset --hard HEAD^"

alias sl="sails lift"
alias fuck="thefuck"

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

# Working with Rails
alias rs='rails server'
alias rc='rails console'
alias rdm='rake db:migrate'
alias r='rake'
alias rcs='rails console --sandbox'
alias rgm='rails generate migration '
alias idiff='icdiff --line-number'
alias m="meteor"

alias python='python3'
# Working with you-get
alias yg='you-get -o ~/video/ --format=mp4 '

setenv EDITOR /bin/subl
set -U fish_user_paths ~/code/android-sdk-macosx/tools
set -U fish_user_paths ~/code/android-sdk-macosx/platforms
set -gx PATH ~/code/android-sdk-macosx/tools $PATH
set -gx PATH ~/code/android-sdk-macosx/platforms $PATH
set -gx GVM_ROOT=/Users/xieyiming/.gvm
set -gx GVM_ROOT=/Users/xieyiming/.gvm/scripts/gvm-default

set -gx GOPATH /Users/xieyiming/code/go_playground/
set -gx GOROOT /usr/local/Cellar/go/1.2.2/libexec/

setenv ANDROID_HOME /Users/xieyiming/code/android-sdk-macosx
