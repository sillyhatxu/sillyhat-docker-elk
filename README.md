# cloud

## Introduction

### Elastic

* [Elasticsearch](https://hub.docker.com/r/jenkins/jenkins/) - Elasticsearch
* [Logstash](https://github.com/jenkinsci/docker/blob/master/README.md) - Logstash
* [Kibana](https://github.com/jenkinsci/docker/blob/master/README.md) - Kibana


#### elk-project-log

根据日志 (json) 格式 字段 (project)创建index -> `#{project}-YYYY-MM-DD`

**json**

```
{"project":"image-server","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:49","func":"main.main","level":"debug","message":"This is debug. It has field.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
{"project":"image-server","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:50","func":"main.main","level":"info","message":"This is debug. It has field.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
{"project":"image-server","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:51","func":"main.main","level":"info","message":"This is debug. olallala It has field.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
{"project":"image-server","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:52","func":"main.main","level":"error","message":"Project ERROR....This is ERROR.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
{"project":"game-api","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:53","func":"main.main","level":"debug","message":"This is debug. It has field.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
{"project":"game-api","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:54","func":"main.main","level":"info","message":"This is debug. It has field.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
{"project":"game-api","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:55","func":"main.main","level":"info","message":"This is debug. olallala It has field.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
{"project":"game-api","file":"/Users/cookie/go/gopath/src/image-server/logtest/test.go:56","func":"main.main","level":"error","message":"Project ERROR....This is ERROR.","module":"mode-test","time":"2019-03-19T11:05:45+08:00"}
```

> Create index image-server-2019-03-19
>
> Create index game-api-2019-03-19

**deploy**
```
Cookies-MacBook-Pro:sillyhat-docker-elk cookie$ cd elk-project-log/
Cookies-MacBook-Pro:elk-project-log cookie$ docker stack deploy -c docker-compose.yml elk
Creating network elk_elk
Creating service elk_elasticsearch
Creating service elk_kibana
Creating service elk_logstash
```

* [Time Zones](http://joda-time.sourceforge.net/timezones.html) - Time Zones


> 替换test_time字段为 @timestamp 并删除，未生效

**待解决**

```
filter {
  date {
     match => ["test_time","YYYY-MM-dd HH:mm:ss.SSS"]
     timezone => "Asia/Singapore"
     locale => "en"
     target => "@timestamp"
     remove_field => [ "test_time" ]
  }
}
```