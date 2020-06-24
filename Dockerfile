FROM heroku/heroku:18

COPY . /tmp/buildpack

RUN mkdir /tmp/build /tmp/cache /tmp/env /tmp/build/testcleanupdir
RUN echo "testcleanupdir" >> /tmp/build/.slugcleanup
RUN dd if=/dev/zero of=/tmp/build/testcleanupdir/output.dat  bs=1M  count=1
CMD /tmp/buildpack/bin/detect /tmp/build && /tmp/buildpack/bin/compile /tmp/build /tmp/cache /tmp/env
