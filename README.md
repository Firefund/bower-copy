bower-copy
=================

Forked from https://github.com/scivey/bower-copy/

Copy main script files of bower components to an arbitrary destination directory, or resolve a list of component names paired with paths to their main scripts.  Usable on the command line and as a `require`d module.


```bash
$	bower-copy -d ./public/js
$	bower-copy -s ./someDir/bower_components -d ./public/js
```

```javascript
var copyComponents = require("bower-copy").copyComponents;

copyComponents({dest: "./serve/js/vendor"}, function(err, copied) {
	// main script files are copied to `dest` dir.
	// `copied` is a list of src->dest pairs.
});



```


Installation
------------

    npm install bower-copy -g


Command Line
------------
###bower-copy
Copy bower components' main scripts to a target directory.
- `-s`, `--src`: path to bower's component directory, defaulting to `./bower_components`.
- `-d`, `--dest`: path to output directory.  The directory is recursively created if it doesn't exist.
- `-r`, `--resolve`: when passed the `-r` flag, `bower-copy` will output the components' names and the paths to their main scripts in JSON format.  The files won't actually be copied.  This is equivalent to calling `resolveComponents` throug the API.


API
------------
###copyComponents(options, callback)
Copies all bower components to `{dest}/{component_name}.js`, and returns a list of src -> dest pairs for reference.
- `options` is a hash with parameters as its properties:
	- `options.src` is the root `bower_components` directory.  It defaults to `{PROJECT_DIR}/bower_components`.
	- `options.dest` is the target directory, which will contain the main script files.
	- `options.newer` if set to `true`, then only only copy the bower `main` file if it is newer than the corresponding file in in the target directory.
- `callback` has an `err, results` signature, where `results` is an array of objects with `src` and `dest` properties -- one for each script copied.

###resolveComponents([componentDir,] callback)
Returns a list of objects indicating the name (`component`) and main script path (`main`) of each component.  This doesn't do any file copying on its own.
- `componentDir` is the path to `bower_components`.  If only `callback` is passed, this defaults to `{PROJECT_DIR}/bower_components`.
- `callback` has an `err, results` signature, where `results` is an array of objects with `component` and `main` properties.  `component` is the component's name, and `main` is the path to its main script.

Changelog
------------

### 0.3.0 ###
- Added the `newer` flag to the `options` object, which will only copy the bower `main` file(s) if it
is newer than the corresponding file in in the target directory.

### 0.2.0 ###
- Added support for multiple 'main' files in bower.json

### 0.1.0 ###
- Added command line interface for global install.
- Destination directory is created if it doesn't exist (recursively, with `fs-extra`'s `#mkdirs` method).

### 0.0.2 ###
- Now uses`.bower.json` by default, and only resorts to loading `package.json` if `.bower.json` does not specify a `main` property.
- Correctly handles components with relative path values for `main`, e.g. `./lib/index.js`.  These are rewritten in the form of `{COMPONENT_NAME}/lib/index.js`.

### 0.0.1 ###
- Initial release

GitHub
------------
https://github.com/Firefund/bower-copy


License
------------
MIT License (MIT)

Copyright (c) 2013 Scott Ivey, <scott.ivey@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
