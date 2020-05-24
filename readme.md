# Usage

* shorten NAS access time
* database for script

## itunesSub

located in NAS. about 100GB
archives are "sub". not main

```itunesPick_generate
find /mnt/music/iTunes_cd_record_sub/ -type f | grep -Ev "\.(jpg || ini || png || alf || db)" > itunesSub
cat itunesSub | sed "s;/mnt/music;/mnt/nas/music;g" > 222itunesSub
```
