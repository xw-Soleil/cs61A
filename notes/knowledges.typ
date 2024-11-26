#import "template.typ": *

#set page(height: 85em)
#show: project.with(
  theme: "nocover",
  author: "memset0",
)


= CS61A_Learning Points
== 关于print的一些点
在 Python 中，`print(a, b)` 表示同时打印变量 `a` 和 `b` 的值，中间会用一个默认的分隔符（通常是空格）隔开。如果 `a` 和 `b` 是字符串，具体的输出结果取决于它们的值。下面是详细解析：

=== 代码行为
假设 `a` 和 `b` 分别是字符串变量，比如：
```python
a = "hello"
b = "world"
print(a, b)
```

*输出结果*：
```
hello world
```

=== 发生的原因
1.  *`print` 函数的默认行为*：
   - `print()` 函数的参数可以接受任意多个值。
   - 当传入多个参数时，默认会在每个参数之间插入一个空格作为分隔符，除非通过 `sep` 参数显式更改。

   例如：
   ```python
   print(a, b, sep=",")
   ```
   输出结果会变成：
   ```
   hello,world
   ```

2. *字符串作为普通变量*：
   - 在 `print(a, b)` 中，`a` 和 `b` 只是字符串变量的值，它们会按照字符串的格式被直接输出。
   - 不会加上引号或者其他额外的修饰。

3. *可选的自定义分隔符*：
   - 如果没有设置 `sep` 参数，默认分隔符是一个空格。
   - 你可以通过设置 `sep=""` 使得输出没有分隔符：
     ```python
     print(a, b, sep="")
     ```
     输出结果会变成：
     ```
     helloworld
     ```

4. *换行行为*：
   - `print()` 会在每次输出结束后自动换行，这可以通过设置 `end` 参数来修改。

   例如：
   ```python
   print(a, b, end=".")
   ```
   输出结果会是：
   ```
   hello world.
   ```

=== 总结
`print(a, b)` 的输出结果是将 `a` 和 `b` 的值按默认分隔符（空格）拼接在一起并打印，具体内容依赖于 `a` 和 `b` 的值以及 `print()` 的参数设置。
