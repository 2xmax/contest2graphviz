INPUT_FILE=$1
DOT_FILE=$INPUT_FILE.dot
PNG_FILE=$INPUT_FILE.png

if [ "$INPUT_FILE" = "" ]; then
	echo "usage: ./graphviz.sh input_file"
	exit
fi

rm -rf "$PNG_FILE" "$DOT_FILE"

# dot file generation

echo "digraph G {" > "$DOT_FILE"

	{
		read line;
		while read line; do
			ps=($line)
			source=${ps[0]}
			target=${ps[1]}
			weight=${ps[2]}
			echo "$source -> $target [label=\"$weight\"]" >> "$DOT_FILE"
		done 
	} < "$INPUT_FILE"

echo "}" >> "$DOT_FILE"

# rendering
dot -Tpng "$DOT_FILE" > "$PNG_FILE"

# open the png file
if command -v xdg-open &> /dev/null
then
	xdg-open "$PNG_FILE"
elif command -v gnome-open &> /dev/null
then
	gnome-open "$PNG_FILE"
fi
