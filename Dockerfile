FROM justb4/jmeter:5.5

WORKDIR /test

COPY FtpRequest.jmx /test/FtpRequest.jmx

CMD ["-n", "-t", "/test/FtpRequest.jmx", "-l", "/test/ftp-results.jtl"]