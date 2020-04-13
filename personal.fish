neofetch

fish_vi_key_bindings

alias less='less -MN '
alias ccat='pygmentize -g '
alias cd..='cd ..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -lahrt --color'
alias rm='trash'
alias cb='xclip -selection clipboard'
alias vimdiff='nvim -d'
alias vim='nvim'

set -g -x STUFF "$HOME/Stuff"
set -g -x PATH $PATH:$STUFF

source ~/.profile



#set -g -x ANACONDA_HOME "$STUFF/anaconda3"
#set -g -x PATH $PATH:$ANACONDA_HOME/bin

#set -g -x PYSPARK_PYTHON "$ANACONDA_HOME/bin/python3"
#set -g -x SPARK_HOME "$STUFF/spark-3.0.0-bin-hadoop2.7"
#set -g -x PYSPARK_DRIVER_PYTHON "$ANACONDA_HOME/bin/jupyter"
#set -g -x PYSPARK_DRIVER_PYTHON_OPTS 'notebook'
#set -g -x PYSPARK_DRIVER_PYTHON "$ANACONDA_HOME/bin/ipython3"

#set -g -x JAVA_HOME "$STUFF/jdk1.8.0_131"
#set -g -x JAVA_HOME "$STUFF/jdk-14"

#set -g -x HADOOP_HOME "$STUFF/hadoop-2.8.0"
#set -g -x HADOOP_MAPRED_HOME $HADOOP_HOME
#set -g -x HADOOP_COMMON_HOME $HADOOP_HOME
#set -g -x HADOOP_HDFS_HOME $HADOOP_HOME
#set -g -x YARN_HOME $HADOOP_HOME
#set -g -x HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
#set -g -x HADOOP_INSTALL $HADOOP_HOME

#set -g -x PATH $PATH:$HOME/.local/bin
#set -g -x PATH $PATH:$SPARK_HOME/bin
#set -g -x PATH $PATH:$JAVA_HOME/bin
#set -g -x PATH $PATH:$HADOOP_HOME/bin
#set -g -x PATH $PATH:$HADOOP_HOME/sbin
