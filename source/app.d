import std.stdio;
import vibe.d;
import std.path;
import std.file;

RedisClient client;
RedisDatabase theDB;

@path("/api/")
interface BlocklandAPI {
	string getVersionString(int vers); 
	string getFilename(int vers, string hash);
}

class BlocklandAPIImplem : BlocklandAPI {

	string getVersionString(int vers) { //Just some silly version string stuff. I'll finish this later.
		return "unimplemented";
	}

	string getFilename(int vers, string hash) {
		string ret = theDB.get!string(hash.replace("\"", "")); //Replace quotes with nothing for looking up in Redis
		if(ret == "") {
			return "ERR_NO_ENTRY";
		}
		return ret;
	}
}

void main()
{	
	client = new RedisClient(); //This assumes a redis setup- with no authentication and running on localhost:6379
	theDB = client.getDatabase(0); //The hashes must be stored in database 0.
	auto router = new URLRouter;
	router.registerRestInterface(new BlocklandAPIImplem());
	writeln("starting service");
	auto settings = new HTTPServerSettings;
	settings.port = 8888; //Listen on port 8888
	settings.bindAddresses = ["0.0.0.0"]; 
	listenHTTP(settings, router);
	runApplication();
	//writeln("Edit source/app.d to start your project.");
}
