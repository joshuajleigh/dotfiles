rsync -arv --progress \
  --exclude=Repos/ \
  --exclude=.local/share/Steam/ \
  --exclude=.local/share/Aspyr/ \
  --exclude=.local/share/aspyr-media/ \
  --exclude=.cache/ \
  --exclude=.config/browsh/  \
  --exclude=.config/google-chrome-beta/ \
  --exclude=.config/pianobar/log \
  --exclude=.minecraft/ \
  --exclude=.mozilla/ \
  --exclude=Downloads/ \
  --exclude=Maildir/ex2mutt/ \
  --exclude=go/ \
  --exclude=snap/ \
  /home/jleigh/ darktower:/darkstorage/jleigh/
