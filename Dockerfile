FROM justb4/jmeter:5.5

WORKDIR /test

COPY FtpRequest.jmx /test/FtpRequest.jmx