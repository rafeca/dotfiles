export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=/usr/local/bin:$PATH
export PATH="$(greadlink --canonicalize $(dirname $0)/../bin):$PATH"
export PATH=~/bin:$PATH
export PATH=~/Documents/bin:$PATH
export PATH=~/.local/bin:$PATH
