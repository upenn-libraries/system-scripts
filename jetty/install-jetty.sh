JETTY_VERSION=7.6.10.v20130312
JETTY_URL=http://search.maven.org/remotecontent?filepath=org/eclipse/jetty/jetty-distribution/$JETTY_VERSION/jetty-distribution-$JETTY_VERSION.tar.gz
if [ ! -d jetty-distribution-$JETTY_VERSION ]
then
	curl $JETTY_URL > jetty-distribution-$JETTY_VERSION.tar.gz
	tar xfz jetty-distribution-$JETTY_VERSION.tar.gz
	rm jetty-distribution-$JETTY_VERSION.tar.gz
	rm jetty-distribution-$JETTY_VERSION/webapps/*
	rm -rf jetty-distribution-$JETTY_VERSION/contexts/*
fi