LUA     = 5.1
PREFIX  = /usr/local
LIBDIR  = $(PREFIX)/lib/lua/$(LUA)

LUA_CFLAGS  = $(shell pkg-config --cflags lua$(LUA))
CFLAGS  = -O2 -fPIC $(LUA_CFLAGS)
LIBS    = $(shell pkg-config --libs lua$(LUA))

SRCS    = lua-mongoose.c mongoose.c

mongoose.so: ${SRCS:.c=.o}
	$(CC) $(CFLAGS) -shared -o $@ ${SRCS:.c=.o} $(LIBS)

clean:
	rm -rf *.o *.so

install: mongoose.so
	install -m 755 mongoose.so $(DESTDIR)$(LIBDIR)/
 
uninstall:
	rm -rf $(DESTDIR)$(LIBDIR)/mongoose.so

.PHONY: mongoose.so