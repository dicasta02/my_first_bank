#!/bin/sh
cat <<EOF
Bloc Builder

**First Uppercase**
Define Class Name (IE: Family):
EOF

read name

ext="_bloc.dart"
test_ext="_bloc_test.dart"
SNAKE_NAME=$(echo $name | sed 's/\([A-Z]\)/_\1/g;s/^_//' | tr '[:upper:]' '[:lower:]')
filename=$(echo $SNAKE_NAME$ext)
filenameTest=$(echo $SNAKE_NAME$test_ext | tr '[:upper:]' '[:lower:]')
path="./lib/blocs/"
test_path="./test/blocs/"

BLOC_CLASS=$name"Bloc"

# include parse_yaml function
. scripts/parse_yaml.sh

eval $(parse_yaml pubspec.yaml "yaml_")

FILE=$path$filename
clear
echo "CREATING BLOC..."
if [ -f "$FILE" ]; then
cat <<EOF
  BLOC ALREADY EXISTS!!
    PATH: $FILE
EOF
else 

cat > $FILE << EOF 
import 'package:$yaml_name/blocs/provider/bloc.dart';
import 'package:rxdart/rxdart.dart';

class $BLOC_CLASS extends Bloc {
  final _exampleSubject = BehaviorSubject<String>();

  ValueStream<String> get example => _exampleSubject.stream;

  @override
  void dispose() {
    _exampleSubject.close();
  }
}
EOF

bloc=$name"Bloc _bloc;"

cat > $test_path$filenameTest << EOF
import 'package:$yaml_name/blocs/$filename';

void main() {
//TODO: Add implementations
  $bloc
}
EOF
cat <<EOF
  BLOC CREATED
  PATH: $FILE
EOF

echo "CREATING PAGE..."

PAGE_PATH="./lib/ui/"$SNAKE_NAME"_page.dart"
PAGE_CLASS=$name"Page"
PAGE_STATE="_"$PAGE_CLASS"State"
cat > $PAGE_PATH <<EOF
import 'package:flutter/material.dart';
import 'package:$yaml_name/ui/base_state.dart';
import 'package:$yaml_name/blocs/$filename';

class $PAGE_CLASS extends StatefulWidget {
  @override
  $PAGE_STATE createState() => $PAGE_STATE();
}

class $PAGE_STATE extends BaseState<$PAGE_CLASS, $BLOC_CLASS> {

  @override
  $BLOC_CLASS getBlocInstance() {
    return $BLOC_CLASS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

EOF
fi