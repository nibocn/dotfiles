# Vim&Neovim
注：

- 未明确说明的情况下相关操作默认都是在 macOS 系统下进行。

## Java
### Linter
Linter install:

- macOS: `brew install checkstyle pmd`

### JRebel
> 使用 Gradle 构建 Spring Boot 项目并基于 JRebel 的代码变更热部署（理论上其它项目也是可以的）。

- 下载 JRebel 非 IDE 集成包： https://www.jrebel.com/products/jrebel/download/prev-releases
- 在 `~/.gradle/gradle.properties` 文件中配置 `jrebelAgent` 参数：
  ```jproperties
  # JRebel agent
  jrebelAgent=-agentpath:/usr/local/share/jrebel/jrebel/lib/libjrebel64.dylib
  ```

  官方参考： https://manuals.jrebel.com/jrebel/standalone/springboot.html

- 在项目的 `build.gradle` 文件中添加如下配置：
  ```groovy
  bootRun {
      if (project.hasProperty('jrebelAgent')) {
          jvmArgs += jrebelAgent
      }
  }
  ```
- 正常启动项目 `./gradlew bootRun`，查看输出日志是否有 jrebel 相关信息：
  ```
  > Task :bootRun
  2020-05-21 15:24:59 JRebel:  Starting logging to file: /Users/richard/.jrebel/jrebel.log
  2020-05-21 15:24:59 JRebel:
  2020-05-21 15:24:59 JRebel:  #############################################################
  2020-05-21 15:24:59 JRebel:
  2020-05-21 15:24:59 JRebel:  JRebel Agent 2020.2.1 (202004290936)
  2020-05-21 15:24:59 JRebel:  (c) Copyright 2007-2020 Perforce Software, Inc.
  2020-05-21 15:24:59 JRebel:
  2020-05-21 15:24:59 JRebel:
  2020-05-21 15:24:59 JRebel:  #############################################################
  2020-05-21 15:24:59 JRebel:
  2020-05-21 15:24:59.714  INFO [xxx-service,,,] 23983 --- [           main] org.springframework.context.annotation.AnnotationConfigApplicationContext : Refreshing org.springframework.context.annotation.AnnotationConfigApplicationContext@4678a2eb: startup date [Thu
  ```
- 在非 IDE 集成环境中要触发 jrebel 重新加载修改后的代码文件，需要触发代码的编译构建，在 Vim&Neovim 中可以使用一些异步任务插件配合 gradle、maven 来执行。这里推荐 [skywind3000/asynctasks.vim](https://github.com/skywind3000/asynctasks.vim) 插件。

- `.tasks` 文件配置：
  ```dosini
  # vim: set fenc=utf-8 ft=dosini:
  # define a new task named "file-build"
  [file-build]
  # working directory, can change to $(VIM_ROOT) for project root
  cwd=$(VIM_ROOT)
  # shell command, use quotation for filenames containing spaces
  # check ":AsyncTaskMacro" to see available macros
  command=/bin/bash -c "$(VIM_ROOT)/gradlew compileJava"
  # output mode, can be one of quickfix and terminal
  # - quickfix: output to quickfix window
  # - terminal: run the command in the internal terminal
  output=quickfix
  # this is for output=quickfix only
  # if it is omitted, vim's current errorformat will be used.
  errorformat=%f:%l:%m
  # save file before execute
  save=1
  ```

在 vim 中 jrebel 的集成就基本完成了。

## Vimscript
### Linter

Linter install:

- `pip3 install vim-vint`;
- `npm install -g vim-language-server`;
