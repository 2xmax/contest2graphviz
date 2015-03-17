contest2graphviz util
=====================

Converts popular graph description format used in programming competitions (ACM,
Yandex.contest) to Graphviz (*.dot) file format

Format:

```
V E
u_1 v_1 [optional weight1]
u_2 v_2 [optional weight2]
...
```

Example
========

Input file
```
5 5
1 2 2
2 3 54
3 4 76
5 3 8
1 5 5
```

will be converted to this dot file

```
digraph G {
	1 -> 2 [label="2"]
	2 -> 3 [label="54"]
	3 -> 4 [label="76"]
	5 -> 3 [label="8"]
	1 -> 5 [label="5"]
}
```

How to use
==========

1. Install graphviz (e.g by ```sudo apt-get install -y graphviz``` or ```sudo yum install -y graphviz```)
2. ```./graphviz.sh sample.in```

It will produce DOT and PNG files.
