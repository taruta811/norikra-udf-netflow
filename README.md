# norikra-udf-netflow

Norikra UDF for processing NetFlow data.

## Install

```
$ git clone https://github.com/yokamaru/norikra-udf-netflow.git
$ cd norikra-udf-netflow
$ cp definition.yaml.sample definition.yaml
```

Note that you need to modify the `definition.yaml`.

```
$ vim definition.yaml
$ bundle exec rake gendef
$ bundle exec rake compile
$ bundle exec rake build
$ gem install -b pkg/norikra-udf-netflow-VERSION-java.gem
```

## License

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

Notice: This software includes [Apache Commons Net](http://commons.apache.org/proper/commons-net/) library which licensed under Apache Licence 2.0.
