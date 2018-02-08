# backend
Server architecture backend. Serves hashes for filenames, etc.
## compilation
```
dub
```
## running the actual backend
- Ensure that Redis is setup, with it's default configuration (this should be fine, as it's blocked off from the web.)
- Run `./populateRedis.sh`
- Compile the backend
- It should start running
- Success?