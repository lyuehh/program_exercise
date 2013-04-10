#!/usr/bin/env io

System getEnvironmentVariable("PATH") split(":") reduce(a,b,a push(Directory with(b) items reduce(a,b,a push(b name),list())), list()) flatten  select(a, a != "." and a != "..") sort join("\n") println
