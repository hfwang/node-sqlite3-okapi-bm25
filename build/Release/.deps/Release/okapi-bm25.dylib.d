cmd_Release/okapi-bm25.dylib := ./gyp-mac-tool flock ./Release/linker.lock c++ -shared -Wl,-search_paths_first -mmacosx-version-min=10.5 -arch x86_64 -L./Release -install_name @rpath/okapi-bm25.dylib  -o "Release/okapi-bm25.dylib" ./Release/obj.target/okapi-bm25/deps/okapi_bm25.o -undefined dynamic_lookup
