git remote add update_stream https://github.com/EpicGames/UnrealEngine.git
git remote -v
git fetch update_stream
git merge update_stream/release
git push origin release