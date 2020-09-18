<img src="./cairn.svg" width="250"/>

# Cairn
Cairn is a simple PHP site builder script written for use in several LugoCorp web projects. But now you too can build your PHP-templated websites with a single command! Cairn adapts to your project layout, converting every `index.php` into an `index.html` at a corresponding path in the build folder. It also copies over all non-PHP files to their correct paths, including files found in symbolically linked directories. For more information visit the [Cairn website](https://alugocp.github.io/cairn).

## Installation
To install your local copy of Cairn as a system-wide command simply run the following:

```bash
sudo cp cairn.sh /usr/bin/cairn
```

Or if you're reading this on GitHub run this:
```bash
curl https://raw.githubusercontent.com/alugocp/cairn/main/cairn.sh > cairn.sh
mv cairn.sh /usr/bin/cairn
```
**note** always be careful when running a command you found online!

## Usage
```
Usage: cairn <src> <dst>
  src - the project directory to be built
  dst - the build destination
```
Run the command with a source and destination (build) folder as parameters.
